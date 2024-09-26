//
// Copyright 2023, 2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only
// Please see LICENSE in the repository root for full details.
//

import SwiftUI

public extension Font {
    /// The fonts used by Element as defined in Compound Design Tokens.
    static let compound = CompoundFonts()
}

/// A manual mapping of the Compound font styles to iOS styles. This will be
/// generated directly from the style dictionary in the future.
public struct CompoundFonts {
    public let bodyXS = Font.caption
    public let bodyXSSemibold = Font.caption.weight(.semibold)
    public let bodySM = Font.footnote
    public let bodySMSemibold = Font.footnote.weight(.semibold)
    public let bodyMD = Font.subheadline
    public let bodyMDSemibold = Font.subheadline.weight(.semibold)
    public let bodyLG = Font.body
    public let bodyLGSemibold = Font.body.weight(.semibold)
    public let headingSM = Font.title3
    public let headingSMSemibold = Font.title3.weight(.semibold)
    public let headingMD = Font.title2
    public let headingMDBold = Font.title2.bold()
    public let headingLG = Font.title
    public let headingLGBold = Font.title.bold()
    public let headingXL = Font.largeTitle
    public let headingXLBold = Font.largeTitle.bold()
}
