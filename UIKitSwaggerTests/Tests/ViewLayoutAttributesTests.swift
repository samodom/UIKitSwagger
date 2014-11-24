//
//  ViewLayoutAttributesTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class ViewLayoutAttributesTests: XCTestCase {

    var attributedItem: AutoLayoutAttributedItem?
    let view = UIView()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testLeftAttributedItem() {
        attributedItem = view.left
        XCTAssertEqual(attributedItem!.item as UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Left, "The attribute should be the left side")
    }

    func testLeftMarginAttributedItem() {
        attributedItem = view.leftMargin
        XCTAssertEqual(attributedItem!.item as UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.LeftMargin, "The attribute should be the left margin")
    }

    func testRightAttributedItem() {
        attributedItem = view.right
        XCTAssertEqual(attributedItem!.item as UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Right, "The attribute should be the right side")
    }

    func testRightMarginAttributedItem() {
        attributedItem = view.rightMargin
        XCTAssertEqual(attributedItem!.item as UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.RightMargin, "The attribute should be the right margin")
    }

    func testTopAttributedItem() {
        attributedItem = view.top
        XCTAssertEqual(attributedItem!.item as UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Top, "The attribute should be the top side")
    }

    func testTopMarginAttributedItem() {
        attributedItem = view.topMargin
        XCTAssertEqual(attributedItem!.item as UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.TopMargin, "The attribute should be the top margin")
    }

    func testBottomAttributedItem() {
        attributedItem = view.bottom
        XCTAssertEqual(attributedItem!.item as UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Bottom, "The attribute should be the bottom side")
    }

    func testBottomMarginAttributedItem() {
        attributedItem = view.bottomMargin
        XCTAssertEqual(attributedItem!.item as UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.BottomMargin, "The attribute should be the bottom margin")
    }

    func testLeadingAttributedItem() {
        attributedItem = view.leading
        XCTAssertEqual(attributedItem!.item as UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Leading, "The attribute should be the leading side")
    }

    func testLeadingMarginAttributedItem() {
        attributedItem = view.leadingMargin
        XCTAssertEqual(attributedItem!.item as UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.LeadingMargin, "The attribute should be the leading margin")
    }

    func testTrailingAttributedItem() {
        attributedItem = view.trailing
        XCTAssertEqual(attributedItem!.item as UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Trailing, "The attribute should be the trailing side")
    }

    func testTrailingMarginAttributedItem() {
        attributedItem = view.trailingMargin
        XCTAssertEqual(attributedItem!.item as UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.TrailingMargin, "The attribute should be the trailing margin")
    }

    func testWidthAttributedItem() {
        attributedItem = view.width
        XCTAssertEqual(attributedItem!.item as UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Width, "The attribute should be the width dimension")
    }

    func testHeightAttributedItem() {
        attributedItem = view.height
        XCTAssertEqual(attributedItem!.item as UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Height, "The attribute should be the height dimension")
    }

    func testCenterXAttributedItem() {
        attributedItem = view.centerX
        XCTAssertEqual(attributedItem!.item as UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.CenterX, "The attribute should be the center X value")
    }

    func testCenterXInMarginsAttributedItem() {
        attributedItem = view.centerXInMargins
        XCTAssertEqual(attributedItem!.item as UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.CenterXWithinMargins, "The attribute should be the center X within margins value")
    }

    func testCenterYAttributedItem() {
        attributedItem = view.centerY
        XCTAssertEqual(attributedItem!.item as UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.CenterY, "The attribute should be the center Y value")
    }

    func testCenterYInMarginsAttributedItem() {
        attributedItem = view.centerYInMargins
        XCTAssertEqual(attributedItem!.item as UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.CenterYWithinMargins, "The attribute should be the center Y within margins value")
    }

    func testBaselineAttributedItem() {
        attributedItem = view.baseline
        XCTAssertEqual(attributedItem!.item as UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Baseline, "The attribute should be the baseline")
    }

    func testFirstBaselineAttributedItem() {
        attributedItem = view.firstBaseline
        XCTAssertEqual(attributedItem!.item as UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.FirstBaseline, "The attribute should be the first baseline")
    }

    func testNonAttributeAttributedItem() {
        attributedItem = view.nonAttribute
        XCTAssertEqual(attributedItem!.item as UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.NotAnAttribute, "The attribute should be not an attribute")
    }

}
