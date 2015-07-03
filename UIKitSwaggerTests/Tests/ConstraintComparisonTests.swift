//
//  ConstraintComparisonTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 6/21/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import XCTest
import UIKit
@testable import UIKitSwagger

class ConstraintComparisonTests: XCTestCase {

    let view = UIView()
    var otherItem: AnyObject!
    let differentView = UIView()
    var constraintOne: NSLayoutConstraint!
    var constraintTwo: NSLayoutConstraint!

    let identifier = "Sample Identifier"

    override func setUp() {
        super.setUp()

        if #available(iOS 9.0, *) {
            otherItem = UILayoutGuide()
        }
        else {
            otherItem = UIView()
        }

        constraintOne = NSLayoutConstraint(
            item: view,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: otherItem,
            attribute: .CenterX,
            multiplier: 14.0,
            constant: 42.0
        )
        constraintOne.priority = 140
        constraintOne.identifier = identifier
    }
    
    override func tearDown() {
        super.tearDown()
    }

    //  MARK: Equivalency

    func testIdenticalContraintsAreEqual() {
        XCTAssertEqual(constraintOne, constraintOne, "A constraint should be considered equal to itself")
    }

    func testEquivalentConstraintsAreEqual() {
        constraintTwo = NSLayoutConstraint(
            item: constraintOne.firstItem,
            attribute: constraintOne.firstAttribute,
            relatedBy: constraintOne.relation,
            toItem: constraintOne.secondItem,
            attribute: constraintOne.secondAttribute,
            multiplier: constraintOne.multiplier,
            constant: constraintOne.constant
        )
        constraintTwo.priority = constraintOne.priority
        XCTAssertEqual(constraintOne, constraintTwo, "The two constraints should be considered equivalent comparing everything but their identifiers")
    }

    func testReversedConstraintsAreEqual() {
        constraintTwo = constraintOne.reversed()
        XCTAssertEqual(constraintOne, constraintTwo, "The two constraints should be considered equivalent")
    }

    func testMismatchedFirstItemsMakeConstraintsUnequal() {
        constraintTwo = NSLayoutConstraint(
            item: differentView,
            attribute: constraintOne.firstAttribute,
            relatedBy: constraintOne.relation,
            toItem: constraintOne.secondItem,
            attribute: constraintOne.secondAttribute,
            multiplier: constraintOne.multiplier,
            constant: constraintOne.constant
        )
        XCTAssertNotEqual(constraintOne, constraintTwo, "The two constraints should not be considered equivalent if their first items do not match")
    }

    func testMismatchedFirstAttributesMakeConstraintsUnequal() {
        constraintTwo = NSLayoutConstraint(
            item: constraintOne.firstItem,
            attribute: .Trailing,
            relatedBy: constraintOne.relation,
            toItem: constraintOne.secondItem,
            attribute: constraintOne.secondAttribute,
            multiplier: constraintOne.multiplier,
            constant: constraintOne.constant
        )
        XCTAssertNotEqual(constraintOne, constraintTwo, "The two constraints should not be considered equivalent if their first attributes do not match")
    }

    func testMismatchedRelationsMakeConstraintsUnequal() {
        constraintTwo = NSLayoutConstraint(
            item: constraintOne.firstItem,
            attribute: constraintOne.firstAttribute,
            relatedBy: .GreaterThanOrEqual,
            toItem: constraintOne.secondItem,
            attribute: constraintOne.secondAttribute,
            multiplier: constraintOne.multiplier,
            constant: constraintOne.constant
        )
        XCTAssertNotEqual(constraintOne, constraintTwo, "The two constraints should not be considered equivalent if the relations do not match")
    }

    func testMismatchedSecondItemsMakeConstraintsUnequal() {
        constraintTwo = NSLayoutConstraint(
            item: constraintOne.firstItem,
            attribute: constraintOne.firstAttribute,
            relatedBy: constraintOne.relation,
            toItem: differentView,
            attribute: constraintOne.secondAttribute,
            multiplier: constraintOne.multiplier,
            constant: constraintOne.constant
        )
        XCTAssertNotEqual(constraintOne, constraintTwo, "The two constraints should not be considered equivalent if their second items do not match")
    }

    func testMismatchedSecondAttributesMakeConstraintsUnequal() {
        constraintTwo = NSLayoutConstraint(
            item: constraintOne.firstItem,
            attribute: constraintOne.firstAttribute,
            relatedBy: constraintOne.relation,
            toItem: constraintOne.secondItem,
            attribute: .Trailing,
            multiplier: constraintOne.multiplier,
            constant: constraintOne.constant
        )
        XCTAssertNotEqual(constraintOne, constraintTwo, "The two constraints should not be considered equivalent if their second attributes do not match")
    }

    func testMismatchedMultiplierMakeConstraintsUnequal() {
        constraintTwo = NSLayoutConstraint(
            item: constraintOne.firstItem,
            attribute: constraintOne.firstAttribute,
            relatedBy: constraintOne.relation,
            toItem: constraintOne.secondItem,
            attribute: constraintOne.secondAttribute,
            multiplier: 42,
            constant: constraintOne.constant
        )
        XCTAssertNotEqual(constraintOne, constraintTwo, "The two constraints should not be considered equivalent if their multipliers do not match")
    }

    func testMismatchedConstantsMakeConstraintsUnequal() {
        constraintTwo = NSLayoutConstraint(
            item: constraintOne.firstItem,
            attribute: constraintOne.firstAttribute,
            relatedBy: constraintOne.relation,
            toItem: constraintOne.secondItem,
            attribute: constraintOne.secondAttribute,
            multiplier: constraintOne.multiplier,
            constant: 99
        )
        XCTAssertNotEqual(constraintOne, constraintTwo, "The two constraints should not be considered equivalent if their constants do not match")
    }

    func testMismatchedPrioritiesMakeConstraintsUnequal() {
        constraintTwo = NSLayoutConstraint(
            item: constraintOne.firstItem,
            attribute: constraintOne.firstAttribute,
            relatedBy: constraintOne.relation,
            toItem: constraintOne.secondItem,
            attribute: constraintOne.secondAttribute,
            multiplier: constraintOne.multiplier,
            constant: constraintOne.constant
        )
        constraintTwo.priority = 42
        XCTAssertNotEqual(constraintOne, constraintTwo, "The two constraints should not be considered equivalent if their priorities do not match")
    }

    //  MARK: Identity-ish

    func testIdenticalContraintsAreIdentical() {
        let equal = (constraintOne ==* constraintOne)
        XCTAssertTrue(equal, "A constraint and itself should be considered identical")
    }

    func testEquivalentConstraintsAreNotIdenticalWithoutMatchingIdentifiers() {
        constraintTwo = NSLayoutConstraint(
            item: constraintOne.firstItem,
            attribute: constraintOne.firstAttribute,
            relatedBy: constraintOne.relation,
            toItem: constraintOne.secondItem,
            attribute: constraintOne.secondAttribute,
            multiplier: constraintOne.multiplier,
            constant: constraintOne.constant
        )
        constraintTwo.priority = constraintOne.priority
        XCTAssertFalse(constraintOne ==* constraintTwo, "The equivalent constraints should not be considered identical")
    }

    func testIdenticalCopiesOfConstraintsAreIdentical() {
        constraintTwo = NSLayoutConstraint(
            item: constraintOne.firstItem,
            attribute: constraintOne.firstAttribute,
            relatedBy: constraintOne.relation,
            toItem: constraintOne.secondItem,
            attribute: constraintOne.secondAttribute,
            multiplier: constraintOne.multiplier,
            constant: constraintOne.constant
        )
        constraintTwo.priority = constraintOne.priority
        constraintTwo.identifier = constraintOne.identifier
        XCTAssertTrue(constraintOne ==* constraintTwo, "The two constraints should be considered identical")
    }

}
