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

import SwiftUI

public extension Font {
    /// The fonts used by Element as defined in Compound Design Tokens.
    static let compound = CompoundFonts()
}

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
