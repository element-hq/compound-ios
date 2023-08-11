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

public extension ToggleStyle where Self == CompoundToggleStyle {
    /// A toggle style that applies Compound design tokens to display a Switch row within a `Form`.
    static var compound: CompoundToggleStyle {
        CompoundToggleStyle()
    }
}

/// Default toggle styling for form rows.
///
/// The toggle is given the form row label style and is tinted correctly.
public struct CompoundToggleStyle: ToggleStyle {
    public func makeBody(configuration: Configuration) -> some View {
        Toggle(isOn: configuration.$isOn) {
            configuration.label
                .foregroundColor(.compound.textPrimary)
        }
        .tint(.compound.iconAccentTertiary)
    }
}

public struct CompoundToggleStyle_Previews: PreviewProvider {
    public static var previews: some View {
        VStack(spacing: 16) {
            states
        }
        .padding(32)
    }
    
    @ViewBuilder
    public static var states: some View {
        VStack(spacing: 16) {
            Toggle("Title", isOn: .constant(false))
                .toggleStyle(.compound)
                .labelsHidden()
            
            Toggle("Title", isOn: .constant(true))
                .toggleStyle(.compound)
                .labelsHidden()
        }
        .padding(.bottom, 32)
        
        VStack(spacing: 16) {
            Toggle("Title", isOn: .constant(true))
                .toggleStyle(.compound)
            Toggle("Title", isOn: .constant(false))
                .toggleStyle(.compound)
            
            Toggle(isOn: .constant(true)) {
                Label("Title", systemImage: "square.dashed")
            }
            .toggleStyle(.compound)
            Toggle(isOn: .constant(false)) {
                Label("Title", systemImage: "square.dashed")
            }
            .toggleStyle(.compound)
        }
    }
}
