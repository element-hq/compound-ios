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
import UIKit

public extension UIColor {
    /// The colours used by Element as defined in Compound Design Tokens.
    static let compound = CompoundUIColors()
}

/// The colours used by Element as defined in Compound Design Tokens.
/// This struct contains only the colour tokens in a more usable form.
public struct CompoundUIColors {
    /// The raw compound tokens.
    ///
    /// Note: Whilst this references `CompoundLightDesignTokens`, all generated tokens are aware
    /// of dark and high contract variants the generated collections each contain the same token set.
    private static let compound = CompoundUIColorTokens.self
    
    public let iconOnSolidPrimary = compound.colorIconOnSolidPrimary
    public let iconInfoPrimary = compound.colorIconInfoPrimary
    public let iconSuccessPrimary = compound.colorIconSuccessPrimary
    public let iconCriticalPrimary = compound.colorIconCriticalPrimary
    public let iconAccentPrimary = compound.colorIconAccentPrimary
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
    // public let bgSubtleSecondaryLevel0 = compound.colorBgSubtleSecondaryLevel0
    public let bgAccentPressed = compound.colorBgAccentPressed
    public let bgAccentHovered = compound.colorBgAccentHovered
    public let bgAccentRest = compound.colorBgAccentRest
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
    // public let bgCanvasDefaultLevel1 = compound.colorBgCanvasDefaultLevel1
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
    
    // MARK: - Elevation Tokens
    // This is a workaround until they are generated correctly
    
    public let bgSubtleSecondaryLevel0 = UIColor { $0.isLight ? compound.colorGray300 : compound.colorThemeBg }
    public let bgCanvasDefaultLevel1 = UIColor { $0.isLight ? compound.colorThemeBg : compound.colorGray300 }
    
    // MARK: - Awaiting Semantic Tokens
    
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _borderTextFieldFocused = compound.colorGray500
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgReactionButton = UIColor { $0.isLight ? compound.colorGray200 : compound.colorGray600 }
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgBubbleIncoming = UIColor { $0.isLight ? compound.colorGray300 : compound.colorGray400 }
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgBubbleOutgoing = UIColor { $0.isLight ? compound.colorGray400 : compound.colorGray500 }
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgCodeBlock = UIColor { $0.isLight ? compound.colorGray500 : compound.colorGray700 }
    
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _borderInteractiveSecondaryAlpha = compound.colorAlphaGray600
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgSubtleSecondaryAlpha = compound.colorAlphaGray300
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgCriticalSubtleAlpha = compound.colorAlphaRed300
}

private extension UITraitCollection {
    /// Whether or not the trait collection contains a `userInterfaceStyle` of `.light`.
    var isLight: Bool { userInterfaceStyle == .light }
}
