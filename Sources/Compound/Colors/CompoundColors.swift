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
    public let textCriticalPrimary = compound.colorTextCriticalPrimary
    public let textActionAccent = compound.colorTextActionAccent
    public let textActionPrimary = compound.colorTextActionPrimary
    public let textDisabled = compound.colorTextDisabled
    public let textPlaceholder = compound.colorTextPlaceholder
    public let textSecondary = compound.colorTextSecondary
    public let textPrimary = compound.colorTextPrimary
    public let bgActionPrimaryRest = compound.colorBgActionPrimaryRest
    public let bgSubtleSecondary = compound.colorBgSubtleSecondary
    public let bgSubtlePrimary = compound.colorBgSubtlePrimary
    public let bgCanvas = compound.colorBgCanvasDefault
    
    // MARK: - Core Colors
    
    /// The core colours used to assemble all of the semantic tokens.
    ///
    /// Direct use of these core colours should only be occasional, the majority of components
    /// and styles within the app should be based on the semantic tokens instead.
    let core = CoreColors()
    
    struct CoreColors {
        /// The raw compound tokens.
        private static let compound = CompoundLightDesignTokens.self
        
        /// Will be available as `color.bg.subtle-secondary-alpha`.
        let alphaGray300 = compound.colorAlphaGray300
    }
}
