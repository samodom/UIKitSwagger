//
//  ConstraintSubjectSwappingTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 6/22/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import XCTest

class ConstraintSubjectSwappingTests: XCTestCase {

    var constraint: NSLayoutConstraint!
    var swapped: NSLayoutConstraint!
    var positive: NSLayoutConstraint!

    let view = UIView()
    var otherItem: AnyObject!

    let identifier = "Sample Identifier"
    let priority = UILayoutPriority(140)

    override func setUp() {
        super.setUp()

        if #available(iOS 9.0, *) {
            otherItem = UILayoutGuide()
        }
        else {
            otherItem = UIView()
        }
    }

    func testCannotSwapConstraintWithZeroMultiplier() {
        constraint = NSLayoutConstraint(
            item: view,
            attribute: .width,
            relatedBy: .equal,
            toItem: otherItem,
            attribute: .height,
            multiplier: 0,
            constant: 14
        )

        XCTAssertNil(constraint.swappedSubjectConstraint, "Cannot swap the subjects of a constraint with a zero multiplier")
    }

    func testCannotSwapConstraintWithoutSecondItemAndAttribute() {
        constraint = NSLayoutConstraint(
            item: view,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 2,
            constant: 14
        )

        XCTAssertNil(constraint.swappedSubjectConstraint, "Cannot swap the subjects of a constraint without a second attribute")
    }

    func testEqualReversal() {
        constraint = NSLayoutConstraint(
            item: view,
            attribute: .width,
            relatedBy: .equal,
            toItem: otherItem,
            attribute: .height,
            multiplier: 2,
            constant: 14
        )
        constraint.priority = priority
        constraint.identifier = identifier
        swapped = constraint.swappedSubjectConstraint

        if #available(iOS 9.0, *) {
            XCTAssertEqual(swapped.firstItem as? UILayoutGuide, constraint.secondItem! as? UILayoutGuide, "The original second item should be the first item when the subjects are swapped")
        }
        else {
            XCTAssertEqual(swapped.firstItem as? UIView, constraint.secondItem! as? UIView, "The original second item should be the first item when the subjects are swapped")
        }
        XCTAssertEqual(swapped.firstAttribute, constraint.secondAttribute, "The original second attribute should be the first attribute when the subjects are swapped")
        XCTAssertEqual(swapped.relation, NSLayoutRelation.equal, "The relation should remain Equal")
        XCTAssertEqual(swapped.secondItem! as? UIView, constraint.firstItem as? UIView, "The original first item should be the second item when the subjects are swapped")
        XCTAssertEqual(swapped.secondAttribute, constraint.firstAttribute, "The original first attribute should be the second attribute when the subjects are swapped")
        XCTAssertEqual(swapped.multiplier, 1 / constraint.multiplier, "The original multiplier should be inverted when the subjects are swapped")
        XCTAssertEqual(swapped.constant, -constraint.constant / constraint.multiplier, "The original constant should be negated and divided by the multiplier")
        XCTAssertNil(swapped.identifier, "The identifier should not be copied to the swapped constraint")
        XCTAssertEqual(swapped.priority, priority, "The original priority should be copied to the swapped constraint")
    }

    func testGreaterThanOrEqualPositiveMultiplierReversal() {
        constraint = NSLayoutConstraint(
            item: view,
            attribute: .width,
            relatedBy: .greaterThanOrEqual,
            toItem: otherItem,
            attribute: .height,
            multiplier: 2,
            constant: 14
        )
        constraint.priority = priority
        constraint.identifier = identifier
        swapped = constraint.swappedSubjectConstraint

        if #available(iOS 9.0, *) {
            XCTAssertEqual(swapped.firstItem as? UILayoutGuide, constraint.secondItem! as? UILayoutGuide, "The original second item should be the first item when the subjects are swapped")
        }
        else {
            XCTAssertEqual(swapped.firstItem as? UIView, constraint.secondItem! as? UIView, "The original second item should be the first item when the subjects are swapped")
        }
        XCTAssertEqual(swapped.firstAttribute, constraint.secondAttribute, "The original second attribute should be the first attribute when the subjects are swapped")
        XCTAssertEqual(swapped.relation, NSLayoutRelation.lessThanOrEqual, "The relation should change direction")
        XCTAssertEqual(swapped.secondItem! as? UIView, constraint.firstItem as? UIView, "The original first item should be the second item when the subjects are swapped")
        XCTAssertEqual(swapped.secondAttribute, constraint.firstAttribute, "The original first attribute should be the second attribute when the subjects are swapped")
        XCTAssertEqual(swapped.multiplier, 1 / constraint.multiplier, "The original multiplier should be inverted when the subjects are swapped")
        XCTAssertEqual(swapped.constant, -constraint.constant / constraint.multiplier, "The original constant should be negated and divided by the multiplier")
        XCTAssertNil(swapped.identifier, "The identifier should not be copied to the swapped constraint")
        XCTAssertEqual(swapped.priority, priority, "The original priority should be copied to the swapped constraint")
    }

    func testGreaterThanOrEqualNegativeMultiplierReversal() {
        constraint = NSLayoutConstraint(
            item: view,
            attribute: .width,
            relatedBy: .greaterThanOrEqual,
            toItem: otherItem,
            attribute: .height,
            multiplier: -2,
            constant: 14
        )
        constraint.priority = priority
        constraint.identifier = identifier
        swapped = constraint.swappedSubjectConstraint

        if #available(iOS 9.0, *) {
            XCTAssertEqual(swapped.firstItem as? UILayoutGuide, constraint.secondItem! as? UILayoutGuide, "The original second item should be the first item when the subjects are swapped")
        }
        else {
            XCTAssertEqual(swapped.firstItem as? UIView, constraint.secondItem! as? UIView, "The original second item should be the first item when the subjects are swapped")
        }
        XCTAssertEqual(swapped.firstAttribute, constraint.secondAttribute, "The original second attribute should be the first attribute when the subjects are swapped")
        XCTAssertEqual(swapped.relation, NSLayoutRelation.greaterThanOrEqual, "The relation should not change direction")
        XCTAssertEqual(swapped.secondItem! as? UIView, constraint.firstItem as? UIView, "The original first item should be the second item when the subjects are swapped")
        XCTAssertEqual(swapped.secondAttribute, constraint.firstAttribute, "The original first attribute should be the second attribute when the subjects are swapped")
        XCTAssertEqual(swapped.multiplier, 1 / constraint.multiplier, "The original multiplier should be inverted when the subjects are swapped")
        XCTAssertEqual(swapped.constant, -constraint.constant / constraint.multiplier, "The original constant should be negated and divided by the multiplier")
        XCTAssertNil(swapped.identifier, "The identifier should not be copied to the swapped constraint")
        XCTAssertEqual(swapped.priority, priority, "The original priority should be copied to the swapped constraint")
    }

    func testLessThanOrEqualPositiveMultiplierReversal() {
        constraint = NSLayoutConstraint(
            item: view,
            attribute: .width,
            relatedBy: .lessThanOrEqual,
            toItem: otherItem,
            attribute: .height,
            multiplier: 2,
            constant: 14
        )
        constraint.priority = priority
        constraint.identifier = identifier
        swapped = constraint.swappedSubjectConstraint

        if #available(iOS 9.0, *) {
            XCTAssertEqual(swapped.firstItem as? UILayoutGuide, constraint.secondItem! as? UILayoutGuide, "The original second item should be the first item when the subjects are swapped")
        }
        else {
            XCTAssertEqual(swapped.firstItem as? UIView, constraint.secondItem! as? UIView, "The original second item should be the first item when the subjects are swapped")
        }
        XCTAssertEqual(swapped.firstAttribute, constraint.secondAttribute, "The original second attribute should be the first attribute when the subjects are swapped")
        XCTAssertEqual(swapped.relation, NSLayoutRelation.greaterThanOrEqual, "The relation should change direction")
        XCTAssertEqual(swapped.secondItem! as? UIView, constraint.firstItem as? UIView, "The original first item should be the second item when the subjects are swapped")
        XCTAssertEqual(swapped.secondAttribute, constraint.firstAttribute, "The original first attribute should be the second attribute when the subjects are swapped")
        XCTAssertEqual(swapped.multiplier, 1 / constraint.multiplier, "The original multiplier should be inverted when the subjects are swapped")
        XCTAssertEqual(swapped.constant, -constraint.constant / constraint.multiplier, "The original constant should be negated and divided by the multiplier")
        XCTAssertNil(swapped.identifier, "The identifier should not be copied to the swapped constraint")
        XCTAssertEqual(swapped.priority, priority, "The original priority should be copied to the swapped constraint")
    }

    func testLessThanOrEqualNegativeMultiplierReversal() {
        constraint = NSLayoutConstraint(
            item: view,
            attribute: .width,
            relatedBy: .lessThanOrEqual,
            toItem: otherItem,
            attribute: .height,
            multiplier: -2,
            constant: 14
        )
        constraint.priority = priority
        constraint.identifier = identifier
        swapped = constraint.swappedSubjectConstraint

        if #available(iOS 9.0, *) {
            XCTAssertEqual(swapped.firstItem as? UILayoutGuide, constraint.secondItem! as? UILayoutGuide, "The original second item should be the first item when the subjects are swapped")
        }
        else {
            XCTAssertEqual(swapped.firstItem as? UIView, constraint.secondItem! as? UIView, "The original second item should be the first item when the subjects are swapped")
        }
        XCTAssertEqual(swapped.firstAttribute, constraint.secondAttribute, "The original second attribute should be the first attribute when the subjects are swapped")
        XCTAssertEqual(swapped.relation, NSLayoutRelation.lessThanOrEqual, "The relation should not change direction")
        XCTAssertEqual(swapped.secondItem! as? UIView, constraint.firstItem as? UIView, "The original first item should be the second item when the subjects are swapped")
        XCTAssertEqual(swapped.secondAttribute, constraint.firstAttribute, "The original first attribute should be the second attribute when the subjects are swapped")
        XCTAssertEqual(swapped.multiplier, 1 / constraint.multiplier, "The original multiplier should be inverted when the subjects are swapped")
        XCTAssertEqual(swapped.constant, -constraint.constant / constraint.multiplier, "The original constant should be negated and divided by the multiplier")
        XCTAssertNil(swapped.identifier, "The identifier should not be copied to the swapped constraint")
        XCTAssertEqual(swapped.priority, priority, "The original priority should be copied to the swapped constraint")
    }


    //  MARK: - Getting positive-constant constraints

    func testZeroConstantConstraintNotSwapped() {
        constraint = NSLayoutConstraint(
            item: view,
            attribute: .width,
            relatedBy: .equal,
            toItem: otherItem,
            attribute: .height,
            multiplier: 0,
            constant: 14
        )
        positive = constraint.positiveConstantConstraint
        XCTAssertTrue(constraint === positive, "The same constraint should be returned if the constant is zero")
    }

    func testPositiveConstantConstraintNotSwapped() {
        constraint = NSLayoutConstraint(
            item: view,
            attribute: .width,
            relatedBy: .equal,
            toItem: otherItem,
            attribute: .height,
            multiplier: 2,
            constant: 14
        )
        positive = constraint.positiveConstantConstraint
        XCTAssertTrue(constraint === positive, "The same constraint should be returned if the constant is already positive")
    }

    func testNegativeConstantConstraintSwapped() {
        constraint = NSLayoutConstraint(
            item: view,
            attribute: .width,
            relatedBy: .equal,
            toItem: otherItem,
            attribute: .height,
            multiplier: 2,
            constant: -14
        )
        constraint.priority = priority
        constraint.identifier = identifier
        positive = constraint.positiveConstantConstraint

        XCTAssertTrue(constraint !== positive, "The same constraint should not be returned if the constant is negative")
        if #available(iOS 9.0, *) {
            XCTAssertEqual(positive.firstItem as? UILayoutGuide, constraint.secondItem! as? UILayoutGuide, "The original second item should be the first item when the subjects are swapped")
        }
        else {
            XCTAssertEqual(positive.firstItem as? UIView, constraint.secondItem! as? UIView, "The original second item should be the first item when the subjects are swapped")
        }
        XCTAssertEqual(positive.firstAttribute, constraint.secondAttribute, "The original second attribute should be the first attribute when the subjects are swapped")
        XCTAssertEqual(positive.relation, NSLayoutRelation.equal, "The relation should remain Equal")
        XCTAssertEqual(positive.secondItem! as? UIView, constraint.firstItem as? UIView, "The original first item should be the second item when the subjects are swapped")
        XCTAssertEqual(positive.secondAttribute, constraint.firstAttribute, "The original first attribute should be the second attribute when the subjects are swapped")
        XCTAssertEqual(positive.multiplier, 1 / constraint.multiplier, "The original multiplier should be inverted when the subjects are swapped")
        XCTAssertEqual(positive.constant, -constraint.constant / constraint.multiplier, "The original constant should be negated and divided by the multiplier")
        XCTAssertNil(positive.identifier, "The original identifier should be copied to the swapped constraint")
        XCTAssertEqual(positive.priority, priority, "The original priority should be copied to the swapped constraint")
    }

    func testNegativeConstantSingleItemConstraintNotSwapped() {
        constraint = NSLayoutConstraint(
            item: view,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: -10
        )
        positive = constraint.positiveConstantConstraint

        XCTAssertTrue(constraint === positive, "The same constraint should be returned if the constraint subjects cannot be swapped")
    }

}
