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

/// Label styling for form buttons that have a centered label.
public struct FormRowCenteredLabelStyle: LabelStyle {
    @Environment(\.isEnabled) private var isEnabled
    
    /// A value that describes the purpose of a row.
    public enum Role { case destructive }
    
    /// An optional semantic role describing the row's purpose.
    let role: Role?
    /// The vertical alignment between the label's icon and title.
    let alignment: VerticalAlignment
    
    var titleColor: Color {
        guard isEnabled else { return .compound.textDisabled }
        return role == .destructive ? .compound.textCriticalPrimary : .compound.textPrimary
    }
    
    var iconForegroundColor: Color {
        guard isEnabled else { return .compound.iconTertiaryAlpha }
        return role == .destructive ? .compound.textCriticalPrimary : .compound.iconTertiaryAlpha
    }

    public func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: alignment, spacing: 8) {
            configuration.icon
                .foregroundColor(iconForegroundColor)
            
            VStack(alignment: .leading, spacing: 2) {
                configuration.title
                    .font(.compound.bodyLG)
                    .foregroundColor(titleColor)
            }
        }
    }
}
