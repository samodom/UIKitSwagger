//
//  CharacterAttributeDictionaryTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 10/23/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import XCTest
@testable import UIKitSwagger

class CharacterAttributeDictionaryTests: XCTestCase {

    func testFontAttributeDictionaryValues() {
        let testFont = UIFont.systemFontOfSize(14)
        let attribute = CharacterAttribute.Font(testFont)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSFontAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? UIFont, testFont, "The attribute should use the appropriate dictionary value")

        let dictionary = attribute.attributeDictionary
        XCTAssertEqual(dictionary.count, 1, "There should be exactly one element in the dictionary")
        XCTAssertEqual(dictionary[NSFontAttributeName] as? UIFont, testFont, "The attribute should produce a dictionary with its key/value pair")
    }

    func testParagraphStyleAttributeDictionaryValues() {
        let mutableStyle = NSMutableParagraphStyle()
        mutableStyle.alignment = .Right
        let testStyle = mutableStyle.copy() as! NSParagraphStyle
        let attribute = CharacterAttribute.ParagraphStyle(testStyle)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSParagraphStyleAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? NSParagraphStyle, testStyle, "The attribute should use the appropriate dictionary value")

        let dictionary = attribute.attributeDictionary
        XCTAssertEqual(dictionary.count, 1, "There should be exactly one element in the dictionary")
        XCTAssertEqual(dictionary[NSParagraphStyleAttributeName] as? NSParagraphStyle, testStyle, "The attribute should produce a dictionary with its key/value pair")
    }

    func testForegroundColorAttributeDictionaryValues() {
        let testColor = Orange
        let attribute = CharacterAttribute.ForegroundColor(testColor)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSForegroundColorAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? UIColor, testColor, "The attribute should use the appropriate dictionary value")

        let dictionary = attribute.attributeDictionary
        XCTAssertEqual(dictionary.count, 1, "There should be exactly one element in the dictionary")
        XCTAssertEqual(dictionary[NSForegroundColorAttributeName] as? UIColor, testColor, "The attribute should produce a dictionary with its key/value pair")
    }

    func testBackgroundColorAttributeDictionaryValues() {
        let testColor = Orange
        let attribute = CharacterAttribute.BackgroundColor(testColor)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSBackgroundColorAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? UIColor, testColor, "The attribute should use the appropriate dictionary value")

        let dictionary = attribute.attributeDictionary
        XCTAssertEqual(dictionary.count, 1, "There should be exactly one element in the dictionary")
        XCTAssertEqual(dictionary[NSBackgroundColorAttributeName] as? UIColor, testColor, "The attribute should produce a dictionary with its key/value pair")
    }

    func testUseLigaturesAttributeDictionaryValues() {
        let attribute = CharacterAttribute.UseLigatures(true)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSLigatureAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertTrue((value as! NSNumber).boolValue, "The attribute should use the appropriate dictionary value")

        let dictionary = attribute.attributeDictionary
        XCTAssertEqual(dictionary.count, 1, "There should be exactly one element in the dictionary")
        XCTAssertEqual(dictionary[NSLigatureAttributeName] as? NSNumber, true, "The attribute should produce a dictionary with its key/value pair")
    }

    func testKernAttributeDictionaryValues() {
        let attribute = CharacterAttribute.Kern(14.42)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSKernAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? NSNumber, CGFloat(14.42), "The attribute should use the appropriate dictionary value")

        let dictionary = attribute.attributeDictionary
        XCTAssertEqual(dictionary.count, 1, "There should be exactly one element in the dictionary")
        XCTAssertEqual(dictionary[NSKernAttributeName] as? NSNumber, CGFloat(14.42), "The attribute should produce a dictionary with its key/value pair")
    }

    func testStrikethroughStyleAttributeDictionaryValues() {
        let attribute = CharacterAttribute.StrikethroughStyle(.StyleDouble)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSStrikethroughStyleAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? NSNumber, NSUnderlineStyle.StyleDouble.rawValue, "The attribute should use the appropriate dictionary value")

        let dictionary = attribute.attributeDictionary
        XCTAssertEqual(dictionary.count, 1, "There should be exactly one element in the dictionary")
        XCTAssertEqual(dictionary[NSStrikethroughStyleAttributeName] as? NSNumber, NSUnderlineStyle.StyleDouble.rawValue, "The attribute should produce a dictionary with its key/value pair")
    }

    func testUnderlineStyleAttributeDictionaryValues() {
        let attribute = CharacterAttribute.UnderlineStyle(.StyleDouble)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSUnderlineStyleAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? NSNumber, NSUnderlineStyle.StyleDouble.rawValue, "The attribute should use the appropriate dictionary value")

        let dictionary = attribute.attributeDictionary
        XCTAssertEqual(dictionary.count, 1, "There should be exactly one element in the dictionary")
        XCTAssertEqual(dictionary[NSUnderlineStyleAttributeName] as? NSNumber, NSUnderlineStyle.StyleDouble.rawValue, "The attribute should produce a dictionary with its key/value pair")
    }

    func testStrokeColorAttributeDictionaryValues() {
        let testColor = Orange
        let attribute = CharacterAttribute.StrokeColor(testColor)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSStrokeColorAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? UIColor, testColor, "The attribute should use the appropriate dictionary value")

        let dictionary = attribute.attributeDictionary
        XCTAssertEqual(dictionary.count, 1, "There should be exactly one element in the dictionary")
        XCTAssertEqual(dictionary[NSStrokeColorAttributeName] as? UIColor, testColor, "The attribute should produce a dictionary with its key/value pair")
    }

    func testStrokeWidthAttributeDictionaryValues() {
        let attribute = CharacterAttribute.StrokeWidth(14.42)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSStrokeWidthAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? NSNumber, CGFloat(14.42), "The attribute should use the appropriate dictionary value")

        let dictionary = attribute.attributeDictionary
        XCTAssertEqual(dictionary.count, 1, "There should be exactly one element in the dictionary")
        XCTAssertEqual(dictionary[NSStrokeWidthAttributeName] as? NSNumber, CGFloat(14.42), "The attribute should produce a dictionary with its key/value pair")
    }

    func testShadowAttributeDictionaryValues() {
        let testShadow = NSShadow()
        testShadow.shadowOffset = CGSize(width: 14, height: 42)
        let attribute = CharacterAttribute.Shadow(testShadow)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSShadowAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? NSShadow, testShadow, "The attribute should use the appropriate dictionary value")

        let dictionary = attribute.attributeDictionary
        XCTAssertEqual(dictionary.count, 1, "There should be exactly one element in the dictionary")
        XCTAssertEqual(dictionary[NSShadowAttributeName] as? NSShadow, testShadow, "The attribute should produce a dictionary with its key/value pair")
    }

    func testTextEffectAttributeDictionaryValues() {
        let attribute = CharacterAttribute.TextEffect(NSTextEffectLetterpressStyle)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSTextEffectAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? String, NSTextEffectLetterpressStyle, "The attribute should use the appropriate dictionary value")

        let dictionary = attribute.attributeDictionary
        XCTAssertEqual(dictionary.count, 1, "There should be exactly one element in the dictionary")
        XCTAssertEqual(dictionary[NSTextEffectAttributeName] as? String, NSTextEffectLetterpressStyle, "The attribute should produce a dictionary with its key/value pair")
    }

    func testAttachmentAttributeDictionaryValues() {
        let testAttachment = NSTextAttachment(data: nil, ofType: "sample type")
        testAttachment.fileType = "application/text"
        let attribute = CharacterAttribute.Attachment(testAttachment)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSAttachmentAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? NSTextAttachment, testAttachment, "The attribute should use the appropriate dictionary value")

        let dictionary = attribute.attributeDictionary
        XCTAssertEqual(dictionary.count, 1, "There should be exactly one element in the dictionary")
        XCTAssertEqual(dictionary[NSAttachmentAttributeName] as? NSTextAttachment, testAttachment, "The attribute should produce a dictionary with its key/value pair")
    }

    func testLinkAttributeDictionaryValues() {
        let testLink = NSURL(string: "http://example.com")!
        let attribute = CharacterAttribute.Link(testLink)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSLinkAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? NSURL, testLink, "The attribute should use the appropriate dictionary value")

        let dictionary = attribute.attributeDictionary
        XCTAssertEqual(dictionary.count, 1, "There should be exactly one element in the dictionary")
        XCTAssertEqual(dictionary[NSLinkAttributeName] as? NSURL, testLink, "The attribute should produce a dictionary with its key/value pair")
    }

    func testBaselineOffsetAttributeDictionaryValues() {
        let attribute = CharacterAttribute.BaselineOffset(14.42)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSBaselineOffsetAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? NSNumber, CGFloat(14.42), "The attribute should use the appropriate dictionary value")

        let dictionary = attribute.attributeDictionary
        XCTAssertEqual(dictionary.count, 1, "There should be exactly one element in the dictionary")
        XCTAssertEqual(dictionary[NSBaselineOffsetAttributeName] as? NSNumber, CGFloat(14.42), "The attribute should produce a dictionary with its key/value pair")
    }

    func testStrikethroughColorAttributeDictionaryValues() {
        let testColor = Orange
        let attribute = CharacterAttribute.StrikethroughColor(testColor)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSStrikethroughColorAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? UIColor, testColor, "The attribute should use the appropriate dictionary value")

        let dictionary = attribute.attributeDictionary
        XCTAssertEqual(dictionary.count, 1, "There should be exactly one element in the dictionary")
        XCTAssertEqual(dictionary[NSStrikethroughColorAttributeName] as? UIColor, testColor, "The attribute should produce a dictionary with its key/value pair")
    }

    func testUnderlineColorAttributeDictionaryValues() {
        let testColor = Orange
        let attribute = CharacterAttribute.UnderlineColor(testColor)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSUnderlineColorAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? UIColor, testColor, "The attribute should use the appropriate dictionary value")

        let dictionary = attribute.attributeDictionary
        XCTAssertEqual(dictionary.count, 1, "There should be exactly one element in the dictionary")
        XCTAssertEqual(dictionary[NSUnderlineColorAttributeName] as? UIColor, testColor, "The attribute should produce a dictionary with its key/value pair")
    }

    func testObliquenessAttributeDictionaryValues() {
        let attribute = CharacterAttribute.Obliqueness(14.42)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSObliquenessAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? NSNumber, CGFloat(14.42), "The attribute should use the appropriate dictionary value")

        let dictionary = attribute.attributeDictionary
        XCTAssertEqual(dictionary.count, 1, "There should be exactly one element in the dictionary")
        XCTAssertEqual(dictionary[NSObliquenessAttributeName] as? NSNumber, CGFloat(14.42), "The attribute should produce a dictionary with its key/value pair")
    }

    func testExpansionAttributeDictionaryValues() {
        let attribute = CharacterAttribute.Expansion(14.42)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSExpansionAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? NSNumber, CGFloat(14.42), "The attribute should use the appropriate dictionary value")

        let dictionary = attribute.attributeDictionary
        XCTAssertEqual(dictionary.count, 1, "There should be exactly one element in the dictionary")
        XCTAssertEqual(dictionary[NSExpansionAttributeName] as? NSNumber, CGFloat(14.42), "The attribute should produce a dictionary with its key/value pair")
    }

    func testWritingDirectionAttributeDictionaryValues() {
        let overrides = [0, 3, 2, 1]
        let attribute = CharacterAttribute.WritingDirection(overrides)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSWritingDirectionAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as! [Int], [0, 3, 2, 1], "The attribute should use the appropriate dictionary value")

        let dictionary = attribute.attributeDictionary
        XCTAssertEqual(dictionary.count, 1, "There should be exactly one element in the dictionary")
        XCTAssertEqual(dictionary[NSWritingDirectionAttributeName] as! [Int], overrides, "The attribute should produce a dictionary with its key/value pair")
    }

    func testUseVerticalGlyphFormAttributeDictionaryValues() {
        let attribute = CharacterAttribute.UseVerticalGlyphForm(true)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSVerticalGlyphFormAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertTrue((value as! NSNumber).boolValue, "The attribute should use the appropriate dictionary value")

        let dictionary = attribute.attributeDictionary
        XCTAssertEqual(dictionary.count, 1, "There should be exactly one element in the dictionary")
        XCTAssertEqual(dictionary[NSVerticalGlyphFormAttributeName] as? NSNumber, true, "The attribute should produce a dictionary with its key/value pair")
    }

}
