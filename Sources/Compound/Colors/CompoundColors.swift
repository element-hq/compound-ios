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
    
    public let iconOnSolidPrimary = compound.colorIconOnSolidPrimary
    public let iconInfoPrimary = compound.colorIconInfoPrimary
    public let iconSuccessPrimary = compound.colorIconSuccessPrimary
    public let iconCriticalPrimary = compound.colorIconCriticalPrimary
    public let iconAccentTertiary = compound.colorIconAccentTertiary
    public let iconQuaternaryAlpha = compound.colorIconQuaternaryAlpha
    public let iconTertiaryAlpha = compound.colorIconTertiaryAlpha
    public let iconSecondaryAlpha = compound.colorIconSecondaryAlpha
    public let iconPrimaryAlpha = compound.colorIconPrimaryAlpha
    public let iconDisabled = compound.colorIconDisabled
    public let iconQuaternary = compound.colorIconQuaternary
    public let iconTertiary = compound.colorIconTertiary
    public let iconSecondary = compound.colorIconSecondary
    public let iconPrimary = compound.colorIconPrimary
    public let borderInfoSubtle = compound.colorBorderInfoSubtle
    public let borderSuccessSubtle = compound.colorBorderSuccessSubtle
    public let borderCriticalSubtle = compound.colorBorderCriticalSubtle
    public let borderCriticalHovered = compound.colorBorderCriticalHovered
    public let borderCriticalPrimary = compound.colorBorderCriticalPrimary
    public let borderInteractiveHovered = compound.colorBorderInteractiveHovered
    public let borderInteractiveSecondary = compound.colorBorderInteractiveSecondary
    public let borderInteractivePrimary = compound.colorBorderInteractivePrimary
    public let borderFocused = compound.colorBorderFocused
    public let borderDisabled = compound.colorBorderDisabled
    public let bgSubtleSecondaryLevel0 = compound.colorBgSubtleSecondaryLevel0
    public let bgInfoSubtle = compound.colorBgInfoSubtle
    public let bgSuccessSubtle = compound.colorBgSuccessSubtle
    public let bgCriticalSubtleHovered = compound.colorBgCriticalSubtleHovered
    public let bgCriticalSubtle = compound.colorBgCriticalSubtle
    public let bgCriticalHovered = compound.colorBgCriticalHovered
    public let bgCriticalPrimary = compound.colorBgCriticalPrimary
    public let bgActionSecondaryPressed = compound.colorBgActionSecondaryPressed
    public let bgActionSecondaryHovered = compound.colorBgActionSecondaryHovered
    public let bgActionSecondaryRest = compound.colorBgActionSecondaryRest
    public let bgActionPrimaryDisabled = compound.colorBgActionPrimaryDisabled
    public let bgActionPrimaryPressed = compound.colorBgActionPrimaryPressed
    public let bgActionPrimaryHovered = compound.colorBgActionPrimaryHovered
    public let bgActionPrimaryRest = compound.colorBgActionPrimaryRest
    public let bgCanvasDefaultLevel1 = compound.colorBgCanvasDefaultLevel1
    public let bgCanvasDisabled = compound.colorBgCanvasDisabled
    public let bgCanvasDefault = compound.colorBgCanvasDefault
    public let bgSubtleSecondary = compound.colorBgSubtleSecondary
    public let bgSubtlePrimary = compound.colorBgSubtlePrimary
    public let textOnSolidPrimary = compound.colorTextOnSolidPrimary
    public let textInfoPrimary = compound.colorTextInfoPrimary
    public let textSuccessPrimary = compound.colorTextSuccessPrimary
    public let textCriticalPrimary = compound.colorTextCriticalPrimary
    public let textLinkExternal = compound.colorTextLinkExternal
    public let textActionAccent = compound.colorTextActionAccent
    public let textActionPrimary = compound.colorTextActionPrimary
    public let textDisabled = compound.colorTextDisabled
    public let textPlaceholder = compound.colorTextPlaceholder
    public let textSecondary = compound.colorTextSecondary
    public let textPrimary = compound.colorTextPrimary
    
    // MARK: - Awaiting Semantic Tokens
    
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _borderRowSeparator = compound.colorGray400
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _borderTextFieldFocused = compound.colorGray500
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgReactionButton = compound.colorGray200
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgBubbleIncoming = Color(UIColor { $0.isLight ? UIColor(compound.colorGray300) : UIColor(compound.colorGray400) })
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgBubbleOutgoing = Color(UIColor { $0.isLight ? UIColor(compound.colorGray400) : UIColor(compound.colorGray500) })
    
    // MARK: - Core Colors
    
    /// The core colours used to assemble all of the semantic tokens.
    ///
    /// Direct use of these core colours should only be occasional, the majority of components
    /// and styles within the app should be based on the semantic tokens instead. Please only
    /// use these within the package, instead adding temporary semantic tokens for external use.
    let core = CoreColors()
    
    struct CoreColors {
        /// The raw compound tokens.
        private static let compound = CompoundLightDesignTokens.self
        
        /// Will be available as `color.bg.subtle-secondary-alpha`.
        let alphaGray300 = compound.colorAlphaGray300
    }
}

private extension UITraitCollection {
    /// Whether or not the trait collection contains a `userInterfaceStyle` of `.light`.
    var isLight: Bool { userInterfaceStyle == .light }
}
