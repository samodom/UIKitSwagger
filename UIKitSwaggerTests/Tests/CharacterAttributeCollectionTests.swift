//
//  CharacterAttributeCollectionTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/19/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import XCTest
@testable import UIKitSwagger

class CharacterAttributeCollectionTests: XCTestCase {

    let color = Orange
    let font = UIFont.systemFontOfSize(42)
    let offset = CGFloat(14.42)

    var backgroundColorAttribute: CharacterAttribute!
    var fontAttribute: CharacterAttribute!
    var baselineOffsetAttribute: CharacterAttribute!

    override func setUp() {
        backgroundColorAttribute = .BackgroundColor(color)
        fontAttribute = .Font(font)
        baselineOffsetAttribute = .BaselineOffset(offset)
    }

    func testCreatingSetOfCharacterAttributesFromAttributeDictionary() {
        let attributeDictionary = [
            NSBackgroundColorAttributeName: Orange,
            NSFontAttributeName: font,
            NSBaselineOffsetAttributeName: offset,
            NSLigatureAttributeName: Purple
        ] as CharacterAttributeDictionary
        let attributeSet = CharacterAttributeSetFromDictionary(attributeDictionary)
        XCTAssertEqual(attributeSet.count, 3, "The attribute dictionary should be converted into a character attribute set with three items")
        XCTAssert(attributeSet.contains(backgroundColorAttribute), "The background color attribute should be included in the set")
        XCTAssert(attributeSet.contains(fontAttribute), "The font attribute should be included in the set")
        XCTAssert(attributeSet.contains(baselineOffsetAttribute), "The baseline offset attribute should be included in the set")
    }

    func testCreatingAttributeDictionaryFromSetOfCharacterAttributes() {
        let attributeSet: CharacterAttributeSet = [
            backgroundColorAttribute,
            fontAttribute,
            baselineOffsetAttribute
        ]

        let dictionary = attributeSet.attributeDictionary
        XCTAssertEqual(dictionary.count, 3, "There should be 3 elements in the dictionary")
        XCTAssertEqual(dictionary[NSBackgroundColorAttributeName] as? UIColor, color, "The background color attribute should be included in the dictionary")
        XCTAssertEqual(dictionary[NSFontAttributeName] as? UIFont, font, "The font attribute should be included in the dictionary")
        XCTAssertEqual(dictionary[NSBaselineOffsetAttributeName] as? CGFloat, offset, "The baseline offset attribute should be included in the dictionary")
    }

    func testCreatingAttributeDictionaryFromArrayOfCharacterAttributes() {
        let attributeArray: [CharacterAttribute] = [
            backgroundColorAttribute,
            fontAttribute,
            baselineOffsetAttribute
        ]

        let dictionary = attributeArray.attributeDictionary
        XCTAssertEqual(dictionary.count, 3, "There should be 3 elements in the dictionary")
        XCTAssertEqual(dictionary[NSBackgroundColorAttributeName] as? UIColor, color, "The background color attribute should be included in the dictionary")
        XCTAssertEqual(dictionary[NSFontAttributeName] as? UIFont, font, "The font attribute should be included in the dictionary")
        XCTAssertEqual(dictionary[NSBaselineOffsetAttributeName] as? CGFloat, offset, "The baseline offset attribute should be included in the dictionary")
    }

}
