//
// Copyright 2022-2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only
// Please see LICENSE in the repository root for full details.
//

import Prefire
import SwiftUI

public extension Text {
    /// Styles a text with the Compound design tokens to be displayed as a text field placeholder.
    func compoundTextFieldPlaceholder() -> Text {
        font(.compound.bodyLG)
            .foregroundColor(.compound.textPlaceholder)
    }
}
