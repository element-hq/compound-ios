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
@dynamicMemberLookup
public class CompoundUIColors {
    /// The base colour tokens that form the palette of available colours.
    ///
    /// Normally these shouldn't be necessary, however in practice we may need
    /// access for temporary tokens while waiting for official ones to be formalised.
    private static let coreTokens = CompoundCoreUIColorTokens.self
    /// The main semantic tokens generated from the Style Dictionary.
    private let tokens = CompoundUIColorTokens()
    /// Runtime overrides for the `tokens` property.
    private var overrides = [KeyPath<CompoundUIColorTokens, UIColor>: UIColor]()
    
    public subscript(dynamicMember keyPath: KeyPath<CompoundUIColorTokens, UIColor>) -> UIColor {
        return overrides[keyPath] ?? tokens[keyPath: keyPath]
    }
    
    /// Customise the colour at the specified key path with the supplied colour.
    /// Supplying `nil` as the colour will remove any existing customisation.
    public func override(_ keyPath: KeyPath<CompoundUIColorTokens, UIColor>, with color: UIColor?) {
        overrides[keyPath] = color
    }
    
    // MARK: - Elevation Tokens
    // This is a workaround until they are generated correctly
    
    public let bgSubtleSecondaryLevel0 = UIColor { $0.isLight ? coreTokens.gray300 : coreTokens.themeBg }
    public let bgCanvasDefaultLevel1 = UIColor { $0.isLight ? coreTokens.themeBg : coreTokens.gray300 }
    
    // MARK: - Awaiting Semantic Tokens
    
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgCodeBlock = UIColor { $0.isLight ? coreTokens.gray500 : coreTokens.gray700 }
    /// This token is a placeholder and hasn't been finalised.
    @available(iOS, deprecated: 17.0, message: "This token should be generated by now.")
    public let _bgSubtleSecondaryAlpha = coreTokens.alphaGray300
}

private extension UITraitCollection {
    /// Whether or not the trait collection contains a `userInterfaceStyle` of `.light`.
    var isLight: Bool { userInterfaceStyle == .light }
}
