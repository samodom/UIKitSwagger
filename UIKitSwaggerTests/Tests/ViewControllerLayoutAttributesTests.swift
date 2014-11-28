//
//  ViewControllerLayoutAttributesTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class ViewControllerLayoutAttributesTests: XCTestCase {

    var attributedItem: AutoLayoutAttributedItem?
    var controller: UIViewController!

    override func setUp() {
        super.setUp()

        var window = UIApplication.sharedApplication().delegate!.window!
        controller = window!.rootViewController
        controller.loadView()
    }

    override func tearDown() {
        super.tearDown()
    }

    //  MARK: Properties

    func testLeftAttributedItem() {
        attributedItem = controller.left
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Left, "The attribute should be the view's left side")
    }

    func testLeftMarginAttributedItem() {
        attributedItem = controller.leftMargin
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.LeftMargin, "The attribute should be the view's left margin")
    }

    func testRightAttributedItem() {
        attributedItem = controller.right
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Right, "The attribute should be the view's right side")
    }

    func testRightMarginAttributedItem() {
        attributedItem = controller.rightMargin
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.RightMargin, "The attribute should be the view's right margin")
    }

    func testTopAttributedItem() {
        attributedItem = controller.top
        XCTAssertTrue(attributedItem!.item === controller.topLayoutGuide, "The item should be the view controller's top layout guide")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Bottom, "The attribute should be the layout guide's bottom side")
    }

    func testTopMarginAttributedItem() {
        attributedItem = controller.topMargin
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.TopMargin, "The attribute should be the view's top margin")
    }

    func testBottomAttributedItem() {
        attributedItem = controller.bottom
        XCTAssertTrue(attributedItem!.item === controller.bottomLayoutGuide, "The item should be the view controller's bottom layout guide")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Top, "The attribute should be the layout guide's top side")
    }

    func testBottomMarginAttributedItem() {
        attributedItem = controller.bottomMargin
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.BottomMargin, "The attribute should be the view's bottom margin")
    }

    func testLeadingAttributedItem() {
        attributedItem = controller.leading
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Leading, "The attribute should be the view's leading side")
    }

    func testLeadingMarginAttributedItem() {
        attributedItem = controller.leadingMargin
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.LeadingMargin, "The attribute should be the view's leading margin")
    }

    func testTrailingAttributedItem() {
        attributedItem = controller.trailing
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Trailing, "The attribute should be the view's trailing side")
    }

    func testTrailingMarginAttributedItem() {
        attributedItem = controller.trailingMargin
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.TrailingMargin, "The attribute should be the view's trailing margin")
    }

    func testWidthAttributedItem() {
        attributedItem = controller.width
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Width, "The attribute should be the view's width dimension")
    }

    func testHeightAttributedItem() {
        attributedItem = controller.height
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Height, "The attribute should be the view's height dimension")
    }

    func testCenterXAttributedItem() {
        attributedItem = controller.centerX
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.CenterX, "The attribute should be the view's center X value")
    }

    func testCenterXInMarginsAttributedItem() {
        attributedItem = controller.centerXInMargins
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.CenterXWithinMargins, "The attribute should be the view's center X within margins value")
    }

    func testCenterYAttributedItem() {
        attributedItem = controller.centerY
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.CenterY, "The attribute should be the view's center Y value")
    }

    func testCenterYInMarginsAttributedItem() {
        attributedItem = controller.centerYInMargins
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.CenterYWithinMargins, "The attribute should be the view's center Y within margins value")
    }

    func testBaselineAttributedItem() {
        attributedItem = controller.baseline
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Baseline, "The attribute should be the view's baseline")
    }

    func testFirstBaselineAttributedItem() {
        attributedItem = controller.firstBaseline
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.FirstBaseline, "The attribute should be the view's first baseline")
    }

    func testNonAttributeAttributedItem() {
        attributedItem = controller.nonAttribute
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.NotAnAttribute, "The attribute should be not an attribute")
    }

    //  MARK: Conversion method

    func testLeftAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.Left)
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Left, "The attribute should be the view's left side")
    }

    func testLeftMarginAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.LeftMargin)
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.LeftMargin, "The attribute should be the view's left margin")
    }

    func testRightAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.Right)
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Right, "The attribute should be the view's right side")
    }

    func testRightMarginAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.RightMargin)
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.RightMargin, "The attribute should be the view's right margin")
    }

    func testTopAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.Top)
        XCTAssertTrue(attributedItem!.item === controller.topLayoutGuide, "The item should be the view controller's top layout guide")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Bottom, "The attribute should be the layout guide's bottom side")
    }

    func testTopMarginAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.TopMargin)
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.TopMargin, "The attribute should be the view's top margin")
    }

    func testBottomAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.Bottom)
        XCTAssertTrue(attributedItem!.item === controller.bottomLayoutGuide, "The item should be the view controller's bottom layout guide")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Top, "The attribute should be the layout guide's top side")
    }

    func testBottomMarginAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.BottomMargin)
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.BottomMargin, "The attribute should be the view's bottom margin")
    }

    func testLeadingAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.Leading)
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Leading, "The attribute should be the view's leading side")
    }

    func testLeadingMarginAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.LeadingMargin)
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.LeadingMargin, "The attribute should be the view's leading margin")
    }

    func testTrailingAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.Trailing)
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Trailing, "The attribute should be the view's trailing side")
    }

    func testTrailingMarginAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.TrailingMargin)
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.TrailingMargin, "The attribute should be the view's trailing margin")
    }

    func testWidthAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.Width)
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Width, "The attribute should be the view's width dimension")
    }

    func testHeightAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.Height)
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Height, "The attribute should be the view's height dimension")
    }

    func testCenterXAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.CenterX)
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.CenterX, "The attribute should be the view's center X value")
    }

    func testCenterXInMarginsAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.CenterXWithinMargins)
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.CenterXWithinMargins, "The attribute should be the view's center X within margins value")
    }

    func testCenterYAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.CenterY)
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.CenterY, "The attribute should be the view's center Y value")
    }

    func testCenterYInMarginsAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.CenterYWithinMargins)
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.CenterYWithinMargins, "The attribute should be the view's center Y within margins value")
    }

    func testBaselineAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.Baseline)
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.Baseline, "The attribute should be the view's baseline")
    }

    func testFirstBaselineAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.FirstBaseline)
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.FirstBaseline, "The attribute should be the view's first baseline")
    }

    func testNonAttributeAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.NotAnAttribute)
        XCTAssertEqual(attributedItem!.item as UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem!.attribute, NSLayoutAttribute.NotAnAttribute, "The attribute should be not an attribute")
    }

}
