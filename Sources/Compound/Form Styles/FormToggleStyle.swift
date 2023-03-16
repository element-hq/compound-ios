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

public extension ToggleStyle where Self == FormToggleStyle {
    static func compoundForm() -> FormToggleStyle {
        FormToggleStyle()
    }
}

public struct FormToggleStyle: ToggleStyle {
    public func makeBody(configuration: Configuration) -> some View {
        Toggle(isOn: configuration.$isOn) {
            configuration.label
                .labelStyle(.compoundFormRow())
        }
        .tint(.compound.bgActionPrimary)
    }
}

public struct FormToggleStyle_Previews: PreviewProvider {
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
        Toggle(isOn: .constant(true)) {
            Label("Notifications", systemImage: "bell")
        }
        .toggleStyle(.compoundForm())
        Toggle(isOn: .constant(false)) {
            Label("Enable sound", systemImage: "speaker.wave.2")
        }
        .toggleStyle(.compoundForm())
        
        Toggle("Enable analytics", isOn: .constant(true))
            .toggleStyle(.compoundForm())
        Toggle("Show removed messages", isOn: .constant(false))
            .toggleStyle(.compoundForm())
    }
}
