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

    private let testFont = UIFont.systemFont(ofSize: 14)

    func testFontAttribute() {
        let attribute = CharacterAttribute(name: NSFontAttributeName, value: testFont)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .font attribute should be created with the provided font"
        if case .font(let font) = attribute! {
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
        let attribute1 = CharacterAttribute.font(testFont)
        let attribute2 = CharacterAttribute.font(testFont)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSFontAttributeName.hashValue, "The hash value should be the hash value of dictionary key")

        let attribute3 = CharacterAttribute.font(UIFont.systemFont(ofSize: 42))
        XCTAssertNotEqual(attribute1, attribute3, "Font attributes with unequal fonts are unequal")
    }

    //  MARK: Paragraph style

    private let testParagraphStyle: NSParagraphStyle = {
        let mutableStyle = NSMutableParagraphStyle()
        mutableStyle.alignment = .right
        mutableStyle.maximumLineHeight = 14.42
        return mutableStyle.copy() as! NSParagraphStyle
    }()

    func testParagraphStyleAttribute() {
        let attribute = CharacterAttribute(name: NSParagraphStyleAttributeName, value: testParagraphStyle)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .paragraphStyle attribute should be created with the provided paragraph style"
        if case .paragraphStyle(let style) = attribute! {
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
        let attribute1 = CharacterAttribute.paragraphStyle(testParagraphStyle)
        let attribute2 = CharacterAttribute.paragraphStyle(testParagraphStyle)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSParagraphStyleAttributeName.hashValue, "The hash value should be the hash value of dictionary key")

        let attribute3 = CharacterAttribute.paragraphStyle(NSParagraphStyle())
        XCTAssertNotEqual(attribute1, attribute3, "Paragraph style attributes with unequal paragraph style are unequal")
    }

    //  MARK: Foreground color

    func testForegroundColorAttribute() {
        let testColor = UIColor.orange
        let attribute = CharacterAttribute(name: NSForegroundColorAttributeName, value: testColor)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .foregroundColor attribute should be created with the provided color"
        if case .foregroundColor(let color) = attribute! {
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
        let color = UIColor.orange
        let attribute1 = CharacterAttribute.foregroundColor(color)
        let attribute2 = CharacterAttribute.foregroundColor(color)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSForegroundColorAttributeName.hashValue, "The hash value should be the hash value of dictionary key")

        let attribute3 = CharacterAttribute.foregroundColor(UIColor.purple)
        XCTAssertNotEqual(attribute1, attribute3, "Foreground color attributes with unequal colors are unequal")
    }

    //  MARK: Background color

    func testBackgroundColorAttribute() {
        let testColor = UIColor.orange
        let attribute = CharacterAttribute(name: NSBackgroundColorAttributeName, value: testColor)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .backgroundColor attribute should be created with the provided color"
        if case .backgroundColor(let color) = attribute! {
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
        let color = UIColor.orange
        let attribute1 = CharacterAttribute.backgroundColor(color)
        let attribute2 = CharacterAttribute.backgroundColor(color)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSBackgroundColorAttributeName.hashValue, "The hash value should be the hash value of dictionary key")

        let attribute3 = CharacterAttribute.backgroundColor(UIColor.purple)
        XCTAssertNotEqual(attribute1, attribute3, "Background color attributes with unequal colors are unequal")
    }

    //  MARK: Ligatures

    func testUseLigaturesAttribute() {
        let attribute = CharacterAttribute(name: NSLigatureAttributeName, value: false)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .useLigatures attribute should be created with the provided boolean"
        if case .useLigatures(let shouldUseLigatures) = attribute! {
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
        let attribute1 = CharacterAttribute.useLigatures(true)
        let attribute2 = CharacterAttribute.useLigatures(true)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSLigatureAttributeName.hashValue, "The hash value should be the hash value of dictionary key")

        let attribute3 = CharacterAttribute.useLigatures(false)
        XCTAssertNotEqual(attribute1, attribute3, "Use ligatures attributes with unequal flags are unequal")
    }

    //  MARK: Kern

    func testKernAttribute() {
        let attribute = CharacterAttribute(name: NSKernAttributeName, value: CGFloat(14.42))
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .kern attribute should be created with the provided value"
        if case .kern(let kern) = attribute! {
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
        let attribute1 = CharacterAttribute.kern(14.42)
        let attribute2 = CharacterAttribute.kern(14.42)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSKernAttributeName.hashValue, "The hash value should be the hash value of dictionary key")

        let attribute3 = CharacterAttribute.kern(42.14)
        XCTAssertNotEqual(attribute1, attribute3, "Kern attributes with unequal values are unequal")
    }
    
    //  MARK: Strikethrough style

    func testStrikethroughStyleAttribute() {
        let attribute = CharacterAttribute(name: NSStrikethroughStyleAttributeName, value: NSUnderlineStyle.styleThick.rawValue)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .strikethroughStyle attribute should be created with the provided style"
        if case .strikethroughStyle(let style) = attribute! {
            XCTAssertEqual(style, NSUnderlineStyle.styleThick, message)
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
        let attribute1 = CharacterAttribute.strikethroughStyle(.styleThick)
        let attribute2 = CharacterAttribute.strikethroughStyle(.styleThick)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSStrikethroughStyleAttributeName.hashValue, "The hash value should be the hash value of dictionary key")

        let attribute3 = CharacterAttribute.strikethroughStyle(.styleDouble)
        XCTAssertNotEqual(attribute1, attribute3, "Strikethrough style attributes with unequal styles are unequal")
    }

    //  MARK: Underline style

    func testUnderlineStyleAttribute() {
        let attribute = CharacterAttribute(name: NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleThick.rawValue)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .underlineStyle attribute should be created with the provided style"
        if case .underlineStyle(let style) = attribute! {
            XCTAssertEqual(style, NSUnderlineStyle.styleThick, message)
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
        let attribute1 = CharacterAttribute.underlineStyle(.styleDouble)
        let attribute2 = CharacterAttribute.underlineStyle(.styleDouble)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSUnderlineStyleAttributeName.hashValue, "The hash value should be the hash value of dictionary key")

        let attribute3 = CharacterAttribute.underlineStyle(.styleThick)
        XCTAssertNotEqual(attribute1, attribute3, "Underline style attributes with unequal styles are unequal")
    }
    
    //  MARK: Stroke color

    func testStrokeColorAttribute() {
        let testColor = UIColor.orange
        let attribute = CharacterAttribute(name: NSStrokeColorAttributeName, value: testColor)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .strokeColor attribute should be created with the provided color"
        if case .strokeColor(let color) = attribute! {
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
        let color = UIColor.orange
        let attribute1 = CharacterAttribute.strokeColor(color)
        let attribute2 = CharacterAttribute.strokeColor(color)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSStrokeColorAttributeName.hashValue, "The hash value should be the hash value of dictionary key")

        let attribute3 = CharacterAttribute.strokeColor(UIColor.purple)
        XCTAssertNotEqual(attribute1, attribute3, "Stroke color attributes with unequal colors are unequal")
    }

    //  MARK: Stroke width

    func testStrokeWidthAttribute() {
        let attribute = CharacterAttribute(name: NSStrokeWidthAttributeName, value: CGFloat(14.42))
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .strokeWidth attribute should be created with the provided value"
        if case .strokeWidth(let width) = attribute! {
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
        let attribute1 = CharacterAttribute.strokeWidth(14.42)
        let attribute2 = CharacterAttribute.strokeWidth(14.42)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSStrokeWidthAttributeName.hashValue,"The hash value should be the hash value of dictionary key")

        let attribute3 = CharacterAttribute.strokeWidth(42.14)
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

        let message = "A .shadow attribute should be created with the provided shadow"
        if case .shadow(let shadow) = attribute! {
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
        let attribute1 = CharacterAttribute.shadow(testShadow)
        let attribute2 = CharacterAttribute.shadow(testShadow)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSShadowAttributeName.hashValue, "The hash value should be the hash value of dictionary key")

        let attribute3 = CharacterAttribute.shadow(NSShadow())
        XCTAssertNotEqual(attribute1, attribute3, "Shadow attributes with unequal shadows are unequal")
    }
    
    //  MARK: Text effect

    func testTextEffectAttribute() {
        let attribute = CharacterAttribute(name: NSTextEffectAttributeName, value: NSTextEffectLetterpressStyle)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .textEffect attribute should be created with the provided effect"
        if case .textEffect(let effect) = attribute! {
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
        let attribute1 = CharacterAttribute.textEffect(NSTextEffectLetterpressStyle)
        let attribute2 = CharacterAttribute.textEffect(NSTextEffectLetterpressStyle)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSTextEffectAttributeName.hashValue, "The hash value should be the hash value of dictionary key")

        let attribute3 = CharacterAttribute.textEffect("sample")
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
        if case .attachment(let attachment) = attribute! {
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
        let attribute1 = CharacterAttribute.attachment(testAttachment)
        let attribute2 = CharacterAttribute.attachment(testAttachment)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSAttachmentAttributeName.hashValue, "The hash value should be the hash value of dictionary key")

        let attribute3 = CharacterAttribute.attachment(NSTextAttachment())
        XCTAssertNotEqual(attribute1, attribute3, "Attachment attributes with unequal attachments are unequal")
    }


    //  MARK: Link

    let testLink = URL(string: "http://example.com")!

    func testLinkAttribute() {
        let attribute = CharacterAttribute(name: NSLinkAttributeName, value: testLink)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .Link attribute should be created with the provided URL"
        if case .link(let link) = attribute! {
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
        let attribute1 = CharacterAttribute.link(testLink)
        let attribute2 = CharacterAttribute.link(testLink)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSLinkAttributeName.hashValue, "The hash value should be the hash value of dictionary key")

        let attribute3 = CharacterAttribute.link(URL(string: "http://somewhere.com")!)
        XCTAssertNotEqual(attribute1, attribute3, "Link attributes with unequal URLs are unequal")
    }
    
    //  MARK: Baseline offset

    func testBaselineOffsetAttribute() {
        let attribute = CharacterAttribute(name: NSBaselineOffsetAttributeName, value: CGFloat(14.42))
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .baselineOffset attribute should be created with the provided value"
        if case .baselineOffset(let width) = attribute! {
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
        let attribute1 = CharacterAttribute.baselineOffset(14.42)
        let attribute2 = CharacterAttribute.baselineOffset(14.42)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSBaselineOffsetAttributeName.hashValue, "The hash value should be the hash value of dictionary key")

        let attribute3 = CharacterAttribute.baselineOffset(42.14)
        XCTAssertNotEqual(attribute1, attribute3, "Baseline offset attributes with unequal offsets are unequal")
    }
    
    //  MARK: Strikethrough color

    func testStrikethroughColorAttribute() {
        let testColor = UIColor.orange
        let attribute = CharacterAttribute(name: NSStrikethroughColorAttributeName, value: testColor)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .strikethroughColor attribute should be created with the provided color"
        if case .strikethroughColor(let color) = attribute! {
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
        let color = UIColor.orange
        let attribute1 = CharacterAttribute.strikethroughColor(color)
        let attribute2 = CharacterAttribute.strikethroughColor(color)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSStrikethroughColorAttributeName.hashValue, "The hash value should be the hash value of dictionary key")

        let attribute3 = CharacterAttribute.strikethroughColor(UIColor.purple)
        XCTAssertNotEqual(attribute1, attribute3, "Strikethrough color attributes with unequal colors are unequal")
    }

    //  MARK: Underline color

    func testUnderlineColorAttribute() {
        let testColor = UIColor.orange
        let attribute = CharacterAttribute(name: NSUnderlineColorAttributeName, value: testColor)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .underlineColor attribute should be created with the provided color"
        if case .underlineColor(let color) = attribute! {
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
        let color = UIColor.orange
        let attribute1 = CharacterAttribute.underlineColor(color)
        let attribute2 = CharacterAttribute.underlineColor(color)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSUnderlineColorAttributeName.hashValue, "The hash value should be the hash value of dictionary key")

        let attribute3 = CharacterAttribute.underlineColor(UIColor.purple)
        XCTAssertNotEqual(attribute1, attribute3, "Underline color attributes with unequal colors are unequal")
    }
    
    //  MARK: Obliqueness

    func testObliquenessAttribute() {
        let attribute = CharacterAttribute(name: NSObliquenessAttributeName, value: CGFloat(14.42))
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .obliqueness attribute should be created with the provided value"
        if case .obliqueness(let kern) = attribute! {
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
        let attribute1 = CharacterAttribute.obliqueness(14.42)
        let attribute2 = CharacterAttribute.obliqueness(14.42)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSObliquenessAttributeName.hashValue, "The hash value should be the hash value of dictionary key")

        let attribute3 = CharacterAttribute.obliqueness(42.14)
        XCTAssertNotEqual(attribute1, attribute3, "Obliqueness attributes with unequal values are unequal")
    }

    //  MARK: Expansion

    func testExpansionAttribute() {
        let attribute = CharacterAttribute(name: NSExpansionAttributeName, value: CGFloat(14.42))
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .expansion attribute should be created with the provided value"
        if case .expansion(let expansion) = attribute! {
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
        let attribute1 = CharacterAttribute.expansion(14.42)
        let attribute2 = CharacterAttribute.expansion(14.42)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSExpansionAttributeName.hashValue, "The hash value should be the hash value of dictionary key")

        let attribute3 = CharacterAttribute.expansion(42.14)
        XCTAssertNotEqual(attribute1, attribute3, "Expansion attributes with unequal values are unequal")
    }

    //  MARK: Writing direction

    func testWritingDirectionAttribute() {
        let attribute = CharacterAttribute(
            name: NSWritingDirectionAttributeName,
            value: [0, 2, 1, 3]
        )
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .writingDirection attribute should be created with the provided overrides"
        if case .writingDirection(let overrides) = attribute! {
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
        let attribute1 = CharacterAttribute.writingDirection([0, 1, 2, 3])
        let attribute2 = CharacterAttribute.writingDirection([0, 1, 2, 3])
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSWritingDirectionAttributeName.hashValue, "The hash value should be the hash value of dictionary key")

        let attribute3 = CharacterAttribute.writingDirection([0, 3, 2, 1])
        XCTAssertNotEqual(attribute1, attribute3, "Writing direction attributes with unequal overrides are unequal")
    }

    //  MARK: Vertical glyph form

    func testUseVerticalGlyphFormAttribute() {
        let attribute = CharacterAttribute(name: NSVerticalGlyphFormAttributeName, value: false)
        XCTAssert(attribute != nil, "An attribute should have been created")

        let message = "A .useVerticalGlyphForm attribute should be created with the provided boolean"
        if case .useVerticalGlyphForm(let shouldUseVerticalGlyphForm) = attribute! {
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
        let attribute1 = CharacterAttribute.useVerticalGlyphForm(true)
        let attribute2 = CharacterAttribute.useVerticalGlyphForm(true)
        XCTAssertEqual(attribute1, attribute2, "The two attributes should be equal")
        XCTAssertEqual(attribute1.hashValue, attribute2.hashValue, "Equal attributes should produce the same hash value")
        XCTAssertEqual(attribute1.hashValue, NSVerticalGlyphFormAttributeName.hashValue.hashValue, "The hash value should be the hash value of dictionary key")

        let attribute3 = CharacterAttribute.useVerticalGlyphForm(false)
        XCTAssertNotEqual(attribute1, attribute3, "Vertical glyph form attributes with unequal flags are unequal")
    }

}
