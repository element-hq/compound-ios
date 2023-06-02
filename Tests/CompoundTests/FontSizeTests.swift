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


@testable import Compound
import SwiftUI
import XCTest

final class FontSizeTests: XCTestCase {
    func testTextStyle() throws {
        let bodyFontSize = FontSize.reflecting(.body)
        XCTAssertEqual(bodyFontSize?.value, 17)
        XCTAssertEqual(bodyFontSize?.style, .body)
        
        let footnoteFontSize = FontSize.reflecting(.footnote)
        XCTAssertEqual(footnoteFontSize?.value, 13)
        XCTAssertEqual(footnoteFontSize?.style, .footnote)
        
        let largeTitleFontSize = FontSize.reflecting(.largeTitle)
        XCTAssertEqual(largeTitleFontSize?.value, 34)
        XCTAssertEqual(largeTitleFontSize?.style, .largeTitle)
    }
    
    func testModifiedTextStyle() {
        let boldCaptionFontSize = FontSize.reflecting(.caption.bold())
        XCTAssertEqual(boldCaptionFontSize?.value, 12)
        XCTAssertEqual(boldCaptionFontSize?.style, .caption)
        
        let styledTitle = Font.title.width(.compressed).bold().italic().monospaced()
        let styledTitleFontSize = FontSize.reflecting(styledTitle)
        XCTAssertEqual(styledTitleFontSize?.value, 28)
        XCTAssertEqual(styledTitleFontSize?.style, .title)
    }
    
    func testSystemFont() {
        let system21FontSize = FontSize.reflecting(.system(size: 21))
        XCTAssertEqual(system21FontSize?.value, 21)
        
        let boldSystem29FontSize = FontSize.reflecting(.system(size: 29).bold())
        XCTAssertEqual(boldSystem29FontSize?.value, 29)
        
        let styledSystem33 = Font.system(size: 33).width(.compressed).bold().italic().monospacedDigit()
        let styledSystem33FontSize = FontSize.reflecting(styledSystem33)
        XCTAssertEqual(styledSystem33FontSize?.value, 33)
    }
    
    func testCustomFont() {
        let custom43FontSize = FontSize.reflecting(.custom("Baskerville", size: 43))
        XCTAssertEqual(custom43FontSize?.value, 43)
        XCTAssertEqual(custom43FontSize?.style, .body)
        
        let styledCustom35 = Font.custom("Baskerville", size: 35).weight(.thin).monospaced().italic()
        let styledCustom35FontSize = FontSize.reflecting(styledCustom35)
        XCTAssertEqual(styledCustom35FontSize?.value, 35)
        XCTAssertEqual(styledCustom35FontSize?.style, .body)
    }
    
    func testCustomFontWithTextStyle() {
        let customTitle21FontSize = FontSize.reflecting(.custom("Baskerville", size: 21, relativeTo: .title))
        XCTAssertEqual(customTitle21FontSize?.value, 21)
        XCTAssertEqual(customTitle21FontSize?.style, .title)
        
        let styledCustomFootnote15 = Font.custom("Baskerville", size: 15, relativeTo: .footnote).weight(.thin).monospaced().italic()
        let styledCustomFootnote15FontSize = FontSize.reflecting(styledCustomFootnote15)
        XCTAssertEqual(styledCustomFootnote15FontSize?.value, 15)
        XCTAssertEqual(styledCustomFootnote15FontSize?.style, .footnote)
    }
}
