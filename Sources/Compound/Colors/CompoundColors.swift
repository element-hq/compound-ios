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
    private static let compound = CompoundColorTokens.self
    
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
    // public let bgSubtleSecondaryLevel0 = compound.colorBgSubtleSecondaryLevel0
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
    
    public let bgSubtleSecondaryLevel0 = Color(UIColor { $0.isLight ? UIColor(compound.colorGray300) : UIColor(compound.colorThemeBg) })
    public let bgCanvasDefaultLevel1 = Color(UIColor { $0.isLight ? UIColor(compound.colorThemeBg) : UIColor(compound.colorGray300) })
    
    // MARK: - Avatar Colors
    // Used to determine the background color and the foreground color of an avatar.
    
    // Order matches the one from web
    // https://github.com/vector-im/compound-web/blob/5dda11aa9733462fb8422968181275bc3e9b35e3/src/components/Avatar/Avatar.module.css#L64
    internal let avatarColors: [AvatarColor] = [
        .init(background: compound.colorBlue300, foreground: compound.colorBlue1200),
        .init(background: compound.colorFuchsia300, foreground: compound.colorFuchsia1200),
        .init(background: compound.colorGreen300, foreground: compound.colorGreen1200),
        .init(background: compound.colorPink300, foreground: compound.colorPink1200),
        .init(background: compound.colorOrange300, foreground: compound.colorOrange1200),
        .init(background: compound.colorCyan300, foreground: compound.colorCyan1200),
        .init(background: compound.colorPurple300, foreground: compound.colorPurple1200),
        .init(background: compound.colorLime300, foreground: compound.colorLime1200)
    ]
    
    public func avatarColor(for contentID: String) -> AvatarColor {
        avatarColors[contentID.hashCode]
    }
    
    // MARK: - Awaiting Semantic Tokens
    
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _borderTextFieldFocused = compound.colorGray500
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgReactionButton = Color(UIColor { $0.isLight ? UIColor(compound.colorGray200) : UIColor(compound.colorGray600) })
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgBubbleIncoming = Color(UIColor { $0.isLight ? UIColor(compound.colorGray300) : UIColor(compound.colorGray400) })
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgBubbleOutgoing = Color(UIColor { $0.isLight ? UIColor(compound.colorGray400) : UIColor(compound.colorGray500) })
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgCodeBlock = compound.colorGray100
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _borderInteractiveSecondaryAlpha = compound.colorAlphaGray600
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgSubtleSecondaryAlpha = compound.colorAlphaGray300
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgCriticalSubtleAlpha = compound.colorAlphaRed300
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgEmptyItemAlpha = compound.colorAlphaGray500
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgAccentSelected = compound.colorGreen300
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgPill = compound.colorGray1100
}

private extension UITraitCollection {
    /// Whether or not the trait collection contains a `userInterfaceStyle` of `.light`.
    var isLight: Bool { userInterfaceStyle == .light }
}

public struct AvatarColor: Equatable {
    public let background: Color
    public let foreground: Color
}

private extension String {
    /// Calculates a numeric hash same as Element Web
    /// See original function here https://github.com/matrix-org/matrix-react-sdk/blob/321dd49db4fbe360fc2ff109ac117305c955b061/src/utils/FormattingUtils.js#L47
    var hashCode: Int {
        let characterCodeSum = self.reduce(0) { sum, character in
            sum + Int(character.unicodeScalars.first?.value ?? 0)
        }
        return (characterCodeSum % Color.compound.avatarColors.count)
    }
}
