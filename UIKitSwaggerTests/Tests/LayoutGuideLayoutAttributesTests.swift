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
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Left, "The attribute should be the left side")
    }

    func testLeftMarginAttributedItem() {
        attributedItem = guide.leftMargin
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Left, "The attribute should be the left side")
    }

    func testRightAttributedItem() {
        attributedItem = guide.right
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Right, "The attribute should be the right side")
    }

    func testRightMarginAttributedItem() {
        attributedItem = guide.rightMargin
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Right, "The attribute should be the right side")
    }

    func testTopAttributedItem() {
        attributedItem = guide.top
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Top, "The attribute should be the top side")
    }

    func testTopMarginAttributedItem() {
        attributedItem = guide.topMargin
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Top, "The attribute should be the top side")
    }

    func testBottomAttributedItem() {
        attributedItem = guide.bottom
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Bottom, "The attribute should be the bottom side")
    }

    func testBottomMarginAttributedItem() {
        attributedItem = guide.bottomMargin
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Bottom, "The attribute should be the bottom side")
    }

    func testLeadingAttributedItem() {
        attributedItem = guide.leading
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Leading, "The attribute should be the leading side")
    }

    func testLeadingMarginAttributedItem() {
        attributedItem = guide.leadingMargin
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Leading, "The attribute should be the leading side")
    }

    func testTrailingAttributedItem() {
        attributedItem = guide.trailing
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Trailing, "The attribute should be the trailing side")
    }

    func testTrailingMarginAttributedItem() {
        attributedItem = guide.trailingMargin
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Trailing, "The attribute should be the trailing side")
    }

    func testWidthAttributedItem() {
        attributedItem = guide.width
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Width, "The attribute should be the width dimension")
    }

    func testHeightAttributedItem() {
        attributedItem = guide.height
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Height, "The attribute should be the height dimension")
    }

    func testCenterXAttributedItem() {
        attributedItem = guide.centerX
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.CenterX, "The attribute should be the center X value")
    }

    func testCenterXInMarginsAttributedItem() {
        attributedItem = guide.centerXInMargins
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.CenterX, "The attribute should be the center X value")
    }

    func testCenterYAttributedItem() {
        attributedItem = guide.centerY
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.CenterY, "The attribute should be the center Y value")
    }

    func testCenterYInMarginsAttributedItem() {
        attributedItem = guide.centerYInMargins
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.CenterY, "The attribute should be the center Y value")
    }

    func testBaselineAttributedItem() {
        attributedItem = guide.baseline
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Bottom, "The attribute should be the bottom")
    }

    func testFirstBaselineAttributedItem() {
        attributedItem = guide.firstBaseline
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Bottom, "The attribute should be the first bottom")
    }

    func testNonAttributeAttributedItem() {
        attributedItem = guide.nonAttribute
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.NotAnAttribute, "The attribute should be not an attribute")
    }

    //  MARK: Conversion method

    func testLeftAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.Left)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Left, "The attribute should be the left side")
    }

    func testLeftMarginAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.LeftMargin)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Left, "The attribute should be the left side")
    }

    func testRightAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.Right)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Right, "The attribute should be the right side")
    }

    func testRightMarginAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.RightMargin)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Right, "The attribute should be the right side")
    }

    func testTopAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.Top)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Top, "The attribute should be the top side")
    }

    func testTopMarginAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.TopMargin)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Top, "The attribute should be the top")
    }

    func testBottomAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.Bottom)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Bottom, "The attribute should be the bottom side")
    }

    func testBottomMarginAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.BottomMargin)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Bottom, "The attribute should be the bottom side")
    }

    func testLeadingAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.Leading)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Leading, "The attribute should be the leading side")
    }

    func testLeadingMarginAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.LeadingMargin)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Leading, "The attribute should be the leading side")
    }

    func testTrailingAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.Trailing)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Trailing, "The attribute should be the trailing side")
    }

    func testTrailingMarginAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.TrailingMargin)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Trailing, "The attribute should be the trailing side")
    }

    func testWidthAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.Width)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Width, "The attribute should be the width dimension")
    }

    func testHeightAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.Height)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Height, "The attribute should be the height dimension")
    }

    func testCenterXAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.CenterX)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.CenterX, "The attribute should be the center X value")
    }

    func testCenterXInMarginsAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.CenterXWithinMargins)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.CenterX, "The attribute should be the center X value")
    }

    func testCenterYAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.CenterY)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.CenterY, "The attribute should be the center Y value")
    }

    func testCenterYInMarginsAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.CenterYWithinMargins)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.CenterY, "The attribute should be the center Y value")
    }

    func testBaselineAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.Baseline)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Bottom, "The attribute should be the bottom")
    }

    func testFirstBaselineAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.FirstBaseline)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Bottom, "The attribute should be the bottom")
    }

    func testNonAttributeAttributeConversion() {
        attributedItem = guide.attributedItemForLayoutAttribute(.NotAnAttribute)
        XCTAssertEqual(attributedItem.item as? UILayoutGuide, guide, "The item should be the guide itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.NotAnAttribute, "The attribute should be not an attribute")
    }

}
