//
//  ConstraintReversalTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 6/22/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import XCTest
import UIKit

class ConstraintReversalTests: XCTestCase {

    var constraint: Constraint!
    var reversed: Constraint!
    var positive: Constraint!

    let viewOne = UIView()
    let viewTwo = UIView()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testCannotReverseConstraintWithZeroMultiplier() {
        constraint = Constraint(item: viewOne, attribute: .Width, relatedBy: .Equal, toItem: viewTwo, attribute: .Height, multiplier: 0, constant: 14)
        XCTAssertNil(constraint.reversed(), "Cannot reverse a constraint with zero multiplier")
    }

    func testCannotReverseConstraintWithoutSecondItemAndAttribute() {
        constraint = Constraint(item: viewOne, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 2, constant: 14)
        XCTAssertNil(constraint.reversed(), "Cannot reverse a constraint without a second attribute")
    }

    func testEqualReversal() {
        constraint = Constraint(item: viewOne, attribute: .Width, relatedBy: .Equal, toItem: viewTwo, attribute: .Height, multiplier: 2, constant: 14)
        reversed = constraint.reversed()
        XCTAssertEqual(reversed.firstItem as! UIView, constraint.secondItem as! UIView, "The original second item should be the first item when reversed")
        XCTAssertEqual(reversed.firstAttribute, constraint.secondAttribute, "The original second attribute should be the first attribute when reversed")
        XCTAssertEqual(reversed.relation, NSLayoutRelation.Equal, "The relation should remain Equal")
        XCTAssertEqual(reversed.secondItem as! UIView, constraint.firstItem as! UIView, "The original first item should be the second item when reversed")
        XCTAssertEqual(reversed.secondAttribute, constraint.firstAttribute, "The original first attribute should be the second attribute when reversed")
        XCTAssertEqual(reversed.multiplier, 1 / constraint.multiplier, "The original multiplier should be inverted when reversed")
        XCTAssertEqual(reversed.constant, -constraint.constant / constraint.multiplier, "The original constant should be negated and divided by the multiplier")
    }

    func testGreaterThanOrEqualPositiveMultiplierReversal() {
        constraint = Constraint(item: viewOne, attribute: .Width, relatedBy: .GreaterThanOrEqual, toItem: viewTwo, attribute: .Height, multiplier: 2, constant: 14)
        reversed = constraint.reversed()
        XCTAssertEqual(reversed.firstItem as! UIView, constraint.secondItem as! UIView, "The original second item should be the first item when reversed")
        XCTAssertEqual(reversed.firstAttribute, constraint.secondAttribute, "The original second attribute should be the first attribute when reversed")
        XCTAssertEqual(reversed.relation, NSLayoutRelation.LessThanOrEqual, "The relation should change direction")
        XCTAssertEqual(reversed.secondItem as! UIView, constraint.firstItem as! UIView, "The original first item should be the second item when reversed")
        XCTAssertEqual(reversed.secondAttribute, constraint.firstAttribute, "The original first attribute should be the second attribute when reversed")
        XCTAssertEqual(reversed.multiplier, 1 / constraint.multiplier, "The original multiplier should be inverted when reversed")
        XCTAssertEqual(reversed.constant, -constraint.constant / constraint.multiplier, "The original constant should be negated and divided by the multiplier")
    }

    func testGreaterThanOrEqualNegativeMultiplierReversal() {
        constraint = Constraint(item: viewOne, attribute: .Width, relatedBy: .GreaterThanOrEqual, toItem: viewTwo, attribute: .Height, multiplier: -2, constant: 14)
        reversed = constraint.reversed()
        XCTAssertEqual(reversed.firstItem as! UIView, constraint.secondItem as! UIView, "The original second item should be the first item when reversed")
        XCTAssertEqual(reversed.firstAttribute, constraint.secondAttribute, "The original second attribute should be the first attribute when reversed")
        XCTAssertEqual(reversed.relation, NSLayoutRelation.GreaterThanOrEqual, "The relation should not change direction")
        XCTAssertEqual(reversed.secondItem as! UIView, constraint.firstItem as! UIView, "The original first item should be the second item when reversed")
        XCTAssertEqual(reversed.secondAttribute, constraint.firstAttribute, "The original first attribute should be the second attribute when reversed")
        XCTAssertEqual(reversed.multiplier, 1 / constraint.multiplier, "The original multiplier should be inverted when reversed")
        XCTAssertEqual(reversed.constant, -constraint.constant / constraint.multiplier, "The original constant should be negated and divided by the multiplier")
    }

    func testLessThanOrEqualPositiveMultiplierReversal() {
        constraint = Constraint(item: viewOne, attribute: .Width, relatedBy: .LessThanOrEqual, toItem: viewTwo, attribute: .Height, multiplier: 2, constant: 14)
        reversed = constraint.reversed()
        XCTAssertEqual(reversed.firstItem as! UIView, constraint.secondItem as! UIView, "The original second item should be the first item when reversed")
        XCTAssertEqual(reversed.firstAttribute, constraint.secondAttribute, "The original second attribute should be the first attribute when reversed")
        XCTAssertEqual(reversed.relation, NSLayoutRelation.GreaterThanOrEqual, "The relation should change direction")
        XCTAssertEqual(reversed.secondItem as! UIView, constraint.firstItem as! UIView, "The original first item should be the second item when reversed")
        XCTAssertEqual(reversed.secondAttribute, constraint.firstAttribute, "The original first attribute should be the second attribute when reversed")
        XCTAssertEqual(reversed.multiplier, 1 / constraint.multiplier, "The original multiplier should be inverted when reversed")
        XCTAssertEqual(reversed.constant, -constraint.constant / constraint.multiplier, "The original constant should be negated and divided by the multiplier")
    }

    func testLessThanOrEqualNegativeMultiplierReversal() {
        constraint = Constraint(item: viewOne, attribute: .Width, relatedBy: .LessThanOrEqual, toItem: viewTwo, attribute: .Height, multiplier: -2, constant: 14)
        reversed = constraint.reversed()
        XCTAssertEqual(reversed.firstItem as! UIView, constraint.secondItem as! UIView, "The original second item should be the first item when reversed")
        XCTAssertEqual(reversed.firstAttribute, constraint.secondAttribute, "The original second attribute should be the first attribute when reversed")
        XCTAssertEqual(reversed.relation, NSLayoutRelation.LessThanOrEqual, "The relation should not change direction")
        XCTAssertEqual(reversed.secondItem as! UIView, constraint.firstItem as! UIView, "The original first item should be the second item when reversed")
        XCTAssertEqual(reversed.secondAttribute, constraint.firstAttribute, "The original first attribute should be the second attribute when reversed")
        XCTAssertEqual(reversed.multiplier, 1 / constraint.multiplier, "The original multiplier should be inverted when reversed")
        XCTAssertEqual(reversed.constant, -constraint.constant / constraint.multiplier, "The original constant should be negated and divided by the multiplier")
    }

    //  Getting positive-constant constraints

    func testZeroConstantConstraintNotReversed() {
        constraint = Constraint(item: viewOne, attribute: .Width, relatedBy: .Equal, toItem: viewTwo, attribute: .Height, multiplier: 0, constant: 14)
        positive = constraint.makeConstantPositive()
        XCTAssertTrue(constraint === positive, "The same constraint should be returned if the constant is zero")
    }

    func testPositiveConstantConstraintNotReversed() {
        constraint = Constraint(item: viewOne, attribute: .Width, relatedBy: .Equal, toItem: viewTwo, attribute: .Height, multiplier: 2, constant: 14)
        positive = constraint.makeConstantPositive()
        XCTAssertTrue(constraint === positive, "The same constraint should be returned if the constant is already positive")
    }

    func testNegativeConstantConstraintReversed() {
        constraint = Constraint(item: viewOne, attribute: .Width, relatedBy: .Equal, toItem: viewTwo, attribute: .Height, multiplier: 2, constant: -14)
        positive = constraint.makeConstantPositive()
        XCTAssertTrue(constraint !== positive, "The same constraint should not be returned if the constant is negative")
        XCTAssertEqual(positive.firstItem as! UIView, constraint.secondItem as! UIView, "The original second item should be the first item when reversed")
        XCTAssertEqual(positive.firstAttribute, constraint.secondAttribute, "The original second attribute should be the first attribute when reversed")
        XCTAssertEqual(positive.relation, NSLayoutRelation.Equal, "The relation should remain Equal")
        XCTAssertEqual(positive.secondItem as! UIView, constraint.firstItem as! UIView, "The original first item should be the second item when reversed")
        XCTAssertEqual(positive.secondAttribute, constraint.firstAttribute, "The original first attribute should be the second attribute when reversed")
        XCTAssertEqual(positive.multiplier, 1 / constraint.multiplier, "The original multiplier should be inverted when reversed")
        XCTAssertEqual(positive.constant, -constraint.constant / constraint.multiplier, "The original constant should be negated and divided by the multiplier")
    }

}
