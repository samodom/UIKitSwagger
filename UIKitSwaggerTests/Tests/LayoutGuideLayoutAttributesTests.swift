//
//  LayoutGuideLayoutAttributesTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 6/24/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import XCTest
import UIKitSwagger

@available(iOS 9.0, *)
class LayoutGuideLayoutAttributesTests: XCTestCase {
    

    var attributedItem: AutoLayoutAttributedItem!
    let guide = UILayoutGuide()

    //  MARK: Properties

    func testLeftAttributedItem() {
        attributedItem = guide.left
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.left, "The attribute should be the left side")
    }

    func testLeftMarginAttributedItem() {
        attributedItem = guide.leftMargin
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.left, "The attribute should be the left side")
    }

    func testRightAttributedItem() {
        attributedItem = guide.right
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.right, "The attribute should be the right side")
    }

    func testRightMarginAttributedItem() {
        attributedItem = guide.rightMargin
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.right, "The attribute should be the right side")
    }

    func testTopAttributedItem() {
        attributedItem = guide.top
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.top, "The attribute should be the top side")
    }

    func testTopMarginAttributedItem() {
        attributedItem = guide.topMargin
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.top, "The attribute should be the top side")
    }

    func testBottomAttributedItem() {
        attributedItem = guide.bottom
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.bottom, "The attribute should be the bottom side")
    }

    func testBottomMarginAttributedItem() {
        attributedItem = guide.bottomMargin
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.bottom, "The attribute should be the bottom side")
    }

    func testLeadingAttributedItem() {
        attributedItem = guide.leading
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.leading, "The attribute should be the leading side")
    }

    func testLeadingMarginAttributedItem() {
        attributedItem = guide.leadingMargin
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.leading, "The attribute should be the leading side")
    }

    func testTrailingAttributedItem() {
        attributedItem = guide.trailing
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.trailing, "The attribute should be the trailing side")
    }

    func testTrailingMarginAttributedItem() {
        attributedItem = guide.trailingMargin
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.trailing, "The attribute should be the trailing side")
    }

    func testWidthAttributedItem() {
        attributedItem = guide.width
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.width, "The attribute should be the width dimension")
    }

    func testHeightAttributedItem() {
        attributedItem = guide.height
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.height, "The attribute should be the height dimension")
    }

    func testCenterXAttributedItem() {
        attributedItem = guide.centerX
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerX, "The attribute should be the center X value")
    }

    func testCenterXInMarginsAttributedItem() {
        attributedItem = guide.centerXInMargins
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerX, "The attribute should be the center X value")
    }

    func testCenterYAttributedItem() {
        attributedItem = guide.centerY
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerY, "The attribute should be the center Y value")
    }

    func testCenterYInMarginsAttributedItem() {
        attributedItem = guide.centerYInMargins
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerY, "The attribute should be the center Y value")
    }

    func testBaselineAttributedItem() {
        attributedItem = guide.baseline
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.bottom, "The attribute should be the bottom")
    }

    func testFirstBaselineAttributedItem() {
        attributedItem = guide.firstBaseline
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.bottom, "The attribute should be the first bottom")
    }

    func testNonAttributeAttributedItem() {
        attributedItem = guide.nonAttribute
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.notAnAttribute, "The attribute should be not an attribute")
    }

    //  MARK: Conversion method

    func testLeftAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.left)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.left, "The attribute should be the left side")
    }

    func testLeftMarginAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.leftMargin)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.left, "The attribute should be the left side")
    }

    func testRightAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.right)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.right, "The attribute should be the right side")
    }

    func testRightMarginAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.rightMargin)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.right, "The attribute should be the right side")
    }

    func testTopAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.top)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.top, "The attribute should be the top side")
    }

    func testTopMarginAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.topMargin)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.top, "The attribute should be the top")
    }

    func testBottomAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.bottom)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.bottom, "The attribute should be the bottom side")
    }

    func testBottomMarginAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.bottomMargin)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.bottom, "The attribute should be the bottom side")
    }

    func testLeadingAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.leading)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.leading, "The attribute should be the leading side")
    }

    func testLeadingMarginAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.leadingMargin)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.leading, "The attribute should be the leading side")
    }

    func testTrailingAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.trailing)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.trailing, "The attribute should be the trailing side")
    }

    func testTrailingMarginAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.trailingMargin)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.trailing, "The attribute should be the trailing side")
    }

    func testWidthAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.width)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.width, "The attribute should be the width dimension")
    }

    func testHeightAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.height)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.height, "The attribute should be the height dimension")
    }

    func testCenterXAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.centerX)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerX, "The attribute should be the center X value")
    }

    func testCenterXInMarginsAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.centerXWithinMargins)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerX, "The attribute should be the center X value")
    }

    func testCenterYAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.centerY)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerY, "The attribute should be the center Y value")
    }

    func testCenterYInMarginsAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.centerYWithinMargins)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerY, "The attribute should be the center Y value")
    }

    func testBaselineAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.lastBaseline)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.bottom, "The attribute should be the bottom")
    }

    func testFirstBaselineAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.firstBaseline)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.bottom, "The attribute should be the bottom")
    }

    func testNonAttributeAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.notAnAttribute)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.notAnAttribute, "The attribute should be not an attribute")
    }

}
