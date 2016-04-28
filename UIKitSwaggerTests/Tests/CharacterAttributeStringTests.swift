//
//  CharacterAttributeStringTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 10/23/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import XCTest
import Foundation
import UIKitSwagger

class CharacterAttributeStringTests: XCTestCase {

    let text = LongSampleString
    let font = UIFont.systemFontOfSize(42)
    let offset = CGFloat(14.42)
    var characterCount: Int!
    var fullRange: Range<String.Index>!
    var fullNSRange: NSRange!
    var partialRange: Range<String.Index>!
    var index: String.Index!

    var foregroundColorAttribute = CharacterAttribute.ForegroundColor(Orange)
    var fontAttribute: CharacterAttribute!
    var baselineOffsetAttribute: CharacterAttribute!

    var attributeDictionary: CharacterAttributeDictionary!

    var attributedString: NSAttributedString!
    var expectedString: NSAttributedString!

    override func setUp() {
        characterCount = text.characters.count
        fullRange = text.startIndex ..< text.endIndex
        fullNSRange = NSRange(location: 0, length: characterCount)
        partialRange = text.startIndex.advancedBy(3) ..< text.endIndex

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

    private func setIndex() {
        index = attributedString.string.startIndex.advancedBy(3)
    }

    //  MARK: Construction

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

    //  MARK: Retrieving a single attribute

    func testRetrievingCharacterAttributeAtIndex() {
        attributedString = createFullyAttributedString(); setIndex()
        if let attribute = attributedString.characterAttributeAtIndex(index, named: NSForegroundColorAttributeName) {
            XCTAssertEqual(attribute, foregroundColorAttribute, "The appropriate attribute should be returned with the correct associated value")
        }
        else {
            XCTFail("An attribute should be returned for a valid index and name")
        }
    }

    func testRetrievingNonexistentCharacterAttributeAtIndex() {
        attributedString = createFullyAttributedString(); setIndex()
        let attribute = attributedString.characterAttributeAtIndex(index, named: NSLigatureAttributeName)
        XCTAssertNil(attribute, "No character attribute should be returned")
    }

    func testRetrievingCharacterAttributeAtIndexThroughSubscripting() {
        attributedString = createFullyAttributedString(); setIndex()
        if let attribute = attributedString[index, named: NSForegroundColorAttributeName] {
            XCTAssertEqual(attribute, foregroundColorAttribute, "The appropriate attribute should be returned with the correct associated value")
        }
        else {
            XCTFail("An attribute should be returned for a valid index and name")
        }
    }

    func testRetrievingNonexistentCharacterAttributeAtIndexThroughSubscripting() {
        attributedString = createFullyAttributedString(); setIndex()
        let attribute = attributedString[index, named: NSLigatureAttributeName]
        XCTAssertNil(attribute, "No character attribute should be returned")
    }

    //  MARK: Retrieving multiple attributes

    func testRetrievingSetOfCharacterAttributesAtIndex() {
        attributedString = createFullyAttributedString(); setIndex()
        let attributes = attributedString.characterAttributesAtIndex(index)
        XCTAssertEqual(attributes.count, 3, "There should be three attributes returned")
        XCTAssert(attributes.contains(foregroundColorAttribute), "Each character attribute should be returned with the correct associated value")
        XCTAssert(attributes.contains(fontAttribute), "Each character attribute should be returned with the correct associated value")
        XCTAssert(attributes.contains(baselineOffsetAttribute), "Each character attribute should be returned with the correct associated value")
    }

    func testRetrievingNonexistentCharacterAttributesAtIndex() {
        attributedString = createPartiallyAttributedString(); setIndex()
        let attributes = attributedString.characterAttributesAtIndex(attributedString.string.startIndex)
        XCTAssertEqual(attributes.count, 0, "No character attributes should be returned")
    }

    func testRetrievingSetOfCharacterAttributesAtIndexThroughSubscripting() {
        attributedString = createFullyAttributedString(); setIndex()
        let attributes = attributedString[index]
        XCTAssertEqual(attributes.count, 3, "There should be three attributes returned")
        XCTAssert(attributes.contains(foregroundColorAttribute), "Each character attribute should be returned with the correct associated value")
        XCTAssert(attributes.contains(fontAttribute), "Each character attribute should be returned with the correct associated value")
        XCTAssert(attributes.contains(baselineOffsetAttribute), "Each character attribute should be returned with the correct associated value")
    }

    func testRetrievingNonexistentCharacterAttributesAtIndexThroughSubscripting() {
        attributedString = createPartiallyAttributedString(); setIndex()
        let attributes = attributedString[attributedString.string.startIndex]
        XCTAssertEqual(attributes.count, 0, "No character attributes should be returned")
    }

    //  MARK: Retrieving single-attribute runs

    func testRetrievingNamedCharacterAttributeRunAtIndex() {
        attributedString = createFullyAttributedString(); setIndex()
        var expectedRange = NSRange()
        attributedString.attribute(NSForegroundColorAttributeName, atIndex: 3, effectiveRange: &expectedRange)

        let (attributes, range) =
            attributedString.characterAttributeRunAtIndex(index, named: NSForegroundColorAttributeName)

        XCTAssertEqual(attributes.first, foregroundColorAttribute, "The appropriate attribute should be returned with the correct associated value")
        AssertEqualIndexRanges(indexRange: range, nsRange: expectedRange, "The same range should be returned as the system API")
    }

    func testRetrievingEmptyNamedCharacterAttributeRunAtIndex() {
        attributedString = createPartiallyAttributedString(); setIndex()
        var expectedRange = NSRange()
        attributedString.attribute(NSBackgroundColorAttributeName, atIndex: 3, effectiveRange: &expectedRange)

        let (attributes, range) =
            attributedString.characterAttributeRunAtIndex(index, named: NSBackgroundColorAttributeName)

        XCTAssertTrue(attributes.isEmpty, "No attributes should be returned")
        AssertEqualIndexRanges(indexRange: range, nsRange: expectedRange, "The same range should be returned as the system API")
    }

    func testRetrievingLongestNamedCharacterAttributeRunAtIndex() {
        attributedString = createFullyAttributedString(); setIndex()
        var expectedRange = NSRange()
        attributedString.attribute(
            NSForegroundColorAttributeName,
            atIndex: 3,
            longestEffectiveRange: &expectedRange,
            inRange: fullNSRange
        )

        let (attributes, range) = attributedString.longestCharacterAttributeRunAtIndex(
            index,
            inRange: fullRange,
            named: NSForegroundColorAttributeName
        )

        XCTAssertEqual(attributes.first, foregroundColorAttribute, "The appropriate attribute should be returned with the correct associated value")
        AssertEqualIndexRanges(indexRange: range, nsRange: expectedRange, "The same range should be returned as the system API")
    }

    func testRetrievingEmptyLongestNamedCharacterAttributeRunAtIndex() {
        attributedString = createPartiallyAttributedString()
        var expectedRange = NSRange()
        attributedString.attribute(NSBackgroundColorAttributeName, atIndex: 0, effectiveRange: &expectedRange)

        index = attributedString.string.startIndex
        let (attributes, range) = attributedString.longestCharacterAttributeRunAtIndex(
            index,
            inRange: fullRange,
            named: NSForegroundColorAttributeName
        )

        XCTAssertTrue(attributes.isEmpty, "No attributes should be returned")
        AssertEqualIndexRanges(indexRange: range, nsRange: expectedRange, "The same range should be returned as the system API")
    }

    //  MARK: Retrieving multiple-attribute runs

    func testRetrievingCharacterAttributeRunAtIndex() {
        attributedString = createFullyAttributedString(); setIndex()
        var expectedRange = NSRange()
        attributedString.attributesAtIndex(3, effectiveRange: &expectedRange)

        let (attributes, range) = attributedString.characterAttributeRunAtIndex(index)
        XCTAssertEqual(attributes.count, 3, "There should be 3 character attributes returned")
        XCTAssert(attributes.contains(foregroundColorAttribute), "The returned set should contain all of the applied attributes")
        XCTAssert(attributes.contains(fontAttribute), "The returned set should contain all of the applied attributes")
        XCTAssert(attributes.contains(baselineOffsetAttribute), "The returned set should contain all of the applied attributes")
        AssertEqualIndexRanges(indexRange: range, nsRange: expectedRange, "The same range should be returned as the system API")
    }

    func testRetrievingEmptyCharacterAttributeRunAtIndex() {
        attributedString = NSAttributedString(string: text); setIndex()
        var expectedRange = NSRange()
        attributedString.attributesAtIndex(3, effectiveRange: &expectedRange)

        let (attributes, range) = attributedString.characterAttributeRunAtIndex(index)
        XCTAssertEqual(attributes.count, 0, "No attribute should be returned")
        AssertEqualIndexRanges(indexRange: range, nsRange: expectedRange, "The same range should be returned as the system API")
    }

    func testReceivingLongestCharacterAttributeRunAtIndex() {
        attributedString = createPartiallyAttributedString(); setIndex()
        var expectedRange = NSRange()
        attributedString.attributesAtIndex(3, longestEffectiveRange: &expectedRange, inRange: fullNSRange)

        let (attributes, range) =
            attributedString.longestCharacterAttributeRunAtIndex(index, inRange: fullRange)
        XCTAssertEqual(attributes.count, 3, "There should be 3 character attributes returned")
        XCTAssert(attributes.contains(foregroundColorAttribute), "The returned set should contain all of the applied attributes")
        XCTAssert(attributes.contains(fontAttribute), "The returned set should contain all of the applied attributes")
        XCTAssert(attributes.contains(baselineOffsetAttribute), "The returned set should contain all of the applied attributes")
        AssertEqualIndexRanges(indexRange: range, nsRange: expectedRange, "The same range should be returned as the system API")
    }

    func testReceivingEmptyLongestCharacterAttributeRunAtIndex() {
        attributedString = NSAttributedString(string: text); setIndex()
        var expectedRange = NSRange()
        attributedString.attributesAtIndex(3, longestEffectiveRange: &expectedRange, inRange: fullNSRange)

        let (attributes, range) = attributedString.longestCharacterAttributeRunAtIndex(
            attributedString.string.startIndex,
            inRange: fullRange
        )
        XCTAssertEqual(attributes.count, 0, "There should be no attributes returned")
        AssertEqualIndexRanges(indexRange: range, nsRange: expectedRange, "The same range should be returned as the system API")
    }

    //  MARK: Retrieving a substring

    func testRetrievingSubstringViaHalfOpenIntervalSubscripting() {
        attributedString = createPartiallyAttributedString()
        let expected = attributedString.attributedSubstringFromRange(NSRange(location: 2, length: 3))
        let start = attributedString.string.startIndex.advancedBy(2)
        let end = attributedString.string.startIndex.advancedBy(5)
        let substring = attributedString[start ..< end]
        XCTAssertEqual(substring, expected, "The same substring should be returned as the system API")
    }

    func testRetrievingSubstringViaClosedIntervalSubscripting() {
        attributedString = createPartiallyAttributedString()
        let expected = attributedString.attributedSubstringFromRange(NSRange(location: 2, length: 3))
        let start = attributedString.string.startIndex.advancedBy(2)
        let end = attributedString.string.startIndex.advancedBy(4)
        let substring = attributedString[start ... end]
        XCTAssertEqual(substring, expected, "The same substring should be returned as the system API")
    }


    //  MARK: Mutable attributed strings

    func testSettingCharacterAttributeSetOverRange() {
        expectedString = createPartiallyAttributedString()
        let attributes: CharacterAttributeSet = [fontAttribute, foregroundColorAttribute, baselineOffsetAttribute]
        let mutableString = NSMutableAttributedString(string: text)
        mutableString.setCharacterAttributes(attributes, overRange: partialRange)
        XCTAssertEqual(mutableString, expectedString, "Should be able to set character attributes over a range on a mutable attributed string")
    }

    func testSettingCharacterAttributeArrayOverRange() {
        expectedString = createPartiallyAttributedString()
        let attributes: [CharacterAttribute] = [fontAttribute, foregroundColorAttribute, baselineOffsetAttribute]
        let mutableString = NSMutableAttributedString(string: text)
        mutableString.setCharacterAttributes(attributes, overRange: partialRange)
        XCTAssertEqual(mutableString, expectedString, "Should be able to set character attributes over a range on a mutable attributed string")
    }

    func testAddingSingleAttributeOverRange() {
        let testString = NSMutableAttributedString(string: text)
        let testRange = NSRange(location: 3, length: characterCount - 3)
        testString.addAttribute(NSForegroundColorAttributeName, value: Orange, range: testRange)
        let mutableString = NSMutableAttributedString(string: text)
        mutableString.addCharacterAttribute(foregroundColorAttribute, overRange: partialRange)
        XCTAssertEqual(mutableString, testString, "Should be able to add a character attribute over a range on a mutable attributed string")
    }

    func testAddingMultipleAttributesOverRange() {
        let testString = NSMutableAttributedString(string: text)
        let testRange = NSRange(location: 3, length: characterCount - 3)
        testString.addAttributes(attributeDictionary, range: testRange)
        let mutableString = NSMutableAttributedString(string: text)
        mutableString.addCharacterAttributes(
            [foregroundColorAttribute, fontAttribute, baselineOffsetAttribute],
            overRange: partialRange
        )
        XCTAssertEqual(mutableString, testString, "Should be able to add character attributes over a range on a mutable attributed string")
    }

}
