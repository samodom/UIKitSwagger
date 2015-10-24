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

    //  MARK: Font

    private let testFont = UIFont.systemFontOfSize(14)

    func testFontAttribute() {
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

    func testHashabilityOfFontAttribute() {
        let attribute1 = CharacterAttribute.Font(testFont)
        let attribute2 = CharacterAttribute.Font(testFont)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSFontAttributeName.hashValue ^ testFont.hashValue, "The hash value should combine the dictionary key and the associated value")

        let attribute3 = CharacterAttribute.Font(UIFont.systemFontOfSize(42))
        XCTAssertNotEqual(attribute1, attribute3, "Font attributes with unequal fonts are unequal")
    }

    //  MARK: Paragraph style

    private let testParagraphStyle: NSParagraphStyle = {
        let mutableStyle = NSMutableParagraphStyle()
        mutableStyle.alignment = .Right
        mutableStyle.maximumLineHeight = 14.42
        return mutableStyle.copy() as! NSParagraphStyle
    }()

    func testParagraphStyleAttribute() {
        let attribute = CharacterAttribute(name: NSParagraphStyleAttributeName, value: testParagraphStyle)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .ParagraphStyle attribute should be created with the provided paragraph style"
        if case .ParagraphStyle(let style) = attribute! {
            XCTAssertEqual(style, testParagraphStyle, message)
        }
        else {
            XCTFail(message)
        }
    }

    func testParagraphStyleAttributeWithoutStyle() {
        let attribute = CharacterAttribute(name: NSParagraphStyleAttributeName, value: NSObject())
        XCTAssert(attribute == nil, "An attribute should not have been created")
    }

    func testHashabilityOfParagraphStyleAttribute() {
        let attribute1 = CharacterAttribute.ParagraphStyle(testParagraphStyle)
        let attribute2 = CharacterAttribute.ParagraphStyle(testParagraphStyle)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSParagraphStyleAttributeName.hashValue ^ testParagraphStyle.hashValue, "The hash value should combine the dictionary key and the associated value")

        let attribute3 = CharacterAttribute.ParagraphStyle(NSParagraphStyle())
        XCTAssertNotEqual(attribute1, attribute3, "Paragraph style attributes with unequal paragraph style are unequal")
    }

    //  MARK: Foreground color

    func testForegroundColorAttribute() {
        let testColor = Orange
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

    func testHashabilityOfForegroundColorAttribute() {
        let attribute1 = CharacterAttribute.ForegroundColor(Orange)
        let attribute2 = CharacterAttribute.ForegroundColor(Orange)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSForegroundColorAttributeName.hashValue ^ Orange.hashValue, "The hash value should combine the dictionary key and the associated value")

        let attribute3 = CharacterAttribute.ForegroundColor(Purple)
        XCTAssertNotEqual(attribute1, attribute3, "Foreground color attributes with unequal colors are unequal")
    }

    //  MARK: Background color

    func testBackgroundColorAttribute() {
        let testColor = Orange
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

    func testHashabilityOfBackgroundColorAttribute() {
        let attribute1 = CharacterAttribute.BackgroundColor(Orange)
        let attribute2 = CharacterAttribute.BackgroundColor(Orange)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSBackgroundColorAttributeName.hashValue ^ Orange.hashValue, "The hash value should combine the dictionary key and the associated value")

        let attribute3 = CharacterAttribute.BackgroundColor(Purple)
        XCTAssertNotEqual(attribute1, attribute3, "Background color attributes with unequal colors are unequal")
    }

    //  MARK: Ligatures

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

    func testHashabilityOfUseLigaturesAttribute() {
        let attribute1 = CharacterAttribute.UseLigatures(true)
        let attribute2 = CharacterAttribute.UseLigatures(true)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSLigatureAttributeName.hashValue ^ (true as NSNumber).hashValue, "The hash value should combine the dictionary key and the associated value")

        let attribute3 = CharacterAttribute.UseLigatures(false)
        XCTAssertNotEqual(attribute1, attribute3, "Use ligatures attributes with unequal flags are unequal")
    }

    //  MARK: Kern

    func testKernAttribute() {
        let attribute = CharacterAttribute(name: NSKernAttributeName, value: CGFloat(14.42))
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

    func testHashabilityOfKernAttribute() {
        let attribute1 = CharacterAttribute.Kern(14.42)
        let attribute2 = CharacterAttribute.Kern(14.42)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSKernAttributeName.hashValue ^ (14.42 as NSNumber).hashValue, "The hash value should combine the dictionary key and the associated value")

        let attribute3 = CharacterAttribute.Kern(42.14)
        XCTAssertNotEqual(attribute1, attribute3, "Kern attributes with unequal values are unequal")
    }
    
    //  MARK: Strikethrough style

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

    func testHashabilityOfStrikethroughStyleAttribute() {
        let attribute1 = CharacterAttribute.StrikethroughStyle(.StyleThick)
        let attribute2 = CharacterAttribute.StrikethroughStyle(.StyleThick)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        let styleHash = (NSUnderlineStyle.StyleThick.rawValue as NSNumber).hashValue
        XCTAssertEqual(attribute1.hashValue, NSStrikethroughStyleAttributeName.hashValue ^ styleHash, "The hash value should combine the dictionary key and the associated value")

        let attribute3 = CharacterAttribute.StrikethroughStyle(.StyleDouble)
        XCTAssertNotEqual(attribute1, attribute3, "Strikethrough style attributes with unequal styles are unequal")
    }

    //  MARK: Underline style

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

    func testHashabilityOfUnderlineStyleAttribute() {
        let attribute1 = CharacterAttribute.UnderlineStyle(.StyleDouble)
        let attribute2 = CharacterAttribute.UnderlineStyle(.StyleDouble)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        let styleHash = (NSUnderlineStyle.StyleDouble.rawValue as NSNumber).hashValue
        XCTAssertEqual(attribute1.hashValue, NSUnderlineStyleAttributeName.hashValue ^ styleHash, "The hash value should combine the dictionary key and the associated value")

        let attribute3 = CharacterAttribute.UnderlineStyle(.StyleThick)
        XCTAssertNotEqual(attribute1, attribute3, "Underline style attributes with unequal styles are unequal")
    }
    
    //  MARK: Stroke color

    func testStrokeColorAttribute() {
        let testColor = Orange
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

    func testHashabilityOfStrokeColorAttribute() {
        let attribute1 = CharacterAttribute.StrokeColor(Orange)
        let attribute2 = CharacterAttribute.StrokeColor(Orange)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSStrokeColorAttributeName.hashValue ^ Orange.hashValue, "The hash value should combine the dictionary key and the associated value")

        let attribute3 = CharacterAttribute.StrokeColor(Purple)
        XCTAssertNotEqual(attribute1, attribute3, "Stroke color attributes with unequal colors are unequal")
    }

    //  MARK: Stroke width

    func testStrokeWidthAttribute() {
        let attribute = CharacterAttribute(name: NSStrokeWidthAttributeName, value: CGFloat(14.42))
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

    func testHashabilityOfStrokeWidthAttribute() {
        let attribute1 = CharacterAttribute.StrokeWidth(14.42)
        let attribute2 = CharacterAttribute.StrokeWidth(14.42)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSStrokeWidthAttributeName.hashValue ^ (14.42 as NSNumber).hashValue, "The hash value should combine the dictionary key and the associated value")

        let attribute3 = CharacterAttribute.StrokeWidth(42.14)
        XCTAssertNotEqual(attribute1, attribute3, "Stroke width attributes with unequal widths are unequal")
    }

    //  MARK: Shadow

    private let testShadow: NSShadow = {
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 14, height: 42)
        return shadow
    }()

    func testShadowAttribute() {
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

    func testHashabilityOfShadowAttribute() {
        let attribute1 = CharacterAttribute.Shadow(testShadow)
        let attribute2 = CharacterAttribute.Shadow(testShadow)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSShadowAttributeName.hashValue ^ testShadow.hashValue, "The hash value should combine the dictionary key and the associated value")

        let attribute3 = CharacterAttribute.Shadow(NSShadow())
        XCTAssertNotEqual(attribute1, attribute3, "Shadow attributes with unequal shadows are unequal")
    }
    
    //  MARK: Text effect

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

    func testHashabilityOfTextEffectAttribute() {
        let attribute1 = CharacterAttribute.TextEffect(NSTextEffectLetterpressStyle)
        let attribute2 = CharacterAttribute.TextEffect(NSTextEffectLetterpressStyle)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSTextEffectAttributeName.hashValue ^ (NSTextEffectLetterpressStyle as NSString).hashValue, "The hash value should combine the dictionary key and the associated value")

        let attribute3 = CharacterAttribute.TextEffect("sample")
        XCTAssertNotEqual(attribute1, attribute3, "Text effect attributes with unequal effects are unequal")
    }


    //  MARK: Attachment

    let testAttachment: NSTextAttachment = {
        let attachment = NSTextAttachment(data: nil, ofType: "sample type")
        attachment.fileType = "application/text"
        return attachment
    }()

    func testAttachmentAttribute() {
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

    func testHashabilityOfAttachmentAttribute() {
        let attribute1 = CharacterAttribute.Attachment(testAttachment)
        let attribute2 = CharacterAttribute.Attachment(testAttachment)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSAttachmentAttributeName.hashValue ^ testAttachment.hashValue, "The hash value should combine the dictionary key and the associated value")

        let attribute3 = CharacterAttribute.Attachment(NSTextAttachment())
        XCTAssertNotEqual(attribute1, attribute3, "Attachment attributes with unequal attachments are unequal")
    }


    //  MARK: Link

    let testLink = NSURL(string: "http://example.com")!

    func testLinkAttribute() {
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

    func testHashabilityOfLinkAttribute() {
        let attribute1 = CharacterAttribute.Link(testLink)
        let attribute2 = CharacterAttribute.Link(testLink)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSLinkAttributeName.hashValue ^ testLink.hashValue, "The hash value should combine the dictionary key and the associated value")

        let attribute3 = CharacterAttribute.Link(NSURL(string: "http://somewhere.com")!)
        XCTAssertNotEqual(attribute1, attribute3, "Link attributes with unequal URLs are unequal")
    }
    
    //  MARK: Baseline offset

    func testBaselineOffsetAttribute() {
        let attribute = CharacterAttribute(name: NSBaselineOffsetAttributeName, value: CGFloat(14.42))
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

    func testHashabilityOfBaselineOffsetAttribute() {
        let attribute1 = CharacterAttribute.BaselineOffset(14.42)
        let attribute2 = CharacterAttribute.BaselineOffset(14.42)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSBaselineOffsetAttributeName.hashValue ^ (14.42 as NSNumber).hashValue, "The hash value should combine the dictionary key and the associated value")

        let attribute3 = CharacterAttribute.BaselineOffset(42.14)
        XCTAssertNotEqual(attribute1, attribute3, "Baseline offset attributes with unequal offsets are unequal")
    }
    
    //  MARK: Strikethrough color

    func testStrikethroughColorAttribute() {
        let testColor = Orange
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

    func testHashabilityOfStrikethroughColorAttribute() {
        let attribute1 = CharacterAttribute.StrikethroughColor(Orange)
        let attribute2 = CharacterAttribute.StrikethroughColor(Orange)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSStrikethroughColorAttributeName.hashValue ^ Orange.hashValue, "The hash value should combine the dictionary key and the associated value")

        let attribute3 = CharacterAttribute.StrikethroughColor(Purple)
        XCTAssertNotEqual(attribute1, attribute3, "Strikethrough color attributes with unequal colors are unequal")
    }

    //  MARK: Underline color

    func testUnderlineColorAttribute() {
        let testColor = Orange
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

    func testHashabilityOfUnderlineColorAttribute() {
        let attribute1 = CharacterAttribute.UnderlineColor(Orange)
        let attribute2 = CharacterAttribute.UnderlineColor(Orange)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSUnderlineColorAttributeName.hashValue ^ Orange.hashValue, "The hash value should combine the dictionary key and the associated value")

        let attribute3 = CharacterAttribute.UnderlineColor(Purple)
        XCTAssertNotEqual(attribute1, attribute3, "Underline color attributes with unequal colors are unequal")
    }
    
    //  MARK: Obliqueness

    func testObliquenessAttribute() {
        let attribute = CharacterAttribute(name: NSObliquenessAttributeName, value: CGFloat(14.42))
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

    func testHashabilityOfObliquenessAttribute() {
        let attribute1 = CharacterAttribute.Obliqueness(14.42)
        let attribute2 = CharacterAttribute.Obliqueness(14.42)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSObliquenessAttributeName.hashValue ^ (14.42 as NSNumber).hashValue, "The hash value should combine the dictionary key and the associated value")

        let attribute3 = CharacterAttribute.Obliqueness(42.14)
        XCTAssertNotEqual(attribute1, attribute3, "Obliqueness attributes with unequal values are unequal")
    }

    //  MARK: Expansion

    func testExpansionAttribute() {
        let attribute = CharacterAttribute(name: NSExpansionAttributeName, value: CGFloat(14.42))
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

    func testHashabilityOfExpansionAttribute() {
        let attribute1 = CharacterAttribute.Expansion(14.42)
        let attribute2 = CharacterAttribute.Expansion(14.42)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSExpansionAttributeName.hashValue ^ (14.42 as NSNumber).hashValue, "The hash value should combine the dictionary key and the associated value")

        let attribute3 = CharacterAttribute.Expansion(42.14)
        XCTAssertNotEqual(attribute1, attribute3, "Expansion attributes with unequal values are unequal")
    }

    //  MARK: Writing direction

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

    func testHashabilityOfWritingDirectionAttribute() {
        let attribute1 = CharacterAttribute.WritingDirection([0, 1, 2, 3])
        let attribute2 = CharacterAttribute.WritingDirection([0, 1, 2, 3])
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSWritingDirectionAttributeName.hashValue ^ [0, 1, 2, 3].hashValue, "The hash value should combine the dictionary key and the associated value")

        let attribute3 = CharacterAttribute.WritingDirection([0, 3, 2, 1])
        XCTAssertNotEqual(attribute1, attribute3, "Writing direction attributes with unequal overrides are unequal")
    }

    //  MARK: Vertical glyph form

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

    func testHashabilityOfUseVerticalGlyphFormAttribute() {
        let attribute1 = CharacterAttribute.UseVerticalGlyphForm(true)
        let attribute2 = CharacterAttribute.UseVerticalGlyphForm(true)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSVerticalGlyphFormAttributeName.hashValue ^ (true as NSNumber).hashValue, "The hash value should combine the dictionary key and the associated value")

        let attribute3 = CharacterAttribute.UseVerticalGlyphForm(false)
        XCTAssertNotEqual(attribute1, attribute3, "Vertical glyph form attributes with unequal flags are unequal")
    }

}
