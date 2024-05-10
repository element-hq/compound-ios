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

public extension ShapeStyle where Self == Color {
    /// The colours used by Element as defined in Compound Design Tokens.
    static var compound: CompoundColors { Self.compound }
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
    
    public let bgSubtleSecondaryLevel0 = Color(UIColor { $0.isLight ? UIColor(compound.colorGray300) : UIColor(compound.colorThemeBg) })
    public let bgCanvasDefaultLevel1 = Color(UIColor { $0.isLight ? UIColor(compound.colorThemeBg) : UIColor(compound.colorGray300) })
    
    // MARK: - Decorative Colors
    // Used to determine the background and text colors of avatars, usernames etc.
    internal let decorativeColors: [DecorativeColor] = [
        // TODO: Use decorative colours
        .init(background: compound.colorBgDecorative1, text: compound.colorTextDecorative1),
        .init(background: compound.colorBgDecorative2, text: compound.colorTextDecorative2),
        .init(background: compound.colorBgDecorative3, text: compound.colorTextDecorative3),
        .init(background: compound.colorBgDecorative4, text: compound.colorTextDecorative4),
        .init(background: compound.colorBgDecorative5, text: compound.colorTextDecorative5),
        .init(background: compound.colorBgDecorative6, text: compound.colorTextDecorative6),
    ]
    
    public func decorativeColor(for contentID: String) -> DecorativeColor {
        decorativeColors[contentID.hashCode]
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
    public let _bgBubbleHighlighted = compound.colorGreen300
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
    public let _bgPill = Color(UIColor { $0.isLight ? UIColor(compound.colorAlphaGray400) : UIColor(compound.colorAlphaGray500) })
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgOwnPill = Color(UIColor { $0.isLight ? UIColor(compound.colorAlphaGreen400) : UIColor(compound.colorAlphaGreen500) })
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _textOwnPill = compound.colorGreen1100
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgBadgeHighlighted = compound.colorAlphaGreen300
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgBadgeTextSubtle = compound.colorGray1100
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgBadgeTextHighlighted = compound.colorGreen1100
    
    // MARK: - Gradients
    public let gradientSuperButton = Gradient(colors: [compound.colorBlue900, compound.colorGreen1100])
}

private extension UITraitCollection {
    /// Whether or not the trait collection contains a `userInterfaceStyle` of `.light`.
    var isLight: Bool { userInterfaceStyle == .light }
}

public struct DecorativeColor: Equatable {
    public let background: Color
    public let text: Color
}

private extension String {
    /// Calculates a numeric hash same as Element Web
    /// See original function here https://github.com/matrix-org/matrix-react-sdk/blob/321dd49db4fbe360fc2ff109ac117305c955b061/src/utils/FormattingUtils.js#L47
    var hashCode: Int {
        let characterCodeSum = self.reduce(0) { sum, character in
            sum + Int(character.unicodeScalars.first?.value ?? 0)
        }
        return (characterCodeSum % Color.compound.decorativeColors.count)
    }
}
