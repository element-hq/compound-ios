// 
// Copyright 2025 New Vector Ltd
//
// SPDX-License-Identifier: AGPL-3.0-only
// Please see LICENSE in the repository root for full details.
//

import CompoundDesignTokens
import SwiftUI

public extension Gradient {
    /// The gradients used by Element as defined in Compound Design Tokens.
    static let compound = CompoundGradients()
}

/// The gradients used by Element as defined in Compound Design Tokens.
/// This struct only contains the gradients assembled from the individual colour stops.
public struct CompoundGradients {
    public let action = Gradient(colors: [.compound.gradientActionStop1,
                                          .compound.gradientActionStop2,
                                          .compound.gradientActionStop3,
                                          .compound.gradientActionStop4])
    public let subtle = Gradient(colors: [.compound.gradientSubtleStop1,
                                          .compound.gradientSubtleStop2,
                                          .compound.gradientSubtleStop3,
                                          .compound.gradientSubtleStop4,
                                          .compound.gradientSubtleStop5,
                                          .compound.gradientSubtleStop6])
    public let info = Gradient(colors: [.compound.gradientInfoStop1,
                                        .compound.gradientInfoStop2,
                                        .compound.gradientInfoStop3,
                                        .compound.gradientInfoStop4,
                                        .compound.gradientInfoStop5,
                                        .compound.gradientInfoStop6])
}
