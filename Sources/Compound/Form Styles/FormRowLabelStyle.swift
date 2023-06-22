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


public extension LabelStyle where Self == FormRowLabelStyle {
    /// A label style that applies Compound design tokens for a row within a `Form`.
    /// - Parameter alignment: The vertical alignment between the label's icon and title.
    static func compoundFormRow(alignment: VerticalAlignment = .firstTextBaseline) -> FormRowLabelStyle {
        FormRowLabelStyle(alignment: alignment)
    }
}

/// Default label styling for form rows.
///
/// The icon will be inset inside a square with rounded corners and the title
/// will be given the correct font and colour.
public struct FormRowLabelStyle: LabelStyle {
    @ScaledMetric private var menuIconSize = 30.0
    
    var alignment: VerticalAlignment = .firstTextBaseline

    public func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: alignment, spacing: 16) {
            configuration.icon
                .foregroundColor(.compound.iconTertiaryAlpha)
                .padding(4)
                .frame(width: menuIconSize, height: menuIconSize)
                .background(Color.compound._bgSubtleSecondaryAlpha)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            configuration.title
                .font(.compound.bodyLG)
                .foregroundColor(.compound.textPrimary)
        }
    }
}

public struct FormRowLabelStyle_Previews: PreviewProvider {
    public static var previews: some View {
        Form {
            Section {
                states
            }
            .compoundFormSection()
        }
        .compoundForm()
    }
    
    @ViewBuilder
    public static var states: some View {
        Label("Person", systemImage: "person")
            .labelStyle(FormRowLabelStyle())
        
        Label("Help", systemImage: "questionmark.circle")
            .labelStyle(FormRowLabelStyle())
        
        Label("Camera", systemImage: "camera")
            .labelStyle(FormRowLabelStyle())
        
        Label("Help", systemImage: "questionmark")
            .labelStyle(FormRowLabelStyle())
    }
}
