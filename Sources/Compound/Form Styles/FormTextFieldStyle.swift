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

public extension TextFieldStyle where Self == FormTextFieldStyle {
    /// A text field style that applies Compound design tokens to for display within a `Form`.
    static var compoundForm: FormTextFieldStyle {
        FormTextFieldStyle()
    }
}

public extension Text {
    /// Styles a text with the Compound design tokens to be displayed as a text field placeholder.
    func compoundFormTextFieldPlaceholder() -> Text {
        font(.compound.bodyLG)
            .foregroundColor(.compound.textPlaceholder)
    }
}

/// Default text field styling for form rows.
///
/// The field has custom insets and a tint applied to the caret and text selection.
public struct FormTextFieldStyle: TextFieldStyle {
    public func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .tint(.compound.iconAccentTertiary)
            .listRowInsets(EdgeInsets(top: 11, leading: 16, bottom: 11, trailing: 16))
    }
}

public struct FormTextFieldStyle_Previews: PreviewProvider {
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
        TextField("Tell us about it…",
                  text: .constant(""),
                  prompt: Text("Tell us about it…").compoundFormTextFieldPlaceholder())
            .textFieldStyle(.compoundForm)
        
        TextField("Tell us about it…",
                  text: .constant(""),
                  prompt: Text("Tell us about it…").compoundFormTextFieldPlaceholder(),
                  axis: .vertical)
            .lineLimit(4, reservesSpace: true)
            .textFieldStyle(.compoundForm)
        
        TextField("Tell us about it…",
                  text: .constant("This text field contains some text that somebody entered not all that long ago."),
                  prompt: Text("Tell us about it…").compoundFormTextFieldPlaceholder(),
                  axis: .vertical)
            .lineLimit(4, reservesSpace: true)
            .textFieldStyle(.compoundForm)
    }
}
