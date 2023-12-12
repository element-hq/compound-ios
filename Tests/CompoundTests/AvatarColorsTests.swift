//
//  File.swift
//  
//
//  Created by Mauro Romito on 31/08/23.
//

import Foundation

@testable import Compound
import SwiftUI
import XCTest

final class AvatarColorsTests: XCTestCase {
    struct TestCase {
        let input: String
        private let webOutput: Int
        
        // remember that web starts the index from 1 while we start from 0
        var output: Int {
            webOutput - 1
        }
        
        init(input: String, webOutput: Int) {
            self.input = input
            self.webOutput = webOutput
        }
    }
    
    func testAvatarColorHash() {
        // Match the tests with the web ones for consistency between the two platforms
        // https://github.com/element-hq/compound-web/blob/5dda11aa9733462fb8422968181275bc3e9b35e3/src/components/Avatar/Avatar.test.tsx#L62
        let testCases: [TestCase] = [
            .init(input: "@bob:example.org", webOutput: 8),
            .init(input: "@alice:example.org", webOutput: 3),
            .init(input: "@charlie:example.org", webOutput: 5),
            .init(input: "@dan:example.org", webOutput: 8),
            .init(input: "@elena:example.org", webOutput: 2),
            .init(input: "@fanny:example.org", webOutput: 1)
        ]
        
        for testCase in testCases {
            XCTAssertEqual(Color.compound.avatarColor(for: testCase.input), Color.compound.avatarColors[testCase.output])
        }
    }
}
