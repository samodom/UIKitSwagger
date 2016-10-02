//
//  ConstraintActivationTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import UIKitSwagger

class ConstraintActivationTests: XCTestCase {

    var controller: UIViewController!
    var view: UIView!
    let subview = UIView()
    var guide: AnyObject! // really for a UILayoutGuide
    var constraint1: NSLayoutConstraint!
    var constraint2: NSLayoutConstraint!
    var constraint3: NSLayoutConstraint!
    var constraintArray: [NSLayoutConstraint]!
    var constraintSet: Set<NSLayoutConstraint>!

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
        constraint2 = view.left =* (subview.left - 10)
        constraint2.isActive = true

        if #available(iOS 9.0, *) {
            constraint3 = (guide as! UILayoutGuide).bottom =* (controller.bottom + 10)
        }
        else {
            constraint3 = subview.centerX =* view.centerX
        }

        constraintArray = [constraint1, constraint2, constraint3]
        constraintSet = [constraint1, constraint2, constraint3]
    }
    
    override func tearDown() {
        super.tearDown()

        subview.removeFromSuperview()
        if #available(iOS 9.0, *) {
            view.removeLayoutGuide(guide as! UILayoutGuide)
        }
        view.clearConstraints()
    }

    //  MARK: Single constraint

    func testActivatingConstraint() {
        constraint1.activate()
        XCTAssertTrue(constraint1.isActive, "The inactive constraint should be activated")
    }

    func testNotDeactivatingConstraint() {
        constraint1.isActive = true
        constraint1.activate()
        XCTAssertTrue(constraint1.isActive, "The active contraint should not be deactivated")
    }

    func testDeactivatingConstraint() {
        constraint1.isActive = true
        constraint1.deactivate()
        XCTAssertFalse(constraint1.isActive, "The active constraint should be deactivated")
    }

    func testNotActivatingConstraint() {
        constraint1.deactivate()
        XCTAssertFalse(constraint1.isActive, "The inactive constraint should not be activated")
    }


    //  MARK: Multiple constraints

    func testActivationOfConstraintArrayLiteral() {
        [constraint1, constraint2, constraint3].activate()
        XCTAssertTrue(constraint1.isActive, "Each constraint should be activated")
        XCTAssertTrue(constraint2.isActive, "Active constraints should stay activated")
        XCTAssertTrue(constraint3.isActive, "Each constraint should be activated")
    }

    func testActivationOfConstraintArray() {
        constraintArray.activate()
        XCTAssertTrue(constraint1.isActive, "Each constraint should be activated")
        XCTAssertTrue(constraint2.isActive, "Active constraints should stay activated")
        XCTAssertTrue(constraint3.isActive, "Each constraint should be activated")
    }

    func testActivationOfConstraintSet() {
        constraintSet.activate()
        XCTAssertTrue(constraint1.isActive, "Each constraint should be activated")
        XCTAssertTrue(constraint2.isActive, "Active constraints should stay activated")
        XCTAssertTrue(constraint3.isActive, "Each constraint should be activated")
    }

    func testDeactivationOfConstraintArrayLiteral() {
        constraint1.isActive = true
        [constraint1, constraint2, constraint3].deactivate()
        XCTAssertFalse(constraint1.isActive, "Each constraint should be deactivated")
        XCTAssertFalse(constraint2.isActive, "Each constraint should be deactivated")
        XCTAssertFalse(constraint3.isActive, "Inactive constraints should stay inactive")
    }

    func testDeactivationOfConstraintArray() {
        constraint1.isActive = true
        constraintArray.deactivate()
        XCTAssertFalse(constraint1.isActive, "Each constraint should be deactivated")
        XCTAssertFalse(constraint2.isActive, "Each constraint should be deactivated")
        XCTAssertFalse(constraint3.isActive, "Inactive constraints should stay inactive")
    }

    func testDeactivationOfConstraintSet() {
        constraint1.isActive = true
        constraintSet.deactivate()
        XCTAssertFalse(constraint1.isActive, "Each constraint should be deactivated")
        XCTAssertFalse(constraint2.isActive, "Each constraint should be deactivated")
        XCTAssertFalse(constraint3.isActive, "Inactive constraints should stay inactive")
    }

}
