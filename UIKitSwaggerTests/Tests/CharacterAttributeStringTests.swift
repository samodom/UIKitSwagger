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
    let color = Orange
    let offset = CGFloat(14.42)

    var characterAttributeSet: CharacterAttributeSet!
    var characterAttributeArray: [CharacterAttribute]!
    var attributeDictionary: CharacterAttributeDictionary!

    var attributedString: NSAttributedString!
    var expectedString: NSAttributedString!

    override func setUp() {
        characterAttributeArray = [
            .Font(font),
            .ForegroundColor(color),
            .BaselineOffset(offset)
        ]
        characterAttributeSet = Set(characterAttributeArray)

        attributeDictionary = [
            NSFontAttributeName: font,
            NSForegroundColorAttributeName: color,
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

    //  MARK: Retrieving attributes

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

}