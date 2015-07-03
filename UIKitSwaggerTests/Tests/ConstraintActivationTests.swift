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

    override func setUp() {
        super.setUp()

        let window = UIApplication.sharedApplication().delegate!.window!
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
