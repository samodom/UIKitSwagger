//
//  ConstraintActivationTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest
@testable import UIKitSwagger

class ConstraintActivationTests: XCTestCase {

    var controller: UIViewController!
    var view: UIView!
    let subview = UIView()
    var guide: AnyObject!
    var constraint1: NSLayoutConstraint!
    var constraint2: NSLayoutConstraint!
    var constraint3: NSLayoutConstraint!
    var constraintArray: [NSLayoutConstraint]!

    override func setUp() {
        super.setUp()

        let window = UIApplication.shared.delegate!.window!
        controller = window!.rootViewController
        view = controller.view
        view.addSubview(subview)
        if #available(iOS 9.0, *) {
            guide = UILayoutGuide()
            view.addLayoutGuide(guide as! UILayoutGuide)
        }

        constraint1 = subview.top =* controller.top
        constraint2 = view.left =* subview.left - 10
        if #available(iOS 9.0, *) {
            constraint3 = (guide as! UILayoutGuide).bottom =* controller.bottom + 10
        }
        else {
            constraint3 = subview.centerX =* view.centerX
        }

        constraintArray = [constraint1, constraint2, constraint3]
    }
    
    override func tearDown() {
        super.tearDown()

        subview.removeFromSuperview()
        if #available(iOS 9.0, *) {
            view.removeLayoutGuide(guide as! UILayoutGuide)
        }
        view.clearConstraints()
    }

    func testActivatingInactiveConstraint() {
        constraint1.activate()
        XCTAssertTrue(constraint1.isActive, "The inactive constraint should be activated")
    }

    func testNotDeactivatingActiveConstraint() {
        constraint1.isActive = true
        constraint1.activate()
        XCTAssertTrue(constraint1.isActive, "The active contraint should not be deactivated")
    }

    func testDeactivatingActiveConstraint() {
        constraint1.isActive = true
        constraint1.deactivate()
        XCTAssertFalse(constraint1.isActive, "The active constraint should be deactivated")
    }

    func testNotActivatingInactiveConstraint() {
        constraint1.deactivate()
        XCTAssertFalse(constraint1.isActive, "The inactive constraint should not be activated")
    }

    func testActivationOfSingleConstraint() {
        ActivateConstraints(constraint1)
        XCTAssertTrue(constraint1.isActive, "The constraint should be activated")
    }

    func testActiveConstraintNotDeactivated() {
        constraint1.isActive = true
        ActivateConstraints(constraint1)
        XCTAssertTrue(constraint1.isActive, "An active constraint should not be deactivated")
    }

    func testActivationOfConstraintList() {
        ActivateConstraints(constraint1, constraint2, constraint3)
        XCTAssertTrue(constraint1.isActive, "Each constraint should be activated")
        XCTAssertTrue(constraint2.isActive, "Each constraint should be activated")
        XCTAssertTrue(constraint3.isActive, "Each constraint should be activated")
    }

    func testActivationOfConstraintArrayWithFunction() {
        ActivateConstraints(constraintArray)
        XCTAssertTrue(constraint1.isActive, "Each constraint should be activated")
        XCTAssertTrue(constraint2.isActive, "Each constraint should be activated")
        XCTAssertTrue(constraint3.isActive, "Each constraint should be activated")
    }

    func testActivationOfConstraintArrayWithMethod() {
        constraintArray.activate()
        XCTAssertTrue(constraint1.isActive, "Each constraint should be activated")
        XCTAssertTrue(constraint2.isActive, "Each constraint should be activated")
        XCTAssertTrue(constraint3.isActive, "Each constraint should be activated")
    }

    func testDeactivationOfSingleConstraint() {
        constraint1.isActive = true
        DeactivateConstraints(constraint1)
        XCTAssertFalse(constraint1.isActive, "The constraint should be deactivated")
    }

    func testDeactiveConstraintNotActivated() {
        DeactivateConstraints(constraint1)
        XCTAssertFalse(constraint1.isActive, "An inactive constraint should not be activated")
    }

    func testDeactivationOfConstraintList() {
        constraint1.isActive = true
        constraint2.isActive = true
        constraint3.isActive = true
        DeactivateConstraints(constraint1, constraint2, constraint3)
        XCTAssertFalse(constraint1.isActive, "Each constraint should be deactivated")
        XCTAssertFalse(constraint2.isActive, "Each constraint should be deactivated")
        XCTAssertFalse(constraint3.isActive, "Each constraint should be deactivated")
    }

    func testDeactivationOfConstraintArrayWithFunction() {
        constraint1.isActive = true
        constraint2.isActive = true
        constraint3.isActive = true
        DeactivateConstraints([constraint1, constraint2, constraint3])
        XCTAssertFalse(constraint1.isActive, "Each constraint should be deactivated")
        XCTAssertFalse(constraint2.isActive, "Each constraint should be deactivated")
        XCTAssertFalse(constraint3.isActive, "Each constraint should be deactivated")
    }

    func testDeactivationOfConstraintArrayWithMethod() {
        constraint1.isActive = true
        constraint2.isActive = true
        constraint3.isActive = true
        [constraint1, constraint2, constraint3].deactivate()
        XCTAssertFalse(constraint1.isActive, "Each constraint should be deactivated")
        XCTAssertFalse(constraint2.isActive, "Each constraint should be deactivated")
        XCTAssertFalse(constraint3.isActive, "Each constraint should be deactivated")
    }

}
