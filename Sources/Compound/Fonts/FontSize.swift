import SwiftUI

/// The size of a SwiftUI font.
enum FontSize {
    case custom(CGFloat, Font.TextStyle?)
    case style(Font.TextStyle)
    
    /// The raw value in points.
    var value: CGFloat {
        switch self {
        case .custom(let size, _):
            return size
        case .style(let style):
            switch style {
            case .largeTitle:
                return 34
            case .title:
                return 28
            case .title2:
                return 22
            case .title3:
                return 20
            case .subheadline:
                return 15
            case .body, .headline:
                return 17
            case .callout:
                return 16
            case .footnote:
                return 13
            case .caption:
                return 12
            case .caption2:
                return 11
            @unknown default:
                return 17
            }
        }
    }
    
    /// The text style of the font.
    var style: Font.TextStyle {
        switch self {
        case .custom(_, let textStyle):
            return textStyle ?? .body
        case .style(let textStyle):
            return textStyle
        }
    }
    
    static func reflecting(_ font: Font) -> FontSize? {
        let mirror = Mirror(reflecting: font)
        guard let provider = mirror.descendant("provider", "base") else { return nil }
        return resolveFontSize(provider)
    }
    
    private static func resolveFontSize(_ provider: Any) -> FontSize? {
        let mirror = Mirror(reflecting: provider)
        
        if let size = mirror.descendant("size") as? CGFloat {
            return .custom(size, mirror.descendant("textStyle") as? Font.TextStyle)
        } else if let textStyle = mirror.descendant("style") as? Font.TextStyle {
            return .style(textStyle)
        }
        
        // recurse to handle modifiers.
        guard let provider = mirror.descendant("base", "provider", "base") else { return nil }
        return resolveFontSize(provider)
    }
}
