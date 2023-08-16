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

/// A view to be added on the trailing edge of a form row.
public enum ListRowAccessory: View {
    /// A chevron to indicate that the button pushes another screen.
    case navigationLink
    /// A checkmark (when `true`) to indicate that the row is selected.
    case selected
    
    public var body: some View {
        switch self {
        case .navigationLink:
            CompoundIcon(\.chevronRight)
                .font(.system(size: 24))
                .foregroundColor(.compound.iconTertiaryAlpha)
                .flipsForRightToLeftLayoutDirection(true)
        case .selected:
            CompoundIcon(\.check)
                .font(.system(size: 24))
                .foregroundColor(.compound.iconPrimary)
                .accessibilityAddTraits(.isSelected)
                .padding(.vertical, -4)
        }
    }
}
