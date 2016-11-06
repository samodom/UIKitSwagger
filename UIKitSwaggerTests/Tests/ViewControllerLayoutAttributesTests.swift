//
//  ViewControllerLayoutAttributesTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import UIKitSwagger

class ViewControllerLayoutAttributesTests: XCTestCase {

    var attributedItem: AutoLayoutAttributedItem!
    var controller: UIViewController!

    override func setUp() {
        super.setUp()

        let window = UIApplication.shared.delegate!.window!
        controller = window!.rootViewController
    }

    //  MARK: Properties

    func testLeftAttributedItem() {
        attributedItem = controller.left
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.left, "The attribute should be the view's left side")
    }

    func testLeftMarginAttributedItem() {
        attributedItem = controller.leftMargin
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.leftMargin, "The attribute should be the view's left margin")
    }

    func testRightAttributedItem() {
        attributedItem = controller.right
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.right, "The attribute should be the view's right side")
    }

    func testRightMarginAttributedItem() {
        attributedItem = controller.rightMargin
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.rightMargin, "The attribute should be the view's right margin")
    }

    func testTopAttributedItem() {
        attributedItem = controller.top
        XCTAssertTrue(attributedItem.item === controller.topLayoutGuide, "The item should be the view controller's top layout guide")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.bottom, "The attribute should be the layout guide's bottom side")
    }

    func testTopMarginAttributedItem() {
        attributedItem = controller.topMargin
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.topMargin, "The attribute should be the view's top margin")
    }

    func testBottomAttributedItem() {
        attributedItem = controller.bottom
        XCTAssertTrue(attributedItem.item === controller.bottomLayoutGuide, "The item should be the view controller's bottom layout guide")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.top, "The attribute should be the layout guide's top side")
    }

    func testBottomMarginAttributedItem() {
        attributedItem = controller.bottomMargin
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.bottomMargin, "The attribute should be the view's bottom margin")
    }

    func testLeadingAttributedItem() {
        attributedItem = controller.leading
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.leading, "The attribute should be the view's leading side")
    }

    func testLeadingMarginAttributedItem() {
        attributedItem = controller.leadingMargin
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.leadingMargin, "The attribute should be the view's leading margin")
    }

    func testTrailingAttributedItem() {
        attributedItem = controller.trailing
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.trailing, "The attribute should be the view's trailing side")
    }

    func testTrailingMarginAttributedItem() {
        attributedItem = controller.trailingMargin
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.trailingMargin, "The attribute should be the view's trailing margin")
    }

    func testWidthAttributedItem() {
        attributedItem = controller.width
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.width, "The attribute should be the view's width dimension")
    }

    func testHeightAttributedItem() {
        attributedItem = controller.height
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.height, "The attribute should be the view's height dimension")
    }

    func testCenterXAttributedItem() {
        attributedItem = controller.centerX
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerX, "The attribute should be the view's center X value")
    }

    func testCenterXInMarginsAttributedItem() {
        attributedItem = controller.centerXInMargins
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerXWithinMargins, "The attribute should be the view's center X within margins value")
    }

    func testCenterYAttributedItem() {
        attributedItem = controller.centerY
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerY, "The attribute should be the view's center Y value")
    }

    func testCenterYInMarginsAttributedItem() {
        attributedItem = controller.centerYInMargins
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerYWithinMargins, "The attribute should be the view's center Y within margins value")
    }

    func testBaselineAttributedItem() {
        attributedItem = controller.baseline
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.lastBaseline, "The attribute should be the view's baseline")
    }

    func testFirstBaselineAttributedItem() {
        attributedItem = controller.firstBaseline
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.firstBaseline, "The attribute should be the view's first baseline")
    }

    func testNonAttributeAttributedItem() {
        attributedItem = controller.nonAttribute
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.notAnAttribute, "The attribute should be not an attribute")
    }

    //  MARK: Conversion method

    func testLeftAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.left)
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.left, "The attribute should be the view's left side")
    }

    func testLeftMarginAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.leftMargin)
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.leftMargin, "The attribute should be the view's left margin")
    }

    func testRightAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.right)
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.right, "The attribute should be the view's right side")
    }

    func testRightMarginAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.rightMargin)
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.rightMargin, "The attribute should be the view's right margin")
    }

    func testTopAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.top)
        XCTAssertTrue(attributedItem.item === controller.topLayoutGuide, "The item should be the view controller's top layout guide")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.bottom, "The attribute should be the layout guide's bottom side")
    }

    func testTopMarginAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.topMargin)
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.topMargin, "The attribute should be the view's top margin")
    }

    func testBottomAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.bottom)
        XCTAssertTrue(attributedItem.item === controller.bottomLayoutGuide, "The item should be the view controller's bottom layout guide")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.top, "The attribute should be the layout guide's top side")
    }

    func testBottomMarginAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.bottomMargin)
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.bottomMargin, "The attribute should be the view's bottom margin")
    }

    func testLeadingAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.leading)
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.leading, "The attribute should be the view's leading side")
    }

    func testLeadingMarginAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.leadingMargin)
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.leadingMargin, "The attribute should be the view's leading margin")
    }

    func testTrailingAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.trailing)
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.trailing, "The attribute should be the view's trailing side")
    }

    func testTrailingMarginAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.trailingMargin)
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.trailingMargin, "The attribute should be the view's trailing margin")
    }

    func testWidthAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.width)
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.width, "The attribute should be the view's width dimension")
    }

    func testHeightAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.height)
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.height, "The attribute should be the view's height dimension")
    }

    func testCenterXAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.centerX)
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerX, "The attribute should be the view's center X value")
    }

    func testCenterXInMarginsAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.centerXWithinMargins)
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerXWithinMargins, "The attribute should be the view's center X within margins value")
    }

    func testCenterYAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.centerY)
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerY, "The attribute should be the view's center Y value")
    }

    func testCenterYInMarginsAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.centerYWithinMargins)
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerYWithinMargins, "The attribute should be the view's center Y within margins value")
    }

    func testBaselineAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.lastBaseline)
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.lastBaseline, "The attribute should be the view's baseline")
    }

    func testFirstBaselineAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.firstBaseline)
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.firstBaseline, "The attribute should be the view's first baseline")
    }

    func testNonAttributeAttributeConversion() {
        attributedItem = controller.attributedItemForLayoutAttribute(.notAnAttribute)
        XCTAssertEqual(attributedItem.item as? UIView, controller.view, "The item should be the view controller's view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.notAnAttribute, "The attribute should be not an attribute")
    }

}
