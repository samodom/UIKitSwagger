//
//  ViewLayoutAttributesTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest
@testable import UIKitSwagger

class ViewLayoutAttributesTests: XCTestCase {

    var attributedItem: AutoLayoutAttributedItem!
    let view = UIView()

    //  MARK: Properties

    func testLeftAttributedItem() {
        attributedItem = view.left
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Left, "The attribute should be the left side")
    }

    func testLeftMarginAttributedItem() {
        attributedItem = view.leftMargin
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.LeftMargin, "The attribute should be the left margin")
    }

    func testRightAttributedItem() {
        attributedItem = view.right
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Right, "The attribute should be the right side")
    }

    func testRightMarginAttributedItem() {
        attributedItem = view.rightMargin
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.RightMargin, "The attribute should be the right margin")
    }

    func testTopAttributedItem() {
        attributedItem = view.top
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Top, "The attribute should be the top side")
    }

    func testTopMarginAttributedItem() {
        attributedItem = view.topMargin
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.TopMargin, "The attribute should be the top margin")
    }

    func testBottomAttributedItem() {
        attributedItem = view.bottom
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Bottom, "The attribute should be the bottom side")
    }

    func testBottomMarginAttributedItem() {
        attributedItem = view.bottomMargin
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.BottomMargin, "The attribute should be the bottom margin")
    }

    func testLeadingAttributedItem() {
        attributedItem = view.leading
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Leading, "The attribute should be the leading side")
    }

    func testLeadingMarginAttributedItem() {
        attributedItem = view.leadingMargin
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.LeadingMargin, "The attribute should be the leading margin")
    }

    func testTrailingAttributedItem() {
        attributedItem = view.trailing
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Trailing, "The attribute should be the trailing side")
    }

    func testTrailingMarginAttributedItem() {
        attributedItem = view.trailingMargin
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.TrailingMargin, "The attribute should be the trailing margin")
    }

    func testWidthAttributedItem() {
        attributedItem = view.width
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Width, "The attribute should be the width dimension")
    }

    func testHeightAttributedItem() {
        attributedItem = view.height
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Height, "The attribute should be the height dimension")
    }

    func testCenterXAttributedItem() {
        attributedItem = view.centerX
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.CenterX, "The attribute should be the center X value")
    }

    func testCenterXInMarginsAttributedItem() {
        attributedItem = view.centerXInMargins
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.CenterXWithinMargins, "The attribute should be the center X within margins value")
    }

    func testCenterYAttributedItem() {
        attributedItem = view.centerY
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.CenterY, "The attribute should be the center Y value")
    }

    func testCenterYInMarginsAttributedItem() {
        attributedItem = view.centerYInMargins
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.CenterYWithinMargins, "The attribute should be the center Y within margins value")
    }

    func testBaselineAttributedItem() {
        attributedItem = view.baseline
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Baseline, "The attribute should be the baseline")
    }

    func testFirstBaselineAttributedItem() {
        attributedItem = view.firstBaseline
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.FirstBaseline, "The attribute should be the first baseline")
    }

    func testNonAttributeAttributedItem() {
        attributedItem = view.nonAttribute
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.NotAnAttribute, "The attribute should be not an attribute")
    }

    //  MARK: Conversion method

    func testLeftAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.Left)
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Left, "The attribute should be the left side")
    }

    func testLeftMarginAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.LeftMargin)
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.LeftMargin, "The attribute should be the left margin")
    }

    func testRightAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.Right)
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Right, "The attribute should be the right side")
    }

    func testRightMarginAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.RightMargin)
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.RightMargin, "The attribute should be the right margin")
    }

    func testTopAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.Top)
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Top, "The attribute should be the top side")
    }

    func testTopMarginAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.TopMargin)
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.TopMargin, "The attribute should be the top margin")
    }

    func testBottomAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.Bottom)
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Bottom, "The attribute should be the bottom side")
    }

    func testBottomMarginAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.BottomMargin)
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.BottomMargin, "The attribute should be the bottom margin")
    }

    func testLeadingAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.Leading)
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Leading, "The attribute should be the leading side")
    }

    func testLeadingMarginAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.LeadingMargin)
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.LeadingMargin, "The attribute should be the leading margin")
    }

    func testTrailingAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.Trailing)
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Trailing, "The attribute should be the trailing side")
    }

    func testTrailingMarginAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.TrailingMargin)
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.TrailingMargin, "The attribute should be the trailing margin")
    }

    func testWidthAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.Width)
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Width, "The attribute should be the width dimension")
    }

    func testHeightAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.Height)
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Height, "The attribute should be the height dimension")
    }

    func testCenterXAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.CenterX)
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.CenterX, "The attribute should be the center X value")
    }

    func testCenterXInMarginsAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.CenterXWithinMargins)
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.CenterXWithinMargins, "The attribute should be the center X within margins value")
    }

    func testCenterYAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.CenterY)
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.CenterY, "The attribute should be the center Y value")
    }

    func testCenterYInMarginsAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.CenterYWithinMargins)
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.CenterYWithinMargins, "The attribute should be the center Y within margins value")
    }

    func testBaselineAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.Baseline)
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Baseline, "The attribute should be the baseline")
    }

    func testFirstBaselineAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.FirstBaseline)
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.FirstBaseline, "The attribute should be the first baseline")
    }

    func testNonAttributeAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.NotAnAttribute)
        XCTAssertEqual(attributedItem.item as! UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.NotAnAttribute, "The attribute should be not an attribute")
    }

}
