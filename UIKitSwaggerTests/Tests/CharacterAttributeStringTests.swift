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
    let font = UIFont.systemFont(ofSize: 42)
    let offset = CGFloat(14.42)
    var characterCount: Int!
    var fullRange: Range<Int>!
    var oldFullRange: NSRange!
    var subRange: Range<Int>!
    var oldSubRange: NSRange!

    var foregroundColorAttribute: CharacterAttribute!
    var fontAttribute: CharacterAttribute!
    var baselineOffsetAttribute: CharacterAttribute!

    var attributeDictionary: CharacterAttributeDictionary!

    var attributedString: NSAttributedString!
    var expectedString: NSAttributedString!

    override func setUp() {
        characterCount = text.characters.count
        fullRange = 0 ..< characterCount
        oldFullRange = NSRange(fullRange)
        subRange = 3 ..< characterCount
        oldSubRange = NSRange(subRange)

        foregroundColorAttribute = .foregroundColor(UIColor.orange)
        fontAttribute = .font(font)
        baselineOffsetAttribute = .baselineOffset(offset)

        attributeDictionary = [
            NSForegroundColorAttributeName: UIColor.orange,
            NSFontAttributeName: font,
            NSBaselineOffsetAttributeName: offset
        ]
    }

    private func createFullyAttributedString() -> NSAttributedString {
        return NSAttributedString(string: text, attributes: attributeDictionary)
    }

    private func createPartiallyAttributedString() -> NSAttributedString {
        let mutableString = NSMutableAttributedString(string: text)
        mutableString.addAttributes(attributeDictionary, range: oldSubRange)

        let string = NSAttributedString(attributedString: mutableString)
        assert(string != createFullyAttributedString())

        return string
    }


    //  MARK: - Immutable

    func testCreatingAttributedStringWithSetOfAttributes() {
        expectedString = createFullyAttributedString()
        let attributes: Set<CharacterAttribute> = [
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
        if let attribute = attributedString.characterAttribute(named: NSForegroundColorAttributeName, at: 3) {
            XCTAssertEqual(attribute, foregroundColorAttribute, "The appropriate attribute should be returned with the correct associated value")
        }
        else {
            XCTFail("An attribute should be returned for a valid index and name")
        }
    }

    func testRetrievingNonexistentCharacterAttributeAtIndex() {
        attributedString = createFullyAttributedString()
        let attribute = attributedString.characterAttribute(named: NSLigatureAttributeName, at: 3)
        XCTAssertNil(attribute, "No character attribute should be returned")
    }


    //  MARK: Retrieving multiple attributes

    func testRetrievingSetOfCharacterAttributesAtIndex() {
        attributedString = createFullyAttributedString()
        let attributes = attributedString.characterAttributes(at: 3)
        XCTAssertEqual(attributes.count, 3, "There should be three attributes returned")
        XCTAssert(attributes.contains(foregroundColorAttribute), "Each character attribute should be returned with the correct associated value")
        XCTAssert(attributes.contains(fontAttribute), "Each character attribute should be returned with the correct associated value")
        XCTAssert(attributes.contains(baselineOffsetAttribute), "Each character attribute should be returned with the correct associated value")
    }

    func testRetrievingNonexistentCharacterAttributesAtIndex() {
        attributedString = createPartiallyAttributedString()
        let attributes = attributedString.characterAttributes(at: 0)
        XCTAssertEqual(attributes.count, 0, "No character attributes should be returned")
    }


    //  MARK: Retrieving single ranged attribute

    func testRetrievingRangedCharacterAttributeAtIndex() {
        attributedString = createFullyAttributedString()
        var expectedRange = NSRange()
        attributedString.attribute(NSForegroundColorAttributeName, at: 3, effectiveRange: &expectedRange)

        let (attribute, range) =
        attributedString.rangedCharacterAttribute(named: NSForegroundColorAttributeName, at: 3)

        XCTAssertEqual(attribute, foregroundColorAttribute, "The appropriate attribute should be returned with the correct associated value")
        XCTAssertEqual(range, expectedRange.toRange()!, "The same range should be returned as the system API")
    }

    func testRetrievingMissingRangedCharacterAttributeAtIndex() {
        attributedString = createPartiallyAttributedString()
        var expectedRange = NSRange()
        attributedString.attribute(NSBackgroundColorAttributeName, at: 3, effectiveRange: &expectedRange)

        let (attribute, range) =
            attributedString.rangedCharacterAttribute(named: NSBackgroundColorAttributeName, at: 3)

        XCTAssertNil(attribute, "No attribute should be returned")
        XCTAssertEqual(range, expectedRange.toRange()!, "The same range should be returned as the system API")
    }

    func testRetrievingMaximumRangedCharacterAttributeAtIndex() {
        attributedString = createFullyAttributedString()
        var expectedRange = NSRange()
        attributedString.attribute(
            NSForegroundColorAttributeName,
            at: 3,
            longestEffectiveRange: &expectedRange,
            in: oldFullRange
        )

        let (attribute, range) =
        attributedString.maximumRangedCharacterAttribute(
            named: NSForegroundColorAttributeName,
            at: 3,
            in: fullRange
        )

        XCTAssertEqual(attribute, foregroundColorAttribute, "The appropriate attribute should be returned with the correct associated value")
        XCTAssertEqual(range, expectedRange.toRange()!, "The same range should be returned as the system API")
    }

    func testRetrievingMissingMaximumRangedCharacterAttributeAtIndex() {
        attributedString = createPartiallyAttributedString()
        var expectedRange = NSRange()
        attributedString.attribute(NSBackgroundColorAttributeName, at: 0, effectiveRange: &expectedRange)

        let (attribute, range) =
        attributedString.maximumRangedCharacterAttribute(
            named: NSForegroundColorAttributeName,
            at: 0,
            in: fullRange
        )

        XCTAssertNil(attribute, "No attribute should be returned")
        XCTAssertEqual(range, expectedRange.toRange()!, "The same range should be returned as the system API")
    }


    //  MARK: Retrieving multiple ranged attributes

    func testRetrievingRangedCharacterAttributesAtIndex() {
        attributedString = createFullyAttributedString()
        var expectedRange = NSRange()
        _ = attributedString.attributes(at: 3, effectiveRange: &expectedRange)

        let (attributes, range) = attributedString.rangedCharacterAttributes(at: 3)
        XCTAssertEqual(attributes.count, 3, "There should be 3 character attributes returned")
        XCTAssert(attributes.contains(foregroundColorAttribute), "The returned set should contain all of the applied attributes")
        XCTAssert(attributes.contains(fontAttribute), "The returned set should contain all of the applied attributes")
        XCTAssert(attributes.contains(baselineOffsetAttribute), "The returned set should contain all of the applied attributes")
        XCTAssertEqual(range, expectedRange.toRange()!, "The same range should be returned as the system API")
    }

    func testRetrievingMissingRangedCharacterAttributesAtIndex() {
        attributedString = NSAttributedString(string: text)
        var expectedRange = NSRange()
        attributedString.attributes(at: 3, effectiveRange: &expectedRange)

        let (attributes, range) = attributedString.rangedCharacterAttributes(at: 3)
        XCTAssertEqual(attributes.count, 0, "No attribute should be returned")
        XCTAssertEqual(range, expectedRange.toRange()!, "The same range should be returned as the system API")
    }

    func testRetrievingMaximumRangedCharacterAttributesAtIndex() {
        attributedString = createPartiallyAttributedString()
        var expectedRange = NSRange()
        attributedString.attributes(at: 3, longestEffectiveRange: &expectedRange, in: oldFullRange)

        let (attributes, range) = attributedString.maximumRangedCharacterAttributes(at:3, in: fullRange)
        XCTAssertEqual(attributes.count, 3, "There should be 3 character attributes returned")
        XCTAssert(attributes.contains(foregroundColorAttribute), "The returned set should contain all of the applied attributes")
        XCTAssert(attributes.contains(fontAttribute), "The returned set should contain all of the applied attributes")
        XCTAssert(attributes.contains(baselineOffsetAttribute), "The returned set should contain all of the applied attributes")
        XCTAssertEqual(range, expectedRange.toRange()!, "The same range should be returned as the system API")
    }

    func testRetrievingMissingMaximumRangedCharacterAttributesAtIndex() {
        attributedString = NSAttributedString(string: text)
        var expectedRange = NSRange()
        attributedString.attributes(at: 3, longestEffectiveRange: &expectedRange, in: oldFullRange)

        let (attributes, range) = attributedString.maximumRangedCharacterAttributes(at: 0, in: fullRange)
        XCTAssertEqual(attributes.count, 0, "There should be no attributes returned")
        XCTAssertEqual(range, expectedRange.toRange()!, "The same range should be returned as the system API")
    }


    //  MARK: - Mutable

    func testSettingCharacterAttributesOverRange() {
        let expected = NSMutableAttributedString(attributedString: createPartiallyAttributedString())

        let mutableString = NSMutableAttributedString(string: text)
        let attributes = attributeDictionary.characterAttributeSet()
        mutableString.setCharacterAttributes(attributes: attributes, over: subRange)

        XCTAssertEqual(mutableString, expected, "The mutable string should be modified in the same way as the original API")
    }

    func testAddingSingleCharacterAttributeOverRange() {
        let expected = NSMutableAttributedString(string: text)
        expected.addAttribute(NSForegroundColorAttributeName, value: UIColor.orange, range: oldSubRange)

        let mutableString = NSMutableAttributedString(string: text)
        mutableString.addCharacterAttribute(attribute: foregroundColorAttribute, over: subRange)

        XCTAssertEqual(mutableString, expected, "The mutable string should be modified in the same way as the original API")
    }

    func testAddingCharacterAttributesOverRange() {
        let expected = NSMutableAttributedString(string: text)
        expected.addAttributes(attributeDictionary, range: oldSubRange)

        let mutableString = NSMutableAttributedString(string: text)
        mutableString.addCharacterAttributes(attributes: attributeDictionary.characterAttributeSet(), over: subRange)

        XCTAssertEqual(mutableString, expected, "The mutable string should be modified in the same way as the original API")
    }

}
