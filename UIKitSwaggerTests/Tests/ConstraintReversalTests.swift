//
//  ConstraintReversalTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 6/22/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import XCTest
import UIKit
@testable import UIKitSwagger

class ConstraintReversalTests: XCTestCase {

    var constraint: NSLayoutConstraint!
    var reversed: NSLayoutConstraint!
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

    func testCannotReverseConstraintWithZeroMultiplier() {
        constraint = NSLayoutConstraint(
            item: view,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: otherItem,
            attribute: .Height,
            multiplier: 0,
            constant: 14
        )
        constraint.priority = priority
        constraint.identifier = identifier
        XCTAssertNil(constraint.reversed(), "Cannot reverse a constraint with zero multiplier")
    }

    func testCannotReverseConstraintWithoutSecondItemAndAttribute() {
        constraint = NSLayoutConstraint(
            item: view,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 2,
            constant: 14
        )
        constraint.priority = priority
        constraint.identifier = identifier
        XCTAssertNil(constraint.reversed(), "Cannot reverse a constraint without a second attribute")
    }

    func testEqualReversal() {
        constraint = NSLayoutConstraint(
            item: view,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: otherItem,
            attribute: .Height,
            multiplier: 2,
            constant: 14
        )
        constraint.priority = priority
        constraint.identifier = identifier
        reversed = constraint.reversed()

        if #available(iOS 9.0, *) {
            XCTAssertEqual(reversed.firstItem as? UILayoutGuide, constraint.secondItem! as? UILayoutGuide, "The original second item should be the first item when reversed")
        }
        else {
            XCTAssertEqual(reversed.firstItem as? UIView, constraint.secondItem! as? UIView, "The original second item should be the first item when reversed")
        }
        XCTAssertEqual(reversed.firstAttribute, constraint.secondAttribute, "The original second attribute should be the first attribute when reversed")
        XCTAssertEqual(reversed.relation, NSLayoutRelation.Equal, "The relation should remain Equal")
        XCTAssertEqual(reversed.secondItem! as? UIView, constraint.firstItem as? UIView, "The original first item should be the second item when reversed")
        XCTAssertEqual(reversed.secondAttribute, constraint.firstAttribute, "The original first attribute should be the second attribute when reversed")
        XCTAssertEqual(reversed.multiplier, 1 / constraint.multiplier, "The original multiplier should be inverted when reversed")
        XCTAssertEqual(reversed.constant, -constraint.constant / constraint.multiplier, "The original constant should be negated and divided by the multiplier")
        XCTAssertNil(reversed.identifier, "The identifier should not be copied to the reversed constraint")
        XCTAssertEqual(reversed.priority, priority, "The original priority should be copied to the reversed constraint")
    }

    func testGreaterThanOrEqualPositiveMultiplierReversal() {
        constraint = NSLayoutConstraint(
            item: view,
            attribute: .Width,
            relatedBy: .GreaterThanOrEqual,
            toItem: otherItem,
            attribute: .Height,
            multiplier: 2,
            constant: 14
        )
        constraint.priority = priority
        constraint.identifier = identifier
        reversed = constraint.reversed()

        if #available(iOS 9.0, *) {
            XCTAssertEqual(reversed.firstItem as? UILayoutGuide, constraint.secondItem! as? UILayoutGuide, "The original second item should be the first item when reversed")
        }
        else {
            XCTAssertEqual(reversed.firstItem as? UIView, constraint.secondItem! as? UIView, "The original second item should be the first item when reversed")
        }
        XCTAssertEqual(reversed.firstAttribute, constraint.secondAttribute, "The original second attribute should be the first attribute when reversed")
        XCTAssertEqual(reversed.relation, NSLayoutRelation.LessThanOrEqual, "The relation should change direction")
        XCTAssertEqual(reversed.secondItem! as? UIView, constraint.firstItem as? UIView, "The original first item should be the second item when reversed")
        XCTAssertEqual(reversed.secondAttribute, constraint.firstAttribute, "The original first attribute should be the second attribute when reversed")
        XCTAssertEqual(reversed.multiplier, 1 / constraint.multiplier, "The original multiplier should be inverted when reversed")
        XCTAssertEqual(reversed.constant, -constraint.constant / constraint.multiplier, "The original constant should be negated and divided by the multiplier")
        XCTAssertNil(reversed.identifier, "The identifier should not be copied to the reversed constraint")
        XCTAssertEqual(reversed.priority, priority, "The original priority should be copied to the reversed constraint")
    }

    func testGreaterThanOrEqualNegativeMultiplierReversal() {
        constraint = NSLayoutConstraint(
            item: view,
            attribute: .Width,
            relatedBy: .GreaterThanOrEqual,
            toItem: otherItem,
            attribute: .Height,
            multiplier: -2,
            constant: 14
        )
        constraint.priority = priority
        constraint.identifier = identifier
        reversed = constraint.reversed()

        if #available(iOS 9.0, *) {
            XCTAssertEqual(reversed.firstItem as? UILayoutGuide, constraint.secondItem! as? UILayoutGuide, "The original second item should be the first item when reversed")
        }
        else {
            XCTAssertEqual(reversed.firstItem as? UIView, constraint.secondItem! as? UIView, "The original second item should be the first item when reversed")
        }
        XCTAssertEqual(reversed.firstAttribute, constraint.secondAttribute, "The original second attribute should be the first attribute when reversed")
        XCTAssertEqual(reversed.relation, NSLayoutRelation.GreaterThanOrEqual, "The relation should not change direction")
        XCTAssertEqual(reversed.secondItem! as? UIView, constraint.firstItem as? UIView, "The original first item should be the second item when reversed")
        XCTAssertEqual(reversed.secondAttribute, constraint.firstAttribute, "The original first attribute should be the second attribute when reversed")
        XCTAssertEqual(reversed.multiplier, 1 / constraint.multiplier, "The original multiplier should be inverted when reversed")
        XCTAssertEqual(reversed.constant, -constraint.constant / constraint.multiplier, "The original constant should be negated and divided by the multiplier")
        XCTAssertNil(reversed.identifier, "The identifier should not be copied to the reversed constraint")
        XCTAssertEqual(reversed.priority, priority, "The original priority should be copied to the reversed constraint")
    }

    func testLessThanOrEqualPositiveMultiplierReversal() {
        constraint = NSLayoutConstraint(
            item: view,
            attribute: .Width,
            relatedBy: .LessThanOrEqual,
            toItem: otherItem,
            attribute: .Height,
            multiplier: 2,
            constant: 14
        )
        constraint.priority = priority
        constraint.identifier = identifier
        reversed = constraint.reversed()

        if #available(iOS 9.0, *) {
            XCTAssertEqual(reversed.firstItem as? UILayoutGuide, constraint.secondItem! as? UILayoutGuide, "The original second item should be the first item when reversed")
        }
        else {
            XCTAssertEqual(reversed.firstItem as? UIView, constraint.secondItem! as? UIView, "The original second item should be the first item when reversed")
        }
        XCTAssertEqual(reversed.firstAttribute, constraint.secondAttribute, "The original second attribute should be the first attribute when reversed")
        XCTAssertEqual(reversed.relation, NSLayoutRelation.GreaterThanOrEqual, "The relation should change direction")
        XCTAssertEqual(reversed.secondItem! as? UIView, constraint.firstItem as? UIView, "The original first item should be the second item when reversed")
        XCTAssertEqual(reversed.secondAttribute, constraint.firstAttribute, "The original first attribute should be the second attribute when reversed")
        XCTAssertEqual(reversed.multiplier, 1 / constraint.multiplier, "The original multiplier should be inverted when reversed")
        XCTAssertEqual(reversed.constant, -constraint.constant / constraint.multiplier, "The original constant should be negated and divided by the multiplier")
        XCTAssertNil(reversed.identifier, "The identifier should not be copied to the reversed constraint")
        XCTAssertEqual(reversed.priority, priority, "The original priority should be copied to the reversed constraint")
    }

    func testLessThanOrEqualNegativeMultiplierReversal() {
        constraint = NSLayoutConstraint(
            item: view,
            attribute: .Width,
            relatedBy: .LessThanOrEqual,
            toItem: otherItem,
            attribute: .Height,
            multiplier: -2,
            constant: 14
        )
        constraint.priority = priority
        constraint.identifier = identifier
        reversed = constraint.reversed()

        if #available(iOS 9.0, *) {
            XCTAssertEqual(reversed.firstItem as? UILayoutGuide, constraint.secondItem! as? UILayoutGuide, "The original second item should be the first item when reversed")
        }
        else {
            XCTAssertEqual(reversed.firstItem as? UIView, constraint.secondItem! as? UIView, "The original second item should be the first item when reversed")
        }
        XCTAssertEqual(reversed.firstAttribute, constraint.secondAttribute, "The original second attribute should be the first attribute when reversed")
        XCTAssertEqual(reversed.relation, NSLayoutRelation.LessThanOrEqual, "The relation should not change direction")
        XCTAssertEqual(reversed.secondItem! as? UIView, constraint.firstItem as? UIView, "The original first item should be the second item when reversed")
        XCTAssertEqual(reversed.secondAttribute, constraint.firstAttribute, "The original first attribute should be the second attribute when reversed")
        XCTAssertEqual(reversed.multiplier, 1 / constraint.multiplier, "The original multiplier should be inverted when reversed")
        XCTAssertEqual(reversed.constant, -constraint.constant / constraint.multiplier, "The original constant should be negated and divided by the multiplier")
        XCTAssertNil(reversed.identifier, "The identifier should not be copied to the reversed constraint")
        XCTAssertEqual(reversed.priority, priority, "The original priority should be copied to the reversed constraint")
    }

    //  Getting positive-constant constraints

    func testZeroConstantConstraintNotReversed() {
        constraint = NSLayoutConstraint(
            item: view,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: otherItem,
            attribute: .Height,
            multiplier: 0,
            constant: 14
        )
        constraint.priority = priority
        constraint.identifier = identifier
        positive = constraint.makeConstantPositive()
        XCTAssertTrue(constraint === positive, "The same constraint should be returned if the constant is zero")
    }

    func testPositiveConstantConstraintNotReversed() {
        constraint = NSLayoutConstraint(
            item: view,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: otherItem,
            attribute: .Height,
            multiplier: 2,
            constant: 14
        )
        constraint.priority = priority
        constraint.identifier = identifier
        positive = constraint.makeConstantPositive()
        XCTAssertTrue(constraint === positive, "The same constraint should be returned if the constant is already positive")
    }

    func testNegativeConstantConstraintReversed() {
        constraint = NSLayoutConstraint(
            item: view,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: otherItem,
            attribute: .Height,
            multiplier: 2,
            constant: -14
        )
        constraint.priority = priority
        constraint.identifier = identifier
        positive = constraint.makeConstantPositive()

        XCTAssertTrue(constraint !== positive, "The same constraint should not be returned if the constant is negative")
        if #available(iOS 9.0, *) {
            XCTAssertEqual(positive.firstItem as? UILayoutGuide, constraint.secondItem! as? UILayoutGuide, "The original second item should be the first item when reversed")
        }
        else {
            XCTAssertEqual(positive.firstItem as? UIView, constraint.secondItem! as? UIView, "The original second item should be the first item when reversed")
        }
        XCTAssertEqual(positive.firstAttribute, constraint.secondAttribute, "The original second attribute should be the first attribute when reversed")
        XCTAssertEqual(positive.relation, NSLayoutRelation.Equal, "The relation should remain Equal")
        XCTAssertEqual(positive.secondItem! as? UIView, constraint.firstItem as? UIView, "The original first item should be the second item when reversed")
        XCTAssertEqual(positive.secondAttribute, constraint.firstAttribute, "The original first attribute should be the second attribute when reversed")
        XCTAssertEqual(positive.multiplier, 1 / constraint.multiplier, "The original multiplier should be inverted when reversed")
        XCTAssertEqual(positive.constant, -constraint.constant / constraint.multiplier, "The original constant should be negated and divided by the multiplier")
        XCTAssertNil(positive.identifier, "The original identifier should be copied to the reversed constraint")
        XCTAssertEqual(positive.priority, priority, "The original priority should be copied to the reversed constraint")
    }

}
