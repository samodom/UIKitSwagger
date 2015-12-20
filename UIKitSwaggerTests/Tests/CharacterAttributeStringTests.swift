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

    var characterAttributeSet: CharacterAttributeSet!
    var characterAttributeArray: [CharacterAttribute]!
    var attributeDictionary: CharacterAttributeDictionary!

    var attributedString: NSAttributedString!
    var expectedString: NSAttributedString!

    override func setUp() {
        characterAttributeArray = [
            .Font(font),
            .ForegroundColor(Orange),
            .BaselineOffset(offset)
        ]
        characterAttributeSet = Set(characterAttributeArray)

        attributeDictionary = [
            NSFontAttributeName: font,
            NSForegroundColorAttributeName: Orange,
            NSBaselineOffsetAttributeName: offset
        ]
    }

    //  MARK: - Immutable

    func testCreatingAttributedStringWithSetOfAttributes() {
        expectedString = NSAttributedString(string: text, attributes: attributeDictionary)
        attributedString = NSAttributedString(string: text, characterAttributes: characterAttributeSet)
        XCTAssertEqual(attributedString, expectedString, "Should be able to create an attributed string using a set of character attributes")
    }

    func testCreatingAttributedStringWithArrayOfAttributes() {
        expectedString = NSAttributedString(string: text, attributes: attributeDictionary)
        attributedString = NSAttributedString(string: text, characterAttributes: characterAttributeArray)
        XCTAssertEqual(attributedString, expectedString, "Should be able to create an attributed string using an array of character attributes")
    }

    //  MARK: Retrieving single attribute

    func testRetrievingCharacterAttributeAtIndex() {
        attributedString = NSAttributedString(string: text, attributes: attributeDictionary)
        if let attribute = attributedString.characterAttributeAtIndex(3, named: NSForegroundColorAttributeName) {
            switch attribute {
            case .ForegroundColor(let color):
                XCTAssertEqual(color, Orange, "The appropriate attribute should be returned with the correct associated value")

            default:
                XCTFail("The correct attribute should be returned")
            }
        }
        else {
            XCTFail("An attribute should be returned for a valid index and name")
        }
    }

    func testRetrievingNonexistentCharacterAttributeAtIndex() {
        attributedString = NSAttributedString(string: text, attributes: attributeDictionary)
        let attribute = attributedString.characterAttributeAtIndex(3, named: NSLigatureAttributeName)
        XCTAssertNil(attribute, "No character attribute should be returned")
    }

    func testRetrievingCharacterAttributeAtIndexThroughSubscripting() {
        attributedString = NSAttributedString(string: text, attributes: attributeDictionary)
        if let attribute = attributedString[3, named: NSForegroundColorAttributeName] {
            switch attribute {
            case .ForegroundColor(let color):
                XCTAssertEqual(color, Orange, "The appropriate attribute should be returned with the correct associated value")

            default:
                XCTFail("The correct attribute should be returned")
            }
        }
        else {
            XCTFail("An attribute should be returned for a valid index and name")
        }
    }

    func testRetrievingNonexistentCharacterAttributeAtIndexThroughSubscripting() {
        attributedString = NSAttributedString(string: text, attributes: attributeDictionary)
        let attribute = attributedString[3, named: NSLigatureAttributeName]
        XCTAssertNil(attribute, "No character attribute should be returned")
    }

    //  MARK: Retrieving multiple attributes

    func testRetrievingSetOfCharacterAttributesAtIndex() {
        attributedString = NSAttributedString(string: text, attributes: attributeDictionary)
        let attributes = attributedString.characterAttributesAtIndex(3)
        XCTAssertEqual(attributes.count, 3, "There should be three attributes returned")
        XCTAssert(attributes.contains(.Font(font)), "Each character attribute should be returned with the correct associated value")
        XCTAssert(attributes.contains(.ForegroundColor(Orange)), "Each character attribute should be returned with the correct associated value")
        XCTAssert(attributes.contains(.BaselineOffset(offset)), "Each character attribute should be returned with the correct associated value")
    }

    func testRetrievingNonexistentCharacterAttributesAtIndex() {
        let mutableString = NSMutableAttributedString(string: text)
        mutableString.addAttributes(attributeDictionary, range: NSRange(location: 3, length: 3))
        attributedString = NSAttributedString(attributedString: mutableString)
        let attributes = attributedString.characterAttributesAtIndex(0)
        XCTAssertEqual(attributes.count, 0, "No character attributes should be returned")
    }

    func testRetrievingSetOfCharacterAttributesAtIndexThroughSubscripting() {
        attributedString = NSAttributedString(string: text, attributes: attributeDictionary)
        let attributes = attributedString[3]
        XCTAssertEqual(attributes.count, 3, "There should be three attributes returned")
        XCTAssert(attributes.contains(.Font(font)), "Each character attribute should be returned with the correct associated value")
        XCTAssert(attributes.contains(.ForegroundColor(Orange)), "Each character attribute should be returned with the correct associated value")
        XCTAssert(attributes.contains(.BaselineOffset(offset)), "Each character attribute should be returned with the correct associated value")
    }

    func testRetrievingNonexistentCharacterAttributesAtIndexThroughSubscripting() {
        let mutableString = NSMutableAttributedString(string: text)
        mutableString.addAttributes(attributeDictionary, range: NSRange(location: 3, length: 3))
        attributedString = NSAttributedString(attributedString: mutableString)
        let attributes = attributedString[0]
        XCTAssertEqual(attributes.count, 0, "No character attributes should be returned")
    }

}
