//
//  ConstraintActivationTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class ConstraintActivationTests: XCTestCase {

    let view = UIView()
    let subview1 = UIView()
    let subview2 = UIView()
    let subview3 = UIView()
    var constraint1: Constraint!
    var constraint2: Constraint!
    var constraint3: Constraint!

    override func setUp() {
        super.setUp()

        view.addSubview(subview1)
        view.addSubview(subview2)
        view.addSubview(subview3)

        constraint1 = subview1.centerX =* view.centerX
        constraint2 = subview2.centerX =* view.centerX
        constraint3 = subview3.centerX =* view.centerX
        ApplyConstraints(constraint1, constraint2, constraint3)

        constraint1.active = false
        constraint2.active = false
        constraint3.active = false
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testActivatingInactiveConstraint() {
        constraint1.active = false
        constraint1.activate()
        XCTAssertTrue(constraint1.active, "The inactive constraint should be activated")
    }

    func testNotDeactivatingActiveConstraint() {
        constraint1.active = true
        constraint1.activate()
        XCTAssertTrue(constraint1.active, "The active contraint should not be deactivated")
    }

    func testDeactivatingActiveConstraint() {
        constraint1.active = true
        constraint1.deactivate()
        XCTAssertFalse(constraint1.active, "The active constraint should be deactivated")
    }

    func testNotActivatingInactiveConstraint() {
        constraint1.active = false
        constraint1.deactivate()
        XCTAssertFalse(constraint1.active, "The inactive constraint should not be activated")
    }

    func testActivationOfSingleConstraint() {
        ActivateConstraints(constraint1)
        XCTAssertTrue(constraint1.active, "The constraint should be activated")
    }

    func testActiveConstraintNotDeactivated() {
        constraint1.active = true
        ActivateConstraints(constraint1)
        XCTAssertTrue(constraint1.active, "An active constraint should not be deactivated")
    }

    func testActivationOfConstraintList() {
        ActivateConstraints(constraint1, constraint2, constraint3)
        XCTAssertTrue(constraint1.active, "Each constraint should be activated")
        XCTAssertTrue(constraint2.active, "Each constraint should be activated")
        XCTAssertTrue(constraint3.active, "Each constraint should be activated")
    }

    func testActivationOfConstraintArray() {
        ActivateConstraints([constraint1, constraint2, constraint3])
        XCTAssertTrue(constraint1.active, "Each constraint should be activated")
        XCTAssertTrue(constraint2.active, "Each constraint should be activated")
        XCTAssertTrue(constraint3.active, "Each constraint should be activated")
    }

    func testDeactivationOfSingleConstraint() {
        constraint1.active = true
        DeactivateConstraints(constraint1)
        XCTAssertFalse(constraint1.active, "The constraint should be deactivated")
    }

    func testDeactiveConstraintNotActivated() {
        DeactivateConstraints(constraint1)
        XCTAssertFalse(constraint1.active, "An inactive constraint should not be activated")
    }

    func testDeactivationOfConstraintList() {
        constraint1.active = true
        constraint2.active = true
        constraint3.active = true
        DeactivateConstraints(constraint1, constraint2, constraint3)
        XCTAssertFalse(constraint1.active, "Each constraint should be deactivated")
        XCTAssertFalse(constraint2.active, "Each constraint should be deactivated")
        XCTAssertFalse(constraint3.active, "Each constraint should be deactivated")
    }

    func testDeactivationOfConstraintArray() {
        constraint1.active = true
        constraint2.active = true
        constraint3.active = true
        DeactivateConstraints([constraint1, constraint2, constraint3])
        XCTAssertFalse(constraint1.active, "Each constraint should be deactivated")
        XCTAssertFalse(constraint2.active, "Each constraint should be deactivated")
        XCTAssertFalse(constraint3.active, "Each constraint should be deactivated")
    }
    
}
