//
//  ConstraintBuilderSyntaxTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest
@testable import UIKitSwagger

class ConstraintBuilderSyntaxTests: XCTestCase {

    var controller = UIViewController()
    var rootView: UIView!
    let subview = UIView()
    let guide = UILayoutGuide()
    var constraint: NSLayoutConstraint!
    var multiple: AutoLayoutAttributedItemScalarMultiple!
    var offset: AutoLayoutAttributedItemOffset!

    override func setUp() {
        super.setUp()

        rootView = controller.view
        rootView.addSubview(subview)
        rootView.addLayoutGuide(guide)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    //  MARK: Right-side operands

    func testAttributedItemIntMultiplierSyntax() {
        multiple = 14 * rootView.width
        XCTAssertEqual(multiple.0, CGFloat(14), "The multiple should use the provided multiplier")
        XCTAssertEqual(multiple.1.item as! UIView, rootView, "The multiple should use the provided item")
        XCTAssertEqual(multiple.1.attribute, .Width, "The multiple should use the provided attribute")
    }

    func testAttributedItemCGFloatMultiplierSyntax() {
        multiple = 14.42 * guide.width
        XCTAssertEqual(multiple.0, CGFloat(14.42), "The multiple should use the provided multiplier")
        XCTAssertEqual(multiple.1.item as! UILayoutGuide, guide, "The multiple should use the provided item")
        XCTAssertEqual(multiple.1.attribute, .Width, "The multiple should use the provided attribute")
    }

    func testAttributedItemIntConstantSyntax() {
        offset = rootView.width + 14
        XCTAssertEqual(offset.0.0, CGFloat(1), "A singular multiple should be used in the offset")
        XCTAssertEqual(offset.0.1.item as! UIView, rootView, "The offset should use the provided item")
        XCTAssertEqual(offset.0.1.attribute, .Width, "The offset should use the provided attribute")
        XCTAssertEqual(offset.1, CGFloat(14), "The offset should use the provided constant")
    }

    func testAttributedItemCGFloatConstantSyntax() {
        offset = guide.width + 14.42
        XCTAssertEqual(offset.0.0, CGFloat(1), "A singular multiple should be used in the offset")
        XCTAssertEqual(offset.0.1.item as! UILayoutGuide, guide, "The offset should use the provided item")
        XCTAssertEqual(offset.0.1.attribute, .Width, "The offset should use the provided attribute")
        XCTAssertEqual(offset.1, CGFloat(14.42), "The offset should use the provided constant")
    }

    func testAttributedItemNegativeIntConstantSyntax() {
        offset = rootView.width - 14
        XCTAssertEqual(offset.0.0, CGFloat(1), "A singular multiple should be used in the offset")
        XCTAssertEqual(offset.0.1.item as! UIView, rootView, "The offset should use the provided item")
        XCTAssertEqual(offset.0.1.attribute, .Width, "The offset should use the provided attribute")
        XCTAssertEqual(offset.1, CGFloat(-14), "The offset should use the provided constant")
    }

    func testAttributedItemNegativeCGFloatConstantSyntax() {
        offset = guide.width - 14.42
        XCTAssertEqual(offset.0.0, CGFloat(1), "A singular multiple should be used in the offset")
        XCTAssertEqual(offset.0.1.item as! UILayoutGuide, guide, "The offset should use the provided item")
        XCTAssertEqual(offset.0.1.attribute, .Width, "The offset should use the provided attribute")
        XCTAssertEqual(offset.1, CGFloat(-14.42), "The offset should use the provided constant")
    }

    func testAttributedMultipleIntConstantSyntax() {
        multiple = 2 * rootView.width
        offset = multiple + 14
        XCTAssertEqual(offset.0.0, CGFloat(2), "The offset should use the provided multiple")
        XCTAssertEqual(offset.0.1.item as! UIView, rootView, "The offset should use the provided multiple")
        XCTAssertEqual(offset.0.1.attribute, .Width, "The offset should use the provided multiple")
        XCTAssertEqual(offset.1, CGFloat(14), "The offset should use the provided constant")
    }

    func testAttributedMultipleCGFloatConstantSyntax() {
        multiple = 2 * guide.width
        offset = multiple + 14.42
        XCTAssertEqual(offset.0.0, CGFloat(2), "The offset should use the provided multiple")
        XCTAssertEqual(offset.0.1.item as! UILayoutGuide, guide, "The offset should use the provided item")
        XCTAssertEqual(offset.0.1.attribute, .Width, "The offset should use the provided attribute")
        XCTAssertEqual(offset.1, CGFloat(14.42), "The offset should use the provided constant")
    }

    func testAttributedMultipleNegativeIntConstantSyntax() {
        multiple = 2 * rootView.width
        offset = multiple - 14
        XCTAssertEqual(offset.0.0, CGFloat(2), "The offset should use the provided multiple")
        XCTAssertEqual(offset.0.1.item as! UIView, rootView, "The offset should use the provided item")
        XCTAssertEqual(offset.0.1.attribute, .Width, "The offset should use the provided attribute")
        XCTAssertEqual(offset.1, CGFloat(-14), "The offset should use the provided constant")
    }

    func testAttributedMultipleNegativeCGFloatConstantSyntax() {
        multiple = 2 * guide.width
        offset = multiple - 14.42
        XCTAssertEqual(offset.0.0, CGFloat(2), "The offset should use the provided multiple")
        XCTAssertEqual(offset.0.1.item as! UILayoutGuide, guide, "The offset should use the provided item")
        XCTAssertEqual(offset.0.1.attribute, .Width, "The offset should use the provided attribute")
        XCTAssertEqual(offset.1, CGFloat(-14.42), "The offset should use the provided constant")
    }

    //  MARK: Equal relation constraint creation

    func testCreatingEqualConstraintWithConstantOnly() {
        constraint = rootView.height =* 14.42
        let expected = NSLayoutConstraint(
            item: rootView,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 0.0,
            constant: 14.42
        )
        XCTAssertEqual(constraint, expected, "The syntax should produce a constraint expressing the same relation")
    }

    func testCreatingEqualConstraintWithAttributedItemOnly() {
        constraint = rootView.height =* rootView.width
        let expected = NSLayoutConstraint(
            item: rootView,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: rootView,
            attribute: .Width,
            multiplier: 1.0,
            constant: 0.0
        )
        XCTAssertEqual(constraint, expected, "The syntax should produce a constraint expressing the same relation")
    }

    func testCreatingEqualConstraintWithAttributedItemScalarMultipleOnly() {
        constraint = rootView.height =* 2 * rootView.width
        let expected = NSLayoutConstraint(
            item: rootView,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: rootView,
            attribute: .Width,
            multiplier: 2.0,
            constant: 0.0
        )
        XCTAssertEqual(constraint, expected, "The syntax should produce a constraint expressing the same relation")
    }

    func testCreatingEqualConstraintWithAttributedItemAndConstant() {
        constraint = rootView.height =* rootView.width + 14.42
        let expected = NSLayoutConstraint(
            item: rootView,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: rootView,
            attribute: .Width,
            multiplier: 1.0,
            constant: 14.42
        )
        XCTAssertEqual(constraint, expected, "The syntax should produce a constraint expressing the same relation")
    }

    func testCreatingEqualConstraintWithAttributedItemScalarMultipleAndConstant() {
        constraint = rootView.height =* 1.4 * rootView.width + 14.42
        let expected = NSLayoutConstraint(
            item: rootView,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: rootView,
            attribute: .Width,
            multiplier: 1.4,
            constant: 14.42
        )
        XCTAssertEqual(constraint, expected, "The syntax should produce a constraint expressing the same relation")
    }

    //  MARK: Greater-than-or-equal relation constraint creation

    func testCreatingGTEConstraintWithConstantOnly() {
        constraint = rootView.height >=* 14.42
        let expected = NSLayoutConstraint(
            item: rootView,
            attribute: .Height,
            relatedBy: .GreaterThanOrEqual,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 0.0,
            constant: 14.42
        )
        XCTAssertEqual(constraint, expected, "The syntax should produce a constraint expressing the same relation")
    }

    func testCreatingGTEConstraintWithAttributedItemOnly() {
        constraint = rootView.height >=* rootView.width
        let expected = NSLayoutConstraint(
            item: rootView,
            attribute: .Height,
            relatedBy: .GreaterThanOrEqual,
            toItem: rootView,
            attribute: .Width,
            multiplier: 1.0,
            constant: 0.0
        )
        XCTAssertEqual(constraint, expected, "The syntax should produce a constraint expressing the same relation")
    }

    func testCreatingGTEConstraintWithAttributedItemScalarMultipleOnly() {
        constraint = rootView.height >=* 2 * rootView.width
        let expected = NSLayoutConstraint(
            item: rootView,
            attribute: .Height,
            relatedBy: .GreaterThanOrEqual,
            toItem: rootView,
            attribute: .Width,
            multiplier: 2.0,
            constant: 0.0
        )
        XCTAssertEqual(constraint, expected, "The syntax should produce a constraint expressing the same relation")
    }

    func testCreatingGTEConstraintWithAttributedItemAndConstant() {
        constraint = rootView.height >=* rootView.width + 14.42
        let expected = NSLayoutConstraint(
            item: rootView,
            attribute: .Height,
            relatedBy: .GreaterThanOrEqual,
            toItem: rootView,
            attribute: .Width,
            multiplier: 1.0,
            constant: 14.42
        )
        XCTAssertEqual(constraint, expected, "The syntax should produce a constraint expressing the same relation")
    }

    func testCreatingGTEConstraintWithAttributedItemScalarMultipleAndConstant() {
        constraint = rootView.height >=* 1.4 * rootView.width + 14.42
        let expected = NSLayoutConstraint(
            item: rootView,
            attribute: .Height,
            relatedBy: .GreaterThanOrEqual,
            toItem: rootView,
            attribute: .Width,
            multiplier: 1.4,
            constant: 14.42
        )
        XCTAssertEqual(constraint, expected, "The syntax should produce a constraint expressing the same relation")
    }

    //  MARK: Less-than-or-equal relation constraint creation

    func testCreatingLTEConstraintWithConstantOnly() {
        constraint = rootView.height <=* 14.42
        let expected = NSLayoutConstraint(
            item: rootView,
            attribute: .Height,
            relatedBy: .LessThanOrEqual,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 0.0,
            constant: 14.42
        )
        XCTAssertEqual(constraint, expected, "The syntax should produce a constraint expressing the same relation")
    }

    func testCreatingLTEConstraintWithAttributedItemOnly() {
        constraint = rootView.height <=* rootView.width
        let expected = NSLayoutConstraint(
            item: rootView,
            attribute: .Height,
            relatedBy: .LessThanOrEqual,
            toItem: rootView,
            attribute: .Width,
            multiplier: 1.0,
            constant: 0.0
        )
        XCTAssertEqual(constraint, expected, "The syntax should produce a constraint expressing the same relation")
    }

    func testCreatingLTEConstraintWithAttributedItemScalarMultipleOnly() {
        constraint = rootView.height <=* 2 * rootView.width
        let expected = NSLayoutConstraint(
            item: rootView,
            attribute: .Height,
            relatedBy: .LessThanOrEqual,
            toItem: rootView,
            attribute: .Width,
            multiplier: 2.0,
            constant: 0.0
        )
        XCTAssertEqual(constraint, expected, "The syntax should produce a constraint expressing the same relation")
    }

    func testCreatingLTEConstraintWithAttributedItemAndConstant() {
        constraint = rootView.height <=* rootView.width + 14.42
        let expected = NSLayoutConstraint(
            item: rootView,
            attribute: .Height,
            relatedBy: .LessThanOrEqual,
            toItem: rootView,
            attribute: .Width,
            multiplier: 1.0,
            constant: 14.42
        )
        XCTAssertEqual(constraint, expected, "The syntax should produce a constraint expressing the same relation")
    }

    func testCreatingLTEConstraintWithAttributedItemScalarMultipleAndConstant() {
        constraint = rootView.height <=* 1.4 * rootView.width + 14.42
        let expected = NSLayoutConstraint(
            item: rootView,
            attribute: .Height,
            relatedBy: .LessThanOrEqual,
            toItem: rootView,
            attribute: .Width,
            multiplier: 1.4,
            constant: 14.42
        )
        XCTAssertEqual(constraint, expected, "The syntax should produce a constraint expressing the same relation")
    }

    //  MARK: Priority and Identifier

    func testAddingPriorityToConstraint() {
        constraint = rootView.height <=* 1.4 * rootView.width + 14.42
        constraint ~ 555
        XCTAssertEqual(constraint.priority, UILayoutPriority(555), "The '~' symbol should allow setting of constraint priorities")
    }

    func testAddingIdentifierToConstraint() {
        constraint = rootView.height =* rootView.width
        constraint ~ "square"
        XCTAssertEqual(constraint.identifier!, "square", "The '~' symbol should allow setting of constraint identifiers")
    }

    func testClearingConstraintIdentifier() {
        constraint = rootView.height =* rootView.width
        constraint.identifier = "square"
        constraint ~ nil
        XCTAssertNil(constraint.identifier, "The '~' symbol with a nil value should allow clearing of constraint identifiers")
    }

}
