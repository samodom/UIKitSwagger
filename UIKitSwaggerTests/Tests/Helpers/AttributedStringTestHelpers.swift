//
//  AttributedStringTestHelpers.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 4/19/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import Foundation

private let DefaultIndexRangeEqualityAssertionMessage = "The index ranges are unequal"

internal extension CharacterAttributeStringTests {

    internal func AssertEqualIndexRanges(
        indexRange indexRange: Range<String.Index>,
        nsRange: NSRange,
        _ message: String = DefaultIndexRangeEqualityAssertionMessage,
        atLine line: UInt = #line,
        inFile file: String = #file
        ) {
        let expectedStart = attributedString.string.startIndex.advancedBy(nsRange.location)
        let expectedEnd = expectedStart.advancedBy(nsRange.length)
        let expectedRange = expectedStart ..< expectedEnd
        if indexRange != expectedRange {
            recordFailureWithDescription(message, inFile: file, atLine: line, expected: true)
        }
    }

}
