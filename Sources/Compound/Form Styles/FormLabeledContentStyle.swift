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

public extension LabeledContentStyle where Self == FormLabeledContentStyle {
    /// A labeled content style that applies Compound design tokens for a row within a `Form`.
    /// - Parameter labelStyle: An optional, custom style to apply to the label.
    static func compoundForm(labelStyle: FormRowLabelStyle? = nil) -> FormLabeledContentStyle {
        FormLabeledContentStyle(labelStyle: labelStyle)
    }
}

/// Default labeled content styling for form rows.
///
/// The icon will be inset inside a square with rounded corners and the title
/// will be given the correct font and colour.
public struct FormLabeledContentStyle: LabeledContentStyle {
    /// An optional, custom style to apply to the label.
    let labelStyle: FormRowLabelStyle?
    
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .frame(maxWidth: .infinity, alignment: .leading)
                .labelStyle(labelStyle ?? .compoundFormRow())
            
            configuration.content
                .foregroundColor(.compound.textSecondary)
                .labelStyle(FormRowContentLabelStyle())
        }
    }
}

/// The style of the content of a labelled content row in a Form.
private struct FormRowContentLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 8) {
            configuration.title
                .foregroundColor(.compound.textSecondary)
            configuration.icon
                .foregroundColor(.compound.iconPrimary)
        }
        .font(.compound.bodyLG)
    }
}

public struct FormLabeledContentStyle_Previews: PreviewProvider {
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
        LabeledContent {
            Text("50")
        } label: {
            Label("Members", systemImage: "person")
        }
        .labeledContentStyle(.compoundForm())
        
        Button { } label : {
            LabeledContent {
                Text("Custom")
            } label: {
                Label("Notifications", systemImage: "bell")
            }
        }
        .buttonStyle(.compoundForm(accessory: .navigationLink))
        
        Button { } label : {
            LabeledContent {
                Label("Content", systemImage: "square.dashed")
            } label: {
                Label("Title", systemImage: "square.dashed")
            }
        }
        .buttonStyle(.compoundForm(secondaryText: "Some description", accessory: .navigationLink))
        
        LabeledContent {
            ProgressView()
        } label: {
            Label("Invites", systemImage: "envelope.badge")
        }
        .labeledContentStyle(.compoundForm())
    }
}
