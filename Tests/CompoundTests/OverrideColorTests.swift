//
// Copyright 2024 New Vector Ltd
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

import Foundation

@testable import Compound
import XCTest

class OverrideColorTests: XCTestCase {
    func testSwiftUI() {
        let colors = CompoundColors()
        let tokens = CompoundColorTokens()
        XCTAssertEqual(colors.textPrimary, tokens.textPrimary)
        
        colors.override(\.textPrimary, with: .pink)
        XCTAssertEqual(colors.textPrimary, .pink)
        
        colors.override(\.textPrimary, with: nil)
        XCTAssertEqual(colors.textPrimary, tokens.textPrimary)
    }
    
    func testUIKit() {
        let colors = CompoundUIColors()
        let tokens = CompoundUIColorTokens()
        XCTAssertEqual(colors.textPrimary, tokens.textPrimary)
        
        colors.override(\.textPrimary, with: .systemPink)
        XCTAssertEqual(colors.textPrimary, .systemPink)
        
        colors.override(\.textPrimary, with: nil)
        XCTAssertEqual(colors.textPrimary, tokens.textPrimary)
    }
}
