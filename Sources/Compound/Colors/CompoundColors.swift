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

import CompoundDesignTokens
import SwiftUI

public extension Color {
    /// The colours used by Element as defined in Compound Design Tokens.
    static let compound = CompoundColors()
}

/// The colours used by Element as defined in Compound Design Tokens.
/// This struct contains only the colour tokens in a more usable form.
public struct CompoundColors {
    /// The raw compound tokens.
    ///
    /// Note: Whilst this references `CompoundLightDesignTokens`, all generated tokens are aware
    /// of dark and high contract variants the generated collections each contain the same token set.
    private static let compound = CompoundLightDesignTokens.self
    
    public let iconAccentTertiary = compound.colorIconAccentTertiary
    public let iconQuaternary = compound.colorIconQuaternary
    public let iconTertiary = compound.colorIconTertiary
    public let iconSecondary = compound.colorIconSecondary
    public let iconPrimary = compound.colorIconPrimary
    public let textLinkExternal = compound.colorTextLinkExternal
    public let textActionCritical = compound.colorTextActionCritical
    public let textActionAccent = compound.colorTextActionAccent
    public let textActionPrimary = compound.colorTextActionPrimary
    public let textDisabled = compound.colorTextDisabled
    public let textPlaceholder = compound.colorTextPlaceholder
    public let textSecondary = compound.colorTextSecondary
    public let textPrimary = compound.colorTextPrimary
    public let bgActionPrimary = compound.colorBgActionPrimary
    public let bgSecondary = compound.colorBgSecondary
    public let bgPrimary = compound.colorBgPrimary
    public let bgCanvas = compound.colorBgCanvas
    
    // MARK: - Custom
    
    /// The colour to use on the background of a Form or grouped List.
    ///
    /// This colour is a special case as it uses `colorBgSecondary` in light mode and `???` in dark mode.
    public let formBackground = Color(UIColor { collection in
        collection.userInterfaceStyle == .light ? UIColor(compound.colorBgSecondary) : UIColor(compound.colorBgCanvas)
    })
    
    /// The background colour of a row in a Form or grouped List.
    ///
    /// This colour is a special case as it uses `colorBgCanvas` in light mode and `???` in dark mode.
    public var formRowBackground = Color(UIColor { collection in
        collection.userInterfaceStyle == .light ? UIColor(compound.colorBgCanvas) : UIColor(compound.colorBgSecondary)
    })
}
