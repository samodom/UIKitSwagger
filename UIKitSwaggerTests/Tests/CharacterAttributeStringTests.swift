//
//  CharacterAttributeStringTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 10/23/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import XCTest
import Foundation
@testable import UIKitSwagger

class CharacterAttributeStringTests: XCTestCase {

    let text = "Sample"
    let font = UIFont.systemFontOfSize(42)
    let offset = CGFloat(14.42)
    var characterCount: Int!
    var fullRange: Range<Int>!
    var oldFullRange: NSRange!

    var foregroundColorAttribute: CharacterAttribute!
    var fontAttribute: CharacterAttribute!
    var baselineOffsetAttribute: CharacterAttribute!

    var attributeDictionary: CharacterAttributeDictionary!

    var attributedString: NSAttributedString!
    var expectedString: NSAttributedString!

    override func setUp() {
        characterCount = text.characters.count
        fullRange = 0 ..< characterCount
        oldFullRange = NSRange(location: 0, length: characterCount)

        foregroundColorAttribute = .ForegroundColor(Orange)
        fontAttribute = .Font(font)
        baselineOffsetAttribute = .BaselineOffset(offset)

        attributeDictionary = [
            NSForegroundColorAttributeName: Orange,
            NSFontAttributeName: font,
            NSBaselineOffsetAttributeName: offset
        ]
    }

    private func createFullyAttributedString() -> NSAttributedString {
        return NSAttributedString(string: text, attributes: attributeDictionary)
    }

    private func createPartiallyAttributedString() -> NSAttributedString {
        let endRange = NSRange(location: 3, length: characterCount - 3)
        let mutableString = NSMutableAttributedString(string: text)
        mutableString.addAttributes(attributeDictionary, range: endRange)
        return NSAttributedString(attributedString: mutableString)
    }

    //  MARK: - Immutable

    func testCreatingAttributedStringWithSetOfAttributes() {
        expectedString = createFullyAttributedString()
        let attributes: CharacterAttributeSet = [
            foregroundColorAttribute,
            fontAttribute,
            baselineOffsetAttribute
        ]
        attributedString = NSAttributedString(string: text, characterAttributes: attributes)
        XCTAssertEqual(attributedString, expectedString, "Should be able to create an attributed string using a set of character attributes")
    }

    func testCreatingAttributedStringWithArrayOfAttributes() {
        expectedString = createFullyAttributedString()
        let attributes: [CharacterAttribute] = [
            foregroundColorAttribute,
            fontAttribute,
            baselineOffsetAttribute
        ]
        attributedString = NSAttributedString(string: text, characterAttributes: attributes)
        XCTAssertEqual(attributedString, expectedString, "Should be able to create an attributed string using an array of character attributes")
    }

    //  MARK: Retrieving single attribute

    func testRetrievingCharacterAttributeAtIndex() {
        attributedString = createFullyAttributedString()
        if let attribute = attributedString.characterAttributeAtIndex(3, named: NSForegroundColorAttributeName) {
            XCTAssertEqual(attribute, foregroundColorAttribute, "The appropriate attribute should be returned with the correct associated value")
        }
        else {
            XCTFail("An attribute should be returned for a valid index and name")
        }
    }

    func testRetrievingNonexistentCharacterAttributeAtIndex() {
        attributedString = createFullyAttributedString()
        let attribute = attributedString.characterAttributeAtIndex(3, named: NSLigatureAttributeName)
        XCTAssertNil(attribute, "No character attribute should be returned")
    }

    func testRetrievingCharacterAttributeAtIndexThroughSubscripting() {
        attributedString = createFullyAttributedString()
        if let attribute = attributedString[3, named: NSForegroundColorAttributeName] {
            XCTAssertEqual(attribute, foregroundColorAttribute, "The appropriate attribute should be returned with the correct associated value")
        }
        else {
            XCTFail("An attribute should be returned for a valid index and name")
        }
    }

    func testRetrievingNonexistentCharacterAttributeAtIndexThroughSubscripting() {
        attributedString = createFullyAttributedString()
        let attribute = attributedString[3, named: NSLigatureAttributeName]
        XCTAssertNil(attribute, "No character attribute should be returned")
    }

    //  MARK: Retrieving multiple attributes

    func testRetrievingSetOfCharacterAttributesAtIndex() {
        attributedString = createFullyAttributedString()
        let attributes = attributedString.characterAttributesAtIndex(3)
        XCTAssertEqual(attributes.count, 3, "There should be three attributes returned")
        XCTAssert(attributes.contains(foregroundColorAttribute), "Each character attribute should be returned with the correct associated value")
        XCTAssert(attributes.contains(fontAttribute), "Each character attribute should be returned with the correct associated value")
        XCTAssert(attributes.contains(baselineOffsetAttribute), "Each character attribute should be returned with the correct associated value")
    }

    func testRetrievingNonexistentCharacterAttributesAtIndex() {
        attributedString = createPartiallyAttributedString()
        let attributes = attributedString.characterAttributesAtIndex(0)
        XCTAssertEqual(attributes.count, 0, "No character attributes should be returned")
    }

    func testRetrievingSetOfCharacterAttributesAtIndexThroughSubscripting() {
        attributedString = createFullyAttributedString()
        let attributes = attributedString[3]
        XCTAssertEqual(attributes.count, 3, "There should be three attributes returned")
        XCTAssert(attributes.contains(foregroundColorAttribute), "Each character attribute should be returned with the correct associated value")
        XCTAssert(attributes.contains(fontAttribute), "Each character attribute should be returned with the correct associated value")
        XCTAssert(attributes.contains(baselineOffsetAttribute), "Each character attribute should be returned with the correct associated value")
    }

    func testRetrievingNonexistentCharacterAttributesAtIndexThroughSubscripting() {
        attributedString = createPartiallyAttributedString()
        let attributes = attributedString[0]
        XCTAssertEqual(attributes.count, 0, "No character attributes should be returned")
    }

    //  MARK: Retrieving single ranged attribute

    func testRetrievingRangedCharacterAttributeAtIndex() {
        attributedString = createFullyAttributedString()
        var expectedRange = NSRange()
        attributedString.attribute(NSForegroundColorAttributeName, atIndex: 3, effectiveRange: &expectedRange)

        let (attribute, range) =
        attributedString.rangedCharacterAttributeAtIndex(
            3,
            named: NSForegroundColorAttributeName
        )

        XCTAssertEqual(attribute, foregroundColorAttribute, "The appropriate attribute should be returned with the correct associated value")
        XCTAssertEqual(range, expectedRange.toRange()!, "The same range should be returned as the system API")
    }

    func testRetrievingMissingRangedCharacterAttributeAtIndex() {
        attributedString = createPartiallyAttributedString()
        var expectedRange = NSRange()
        attributedString.attribute(NSBackgroundColorAttributeName, atIndex: 3, effectiveRange: &expectedRange)

        let (attribute, range) =
        attributedString.rangedCharacterAttributeAtIndex(
            3,
            named: NSBackgroundColorAttributeName
        )

        XCTAssertNil(attribute, "No attribute should be returned")
        XCTAssertEqual(range, expectedRange.toRange()!, "The same range should be returned as the system API")
    }

    func testRetrievingMaximumRangedCharacterAttributeAtIndex() {
        attributedString = createFullyAttributedString()
        var expectedRange = NSRange()
        attributedString.attribute(
            NSForegroundColorAttributeName,
            atIndex: 3,
            longestEffectiveRange: &expectedRange,
            inRange: oldFullRange
        )

        let (attribute, range) =
        attributedString.maximumRangedCharacterAttributeAtIndex(
            3,
            named: NSForegroundColorAttributeName,
            inRange: 0 ..< characterCount
        )

        XCTAssertEqual(attribute, foregroundColorAttribute, "The appropriate attribute should be returned with the correct associated value")
        XCTAssertEqual(range, expectedRange.toRange()!, "The same range should be returned as the system API")
    }

    func testRetrievingMissingMaximumRangedCharacterAttributeAtIndex() {
        attributedString = createPartiallyAttributedString()
        var expectedRange = NSRange()
        attributedString.attribute(NSBackgroundColorAttributeName, atIndex: 0, effectiveRange: &expectedRange)

        let (attribute, range) =
        attributedString.maximumRangedCharacterAttributeAtIndex(
            0,
            named: NSForegroundColorAttributeName,
            inRange: 0 ..< characterCount
        )

        XCTAssertNil(attribute, "No attribute should be returned")
        XCTAssertEqual(range, expectedRange.toRange()!, "The same range should be returned as the system API")
    }

    //  MARK: Retrieving multiple ranged attributes

    func testRetrievingRangedCharacterAttributesAtIndex() {
        attributedString = createFullyAttributedString()
        var expectedRange = NSRange()
        attributedString.attributesAtIndex(3, effectiveRange: &expectedRange)

        let (attributes, range) = attributedString.rangedCharacterAttributesAtIndex(3)
        XCTAssertEqual(attributes.count, 3, "There should be 3 character attributes returned")
        XCTAssert(attributes.contains(foregroundColorAttribute), "The returned set should contain all of the applied attributes")
        XCTAssert(attributes.contains(fontAttribute), "The returned set should contain all of the applied attributes")
        XCTAssert(attributes.contains(baselineOffsetAttribute), "The returned set should contain all of the applied attributes")
        XCTAssertEqual(range, expectedRange.toRange()!, "The same range should be returned as the system API")
    }

    func testRetrievingMissingRangedCharacterAttributesAtIndex() {
        attributedString = NSAttributedString(string: text)
        var expectedRange = NSRange()
        attributedString.attributesAtIndex(3, effectiveRange: &expectedRange)

        let (attributes, range) = attributedString.rangedCharacterAttributesAtIndex(3)
        XCTAssertEqual(attributes.count, 0, "No attribute should be returned")
        XCTAssertEqual(range, expectedRange.toRange()!, "The same range should be returned as the system API")
    }

    func testReceivingMaximumRangedCharacterAttributesAtIndex() {
        attributedString = createPartiallyAttributedString()
        var expectedRange = NSRange()
        attributedString.attributesAtIndex(3, longestEffectiveRange: &expectedRange, inRange: oldFullRange)

        let (attributes, range) = attributedString.maximumRangedCharacterAttributesAtIndex(3, inRange: fullRange)
        XCTAssertEqual(attributes.count, 3, "There should be 3 character attributes returned")
        XCTAssert(attributes.contains(foregroundColorAttribute), "The returned set should contain all of the applied attributes")
        XCTAssert(attributes.contains(fontAttribute), "The returned set should contain all of the applied attributes")
        XCTAssert(attributes.contains(baselineOffsetAttribute), "The returned set should contain all of the applied attributes")
        XCTAssertEqual(range, expectedRange.toRange()!, "The same range should be returned as the system API")
    }

    func testReceivingMissingMaximumRangedCharacterAttributesAtIndex() {
        attributedString = NSAttributedString(string: text)
        var expectedRange = NSRange()
        attributedString.attributesAtIndex(3, longestEffectiveRange: &expectedRange, inRange: oldFullRange)

        let (attributes, range) = attributedString.maximumRangedCharacterAttributesAtIndex(0, inRange: fullRange)
        XCTAssertEqual(attributes.count, 0, "There should be no attributes returned")
        XCTAssertEqual(range, expectedRange.toRange()!, "The same range should be returned as the system API")
    }

    //  MARK: Retrieving a substring

    func testRetrievingSubstringViaHalfOpenIntervalSubscripting() {
        attributedString = createPartiallyAttributedString()
        let expected = attributedString.attributedSubstringFromRange(NSRange(location: 2, length: 3))
        let substring = attributedString[2 ..< 5]
        XCTAssertEqual(substring, expected, "The same substring should be returned as the system API")
    }

    func testRetrievingSubstringViaClosedIntervalSubscripting() {
        attributedString = createPartiallyAttributedString()
        let expected = attributedString.attributedSubstringFromRange(NSRange(location: 2, length: 3))
        let substring = attributedString[2 ... 4]
        XCTAssertEqual(substring, expected, "The same substring should be returned as the system API")
    }

}
