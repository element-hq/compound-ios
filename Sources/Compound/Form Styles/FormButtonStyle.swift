//
// Copyright 2023 New Vector Ltd
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import SwiftUI

public extension PrimitiveButtonStyle where Self == FormButtonStyle {
    /// A button style that applies Compound design tokens for a tappable row within a `Form`.
    /// - Parameter accessory: An optional accessory to be added on the trailing side of the row.
    static func compoundForm(accessory: FormRowAccessory? = nil) -> FormButtonStyle {
        FormButtonStyle(accessory: accessory)
    }
}

/// A view to be added on the trailing edge of a form row.
public enum FormRowAccessory: View {
    /// A chevron to indicate that the button pushes another screen.
    case navigationLink
    
    public var body: some View {
        switch self {
        case .navigationLink:
            return Image(systemName: "chevron.forward")
                .font(.compound.bodySMSemibold)
                .foregroundColor(.compound.iconTertiaryAlpha)
        }
    }
}

/// Default button styling for form rows.
///
/// The primitive style is needed to set the list row insets to `0`. The inner style is then needed
/// to change the background colour depending on whether the button is currently pressed or not.
public struct FormButtonStyle: PrimitiveButtonStyle {
    /// An accessory to be added on the trailing side of the row.
    var accessory: FormRowAccessory?
    
    public func makeBody(configuration: Configuration) -> some View {
        Button(action: configuration.trigger) {
            configuration.label
                .frame(maxHeight: .infinity) // Make sure the label fills the cell vertically.
        }
        .buttonStyle(Style(accessory: accessory))
        .listRowInsets(EdgeInsets()) // Remove insets so the background fills the cell.
    }
    
    /// Inner style used to set the pressed background colour.
    struct Style: ButtonStyle {
        var accessory: FormRowAccessory?
        
        func makeBody(configuration: Configuration) -> some View {
            HStack {
                configuration.label
                    .labelStyle(.compoundFormRow())
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                accessory
            }
            .contentShape(Rectangle())
            .padding(FormRow.insets) // Re-apply the normal insets using padding.
            .background(configuration.isPressed ? Color.compound.bgSubtlePrimary : .compound.bgCanvasDefaultLevel1)
        }
    }
}

public struct FormButtonStyle_Previews: PreviewProvider {
    public static var previews: some View {
        Form {
            Section {
                states
            }
            .compoundFormSection()
            
            Section {
                ShareLink(item: "test")
                    .buttonStyle(FormButtonStyle())
            }
            .compoundFormSection()
        }
        .compoundForm()
    }
    
    @ViewBuilder
    public static var states: some View {
        Button { } label: {
            Label("Open in browser", systemImage: "globe")
        }
        .buttonStyle(FormButtonStyle())
        
        Button { } label: {
            Label("Navigate to screen", systemImage: "rectangle.portrait")
        }
        .buttonStyle(FormButtonStyle(accessory: .navigationLink))
        
        Button { } label: {
            Text("Mark as read")
        }
        .buttonStyle(FormButtonStyle())
    }
}
