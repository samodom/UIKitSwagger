//
//  ViewLayoutAttributesTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import UIKitSwagger

class ViewLayoutAttributesTests: XCTestCase {

    var attributedItem: AutoLayoutAttributedItem!
    let view = UIView()

    //  MARK: Properties

    func testLeftAttributedItem() {
        attributedItem = view.left
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.left, "The attribute should be the left side")
    }

    func testLeftMarginAttributedItem() {
        attributedItem = view.leftMargin
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.leftMargin, "The attribute should be the left margin")
    }

    func testRightAttributedItem() {
        attributedItem = view.right
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.right, "The attribute should be the right side")
    }

    func testRightMarginAttributedItem() {
        attributedItem = view.rightMargin
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.rightMargin, "The attribute should be the right margin")
    }

    func testTopAttributedItem() {
        attributedItem = view.top
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.top, "The attribute should be the top side")
    }

    func testTopMarginAttributedItem() {
        attributedItem = view.topMargin
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.topMargin, "The attribute should be the top margin")
    }

    func testBottomAttributedItem() {
        attributedItem = view.bottom
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.bottom, "The attribute should be the bottom side")
    }

    func testBottomMarginAttributedItem() {
        attributedItem = view.bottomMargin
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.bottomMargin, "The attribute should be the bottom margin")
    }

    func testLeadingAttributedItem() {
        attributedItem = view.leading
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.leading, "The attribute should be the leading side")
    }

    func testLeadingMarginAttributedItem() {
        attributedItem = view.leadingMargin
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.leadingMargin, "The attribute should be the leading margin")
    }

    func testTrailingAttributedItem() {
        attributedItem = view.trailing
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.trailing, "The attribute should be the trailing side")
    }

    func testTrailingMarginAttributedItem() {
        attributedItem = view.trailingMargin
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.trailingMargin, "The attribute should be the trailing margin")
    }

    func testWidthAttributedItem() {
        attributedItem = view.width
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.width, "The attribute should be the width dimension")
    }

    func testHeightAttributedItem() {
        attributedItem = view.height
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.height, "The attribute should be the height dimension")
    }

    func testCenterXAttributedItem() {
        attributedItem = view.centerX
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerX, "The attribute should be the center X value")
    }

    func testCenterXInMarginsAttributedItem() {
        attributedItem = view.centerXInMargins
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerXWithinMargins, "The attribute should be the center X within margins value")
    }

    func testCenterYAttributedItem() {
        attributedItem = view.centerY
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerY, "The attribute should be the center Y value")
    }

    func testCenterYInMarginsAttributedItem() {
        attributedItem = view.centerYInMargins
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerYWithinMargins, "The attribute should be the center Y within margins value")
    }

    func testBaselineAttributedItem() {
        attributedItem = view.baseline
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.lastBaseline, "The attribute should be the baseline")
    }

    func testFirstBaselineAttributedItem() {
        attributedItem = view.firstBaseline
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.firstBaseline, "The attribute should be the first baseline")
    }

    func testNonAttributeAttributedItem() {
        attributedItem = view.nonAttribute
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.notAnAttribute, "The attribute should be not an attribute")
    }

    //  MARK: Conversion method

    func testLeftAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.left)
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.left, "The attribute should be the left side")
    }

    func testLeftMarginAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.leftMargin)
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.leftMargin, "The attribute should be the left margin")
    }

    func testRightAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.right)
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.right, "The attribute should be the right side")
    }

    func testRightMarginAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.rightMargin)
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.rightMargin, "The attribute should be the right margin")
    }

    func testTopAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.top)
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.top, "The attribute should be the top side")
    }

    func testTopMarginAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.topMargin)
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.topMargin, "The attribute should be the top margin")
    }

    func testBottomAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.bottom)
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.bottom, "The attribute should be the bottom side")
    }

    func testBottomMarginAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.bottomMargin)
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.bottomMargin, "The attribute should be the bottom margin")
    }

    func testLeadingAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.leading)
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.leading, "The attribute should be the leading side")
    }

    func testLeadingMarginAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.leadingMargin)
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.leadingMargin, "The attribute should be the leading margin")
    }

    func testTrailingAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.trailing)
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.trailing, "The attribute should be the trailing side")
    }

    func testTrailingMarginAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.trailingMargin)
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.trailingMargin, "The attribute should be the trailing margin")
    }

    func testWidthAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.width)
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.width, "The attribute should be the width dimension")
    }

    func testHeightAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.height)
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.height, "The attribute should be the height dimension")
    }

    func testCenterXAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.centerX)
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerX, "The attribute should be the center X value")
    }

    func testCenterXInMarginsAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.centerXWithinMargins)
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerXWithinMargins, "The attribute should be the center X within margins value")
    }

    func testCenterYAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.centerY)
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerY, "The attribute should be the center Y value")
    }

    func testCenterYInMarginsAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.centerYWithinMargins)
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.centerYWithinMargins, "The attribute should be the center Y within margins value")
    }

    func testBaselineAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.lastBaseline)
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.lastBaseline, "The attribute should be the baseline")
    }

    func testFirstBaselineAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.firstBaseline)
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.firstBaseline, "The attribute should be the first baseline")
    }

    func testNonAttributeAttributeConversion() {
        attributedItem = view.attributedItemForLayoutAttribute(.notAnAttribute)
        XCTAssertEqual(attributedItem.item as? UIView, view, "The item should be the view itself")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.notAnAttribute, "The attribute should be not an attribute")
    }

}
