//
//  CharacterAttributeTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 10/20/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import XCTest
@testable import UIKitSwagger

class CharacterAttributeTests: XCTestCase {

    func testFontAttribute() {
        let testFont = UIFont.systemFontOfSize(14)
        let attribute = CharacterAttribute(name: NSFontAttributeName, value: testFont)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .Font attribute should be created with the provided font"
        if case .Font(let font) = attribute! {
            XCTAssertEqual(font, testFont, message)
        }
        else {
            XCTFail(message)
        }
    }

    func testFontAttributeWithoutFont() {
        let attribute = CharacterAttribute(name: NSFontAttributeName, value: NSObject())
        XCTAssert(attribute == nil, "An attribute should not have been created")
    }

    func testFontAttributeDictionaryValues() {
        let testFont = UIFont.systemFontOfSize(14)
        let attribute = CharacterAttribute.Font(testFont)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSFontAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? UIFont, testFont, "The attribute should use the appropriate dictionary value")
    }

    func testParagraphStyleAttribute() {
        let mutableStyle = NSMutableParagraphStyle()
        mutableStyle.alignment = .Right
        let testStyle = mutableStyle.copy() as! NSParagraphStyle
        let attribute = CharacterAttribute(name: NSParagraphStyleAttributeName, value: testStyle)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .ParagraphStyle attribute should be created with the provided paragraph style"
        if case .ParagraphStyle(let style) = attribute! {
            XCTAssertEqual(style, testStyle, message)
        }
        else {
            XCTFail(message)
        }
    }

    func testParagraphStyleAttributeWithoutStyle() {
        let attribute = CharacterAttribute(name: NSParagraphStyleAttributeName, value: NSObject())
        XCTAssert(attribute == nil, "An attribute should not have been created")
    }

    func testParagraphStyleAttributeDictionaryValues() {
        let mutableStyle = NSMutableParagraphStyle()
        mutableStyle.alignment = .Right
        let testStyle = mutableStyle.copy() as! NSParagraphStyle
        let attribute = CharacterAttribute.ParagraphStyle(testStyle)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSParagraphStyleAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? NSParagraphStyle, testStyle, "The attribute should use the appropriate dictionary value")
    }

    func testForegroundColorAttribute() {
        let testColor = UIColor.orangeColor()
        let attribute = CharacterAttribute(name: NSForegroundColorAttributeName, value: testColor)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .ForegroundColor attribute should be created with the provided color"
        if case .ForegroundColor(let color) = attribute! {
            XCTAssertEqual(color, testColor, message)
        }
        else {
            XCTFail(message)
        }
    }

    func testForegroundColorAttributeWithoutColor() {
        let attribute = CharacterAttribute(name: NSForegroundColorAttributeName, value: NSObject())
        XCTAssert(attribute == nil, "An attribute should not have been created")
    }

    func testForegroundColorAttributeDictionaryValues() {
        let testColor = UIColor.orangeColor()
        let attribute = CharacterAttribute.ForegroundColor(testColor)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSForegroundColorAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? UIColor, testColor, "The attribute should use the appropriate dictionary value")
    }

    func testBackgroundColorAttribute() {
        let testColor = UIColor.orangeColor()
        let attribute = CharacterAttribute(name: NSBackgroundColorAttributeName, value: testColor)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .BackgroundColor attribute should be created with the provided color"
        if case .BackgroundColor(let color) = attribute! {
            XCTAssertEqual(color, testColor, message)
        }
        else {
            XCTFail(message)
        }
    }

    func testBackgroundColorAttributeWithoutColor() {
        let attribute = CharacterAttribute(name: NSBackgroundColorAttributeName, value: NSObject())
        XCTAssert(attribute == nil, "An attribute should not have been created")
    }

    func testBackgroundColorAttributeDictionaryValues() {
        let testColor = UIColor.orangeColor()
        let attribute = CharacterAttribute.BackgroundColor(testColor)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSBackgroundColorAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? UIColor, testColor, "The attribute should use the appropriate dictionary value")
    }

    func testUseLigaturesAttribute() {
        let attribute = CharacterAttribute(name: NSLigatureAttributeName, value: false)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .UseLigatures attribute should be created with the provided boolean"
        if case .UseLigatures(let shouldUseLigatures) = attribute! {
            XCTAssertFalse(shouldUseLigatures, message)
        }
        else {
            XCTFail(message)
        }
    }

    func testUseLigaturesAttributeWithoutValue() {
        let attribute = CharacterAttribute(name: NSLigatureAttributeName, value: NSObject())
        XCTAssert(attribute == nil, "An attribute should not have been created")
    }

    func testUseLigaturesAttributeDictionaryValues() {
        let attribute = CharacterAttribute.UseLigatures(true)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSLigatureAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssert(value is NSNumber, "The attribute should use an NSNumber as the dictionary value")
        let shouldUseLigatures = value as! NSNumber
        XCTAssertTrue(shouldUseLigatures.boolValue, "The attribute should use the appropriate dictionary value")
    }

    func testKernAttribute() {
        let attribute = CharacterAttribute(name: NSKernAttributeName, value: 14.42)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .Kern attribute should be created with the provided value"
        if case .Kern(let kern) = attribute! {
            XCTAssertEqual(kern, 14.42, message)
        }
        else {
            XCTFail(message)
        }
    }

    func testKernAttributeWithoutValue() {
        let attribute = CharacterAttribute(name: NSKernAttributeName, value: NSObject())
        XCTAssert(attribute == nil, "An attribute should not have been created")
    }

    func testKernAttributeDictionaryValues() {
        let attribute = CharacterAttribute.Kern(14.42)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSKernAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssert(value is NSNumber, "The attribute should use an NSNumber as the dictionary value")
        let kern = value as! NSNumber
        XCTAssertEqual(kern.floatValue, 14.42, "The attribute should use the appropriate dictionary value")
    }
    
    func testStrikethroughStyleAttribute() {
        let attribute = CharacterAttribute(name: NSStrikethroughStyleAttributeName, value: NSUnderlineStyle.StyleThick.rawValue)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .StrikethroughStyle attribute should be created with the provided style"
        if case .StrikethroughStyle(let style) = attribute! {
            XCTAssertEqual(style, NSUnderlineStyle.StyleThick, message)
        }
        else {
            XCTFail(message)
        }
    }

    func testStrikethroughStyleAttributeWithoutStyle() {
        let attribute = CharacterAttribute(name: NSStrikethroughStyleAttributeName, value: NSObject())
        XCTAssert(attribute == nil, "An attribute should not have been created")
    }

    func testStrikethroughStyleAttributeDictionaryValues() {
        let attribute = CharacterAttribute.StrikethroughStyle(.StyleDouble)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSStrikethroughStyleAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssert(value is NSNumber, "The attribute should use an NSNumber as the dictionary value")
        let style = value as! NSNumber
        XCTAssertEqual(style.integerValue, NSUnderlineStyle.StyleDouble.rawValue, "The attribute should use the appropriate dictionary value")
    }

    func testUnderlineStyleAttribute() {
        let attribute = CharacterAttribute(name: NSUnderlineStyleAttributeName, value: NSUnderlineStyle.StyleThick.rawValue)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .UnderlineStyle attribute should be created with the provided style"
        if case .UnderlineStyle(let style) = attribute! {
            XCTAssertEqual(style, NSUnderlineStyle.StyleThick, message)
        }
        else {
            XCTFail(message)
        }
    }

    func testUnderlineStyleAttributeWithoutStyle() {
        let attribute = CharacterAttribute(name: NSUnderlineStyleAttributeName, value: NSObject())
        XCTAssert(attribute == nil, "An attribute should not have been created")
    }

    func testUnderlineStyleAttributeDictionaryValues() {
        let attribute = CharacterAttribute.UnderlineStyle(.StyleDouble)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSUnderlineStyleAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssert(value is NSNumber, "The attribute should use an NSNumber as the dictionary value")
        let style = value as! NSNumber
        XCTAssertEqual(style.integerValue, NSUnderlineStyle.StyleDouble.rawValue, "The attribute should use the appropriate dictionary value")
    }

    func testStrokeColorAttribute() {
        let testColor = UIColor.orangeColor()
        let attribute = CharacterAttribute(name: NSStrokeColorAttributeName, value: testColor)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .StrokeColor attribute should be created with the provided color"
        if case .StrokeColor(let color) = attribute! {
            XCTAssertEqual(color, testColor, message)
        }
        else {
            XCTFail(message)
        }
    }

    func testStrokeColorAttributeWithoutColor() {
        let attribute = CharacterAttribute(name: NSStrokeColorAttributeName, value: NSObject())
        XCTAssert(attribute == nil, "An attribute should not have been created")
    }

    func testStrokeColorAttributeDictionaryValues() {
        let testColor = UIColor.orangeColor()
        let attribute = CharacterAttribute.StrokeColor(testColor)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSStrokeColorAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? UIColor, testColor, "The attribute should use the appropriate dictionary value")
    }

    func testStrokeWidthAttribute() {
        let attribute = CharacterAttribute(name: NSStrokeWidthAttributeName, value: 14.42)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .StrokeWidth attribute should be created with the provided value"
        if case .StrokeWidth(let width) = attribute! {
            XCTAssertEqual(width, 14.42, message)
        }
        else {
            XCTFail(message)
        }
    }

    func testStrokeWidthAttributeWithoutValue() {
        let attribute = CharacterAttribute(name: NSStrokeWidthAttributeName, value: NSObject())
        XCTAssert(attribute == nil, "An attribute should not have been created")
    }

    func testStrokeWidthAttributeDictionaryValues() {
        let attribute = CharacterAttribute.StrokeWidth(14.42)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSStrokeWidthAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssert(value is NSNumber, "The attribute should use an NSNumber as the dictionary value")
        let width = value as! NSNumber
        XCTAssertEqual(width.floatValue, 14.42, "The attribute should use the appropriate dictionary value")
    }

    func testShadowAttribute() {
        let testShadow = NSShadow()
        testShadow.shadowOffset = CGSize(width: 14, height: 42)
        let attribute = CharacterAttribute(name: NSShadowAttributeName, value: testShadow)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .Shadow attribute should be created with the provided shadow"
        if case .Shadow(let shadow) = attribute! {
            XCTAssertEqual(shadow, testShadow, message)
        }
        else {
            XCTFail(message)
        }
    }

    func testShadowAttributeWithoutShadow() {
        let attribute = CharacterAttribute(name: NSShadowAttributeName, value: NSObject())
        XCTAssert(attribute == nil, "An attribute should not have been created")
    }

    func testShadowAttributeDictionaryValues() {
        let testShadow = NSShadow()
        testShadow.shadowOffset = CGSize(width: 14, height: 42)
        let attribute = CharacterAttribute.Shadow(testShadow)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSShadowAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? NSShadow, testShadow, "The attribute should use the appropriate dictionary value")
    }

    func testTextEffectAttribute() {
        let attribute = CharacterAttribute(name: NSTextEffectAttributeName, value: NSTextEffectLetterpressStyle)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .TextEffect attribute should be created with the provided effect"
        if case .TextEffect(let effect) = attribute! {
            XCTAssertEqual(effect, NSTextEffectLetterpressStyle, message)
        }
        else {
            XCTFail(message)
        }
    }

    func testTextEffectAttributeWithoutEffect() {
        let attribute = CharacterAttribute(name: NSTextEffectAttributeName, value: NSObject())
        XCTAssert(attribute == nil, "An attribute should not have been created")
    }

    func testTextEffectAttributeDictionaryValues() {
        let attribute = CharacterAttribute.TextEffect(NSTextEffectLetterpressStyle)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSTextEffectAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? String, NSTextEffectLetterpressStyle, "The attribute should use the appropriate dictionary value")
    }

    func testAttachmentAttribute() {
        let testAttachment = NSTextAttachment(data: nil, ofType: "sample type")
        testAttachment.fileType = "application/text"
        let attribute = CharacterAttribute(name: NSAttachmentAttributeName, value: testAttachment)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .Attachment attribute should be created with the provided attachment"
        if case .Attachment(let attachment) = attribute! {
            XCTAssertEqual(attachment, testAttachment, message)
        }
        else {
            XCTFail(message)
        }
    }

    func testAttachmentAttributeWithoutAttachment() {
        let attribute = CharacterAttribute(name: NSAttachmentAttributeName, value: NSObject())
        XCTAssert(attribute == nil, "An attribute should not have been created")
    }

    func testAttachmentAttributeDictionaryValues() {
        let testAttachment = NSTextAttachment(data: nil, ofType: "sample type")
        testAttachment.fileType = "application/text"
        let attribute = CharacterAttribute.Attachment(testAttachment)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSAttachmentAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? NSTextAttachment, testAttachment, "The attribute should use the appropriate dictionary value")
    }

    func testLinkAttribute() {
        let testLink = NSURL(string: "http://example.com")!
        let attribute = CharacterAttribute(name: NSLinkAttributeName, value: testLink)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .Link attribute should be created with the provided URL"
        if case .Link(let link) = attribute! {
            XCTAssertEqual(link, testLink, message)
        }
        else {
            XCTFail(message)
        }
    }

    func testLinkAttributeWithoutLink() {
        let attribute = CharacterAttribute(name: NSLinkAttributeName, value: NSObject())
        XCTAssert(attribute == nil, "An attribute should not have been created")
    }

    func testLinkAttributeDictionaryValues() {
        let testLink = NSURL(string: "http://example.com")!
        let attribute = CharacterAttribute.Link(testLink)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSLinkAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? NSURL, testLink, "The attribute should use the appropriate dictionary value")
    }

    func testBaselineOffsetAttribute() {
        let attribute = CharacterAttribute(name: NSBaselineOffsetAttributeName, value: 14.42)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .BaselineOffset attribute should be created with the provided value"
        if case .BaselineOffset(let width) = attribute! {
            XCTAssertEqual(width, 14.42, message)
        }
        else {
            XCTFail(message)
        }
    }

    func testBaselineOffsetAttributeWithoutValue() {
        let attribute = CharacterAttribute(name: NSBaselineOffsetAttributeName, value: NSObject())
        XCTAssert(attribute == nil, "An attribute should not have been created")
    }

    func testBaselineOffsetAttributeDictionaryValues() {
        let attribute = CharacterAttribute.BaselineOffset(14.42)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSBaselineOffsetAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssert(value is NSNumber, "The attribute should use an NSNumber as the dictionary value")
        let width = value as! NSNumber
        XCTAssertEqual(width.floatValue, 14.42, "The attribute should use the appropriate dictionary value")
    }

    func testStrikethroughColorAttribute() {
        let testColor = UIColor.orangeColor()
        let attribute = CharacterAttribute(name: NSStrikethroughColorAttributeName, value: testColor)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .StrikethroughColor attribute should be created with the provided color"
        if case .StrikethroughColor(let color) = attribute! {
            XCTAssertEqual(color, testColor, message)
        }
        else {
            XCTFail(message)
        }
    }

    func testStrikethroughColorAttributeWithoutColor() {
        let attribute = CharacterAttribute(name: NSStrikethroughColorAttributeName, value: NSObject())
        XCTAssert(attribute == nil, "An attribute should not have been created")
    }

    func testStrikethroughColorAttributeDictionaryValues() {
        let testColor = UIColor.orangeColor()
        let attribute = CharacterAttribute.StrikethroughColor(testColor)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSStrikethroughColorAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? UIColor, testColor, "The attribute should use the appropriate dictionary value")
    }

    func testUnderlineColorAttribute() {
        let testColor = UIColor.orangeColor()
        let attribute = CharacterAttribute(name: NSUnderlineColorAttributeName, value: testColor)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .UnderlineColor attribute should be created with the provided color"
        if case .UnderlineColor(let color) = attribute! {
            XCTAssertEqual(color, testColor, message)
        }
        else {
            XCTFail(message)
        }
    }

    func testUnderlineColorAttributeWithoutColor() {
        let attribute = CharacterAttribute(name: NSUnderlineColorAttributeName, value: NSObject())
        XCTAssert(attribute == nil, "An attribute should not have been created")
    }

    func testUnderlineColorAttributeDictionaryValues() {
        let testColor = UIColor.orangeColor()
        let attribute = CharacterAttribute.UnderlineColor(testColor)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSUnderlineColorAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as? UIColor, testColor, "The attribute should use the appropriate dictionary value")
    }

    func testObliquenessAttribute() {
        let attribute = CharacterAttribute(name: NSObliquenessAttributeName, value: 14.42)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .Obliqueness attribute should be created with the provided value"
        if case .Obliqueness(let kern) = attribute! {
            XCTAssertEqual(kern, 14.42, message)
        }
        else {
            XCTFail(message)
        }
    }

    func testObliquenessAttributeWithoutValue() {
        let attribute = CharacterAttribute(name: NSObliquenessAttributeName, value: NSObject())
        XCTAssert(attribute == nil, "An attribute should not have been created")
    }

    func testObliquenessAttributeDictionaryValues() {
        let attribute = CharacterAttribute.Obliqueness(14.42)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSObliquenessAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssert(value is NSNumber, "The attribute should use an NSNumber as the dictionary value")
        let kern = value as! NSNumber
        XCTAssertEqual(kern.floatValue, 14.42, "The attribute should use the appropriate dictionary value")
    }

    func testExpansionAttribute() {
        let attribute = CharacterAttribute(name: NSExpansionAttributeName, value: 14.42)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .Expansion attribute should be created with the provided value"
        if case .Expansion(let expansion) = attribute! {
            XCTAssertEqual(expansion, 14.42, message)
        }
        else {
            XCTFail(message)
        }
    }

    func testExpansionAttributeWithoutValue() {
        let attribute = CharacterAttribute(name: NSExpansionAttributeName, value: NSObject())
        XCTAssert(attribute == nil, "An attribute should not have been created")
    }

    func testExpansionAttributeDictionaryValues() {
        let attribute = CharacterAttribute.Expansion(14.42)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSExpansionAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssert(value is NSNumber, "The attribute should use an NSNumber as the dictionary value")
        let expansion = value as! NSNumber
        XCTAssertEqual(expansion.floatValue, 14.42, "The attribute should use the appropriate dictionary value")
    }

    func testWritingDirectionAttribute() {
        let attribute = CharacterAttribute(
            name: NSWritingDirectionAttributeName,
            value: [0, 2, 1, 3]
        )
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .WritingDirection attribute should be created with the provided overrides"
        if case .WritingDirection(let overrides) = attribute! {
            XCTAssertEqual(overrides.count, 4, "There should be 4 direction overrides")
            XCTAssertEqual(overrides[0], 0, message)
            XCTAssertEqual(overrides[1], 2, message)
            XCTAssertEqual(overrides[2], 1, message)
            XCTAssertEqual(overrides[3], 3, message)
        }
        else {
            XCTFail(message)
        }
    }

    func testWritingDirectionAttributeWithoutValue() {
        let attribute = CharacterAttribute(name: NSWritingDirectionAttributeName, value: NSObject())
        XCTAssert(attribute == nil, "An attribute should not have been created")
    }

    func testWritingDirectionAttributeDictionaryValues() {
        let attribute = CharacterAttribute.WritingDirection([0, 3, 2, 1])
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSWritingDirectionAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssertEqual(value as! [Int], [0, 3, 2, 1], "The attribute should use the appropriate dictionary value")
    }

    func testUseVerticalGlyphFormAttribute() {
        let attribute = CharacterAttribute(name: NSVerticalGlyphFormAttributeName, value: false)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .UseVerticalGlyphForm attribute should be created with the provided boolean"
        if case .UseVerticalGlyphForm(let shouldUseVerticalGlyphForm) = attribute! {
            XCTAssertFalse(shouldUseVerticalGlyphForm, message)
        }
        else {
            XCTFail(message)
        }
    }

    func testUseVerticalGlyphFormAttributeWithoutValue() {
        let attribute = CharacterAttribute(name: NSVerticalGlyphFormAttributeName, value: NSObject())
        XCTAssert(attribute == nil, "An attribute should not have been created")
    }

    func testUseVerticalGlyphFormAttributeDictionaryValues() {
        let attribute = CharacterAttribute.UseVerticalGlyphForm(true)
        let (key, value) = attribute.keyValuePair
        XCTAssertEqual(key, NSVerticalGlyphFormAttributeName, "The attribute should use the appropriate dictionary key")
        XCTAssert(value is NSNumber, "The attribute should use an NSNumber as the dictionary value")
        let shouldUseVerticalGlyphForm = value as! NSNumber
        XCTAssertTrue(shouldUseVerticalGlyphForm.boolValue, "The attribute should use the appropriate dictionary value")
    }
    
}
