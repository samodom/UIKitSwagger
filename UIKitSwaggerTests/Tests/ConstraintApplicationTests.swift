//
//  ConstraintApplicationTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/26/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class ConstraintApplicationTests: XCTestCase {

    var viewController: UIViewController!
    var view: UIView!
    let child1 = UIView()
    let child2 = UIView()
    let grandchild1 = UIView()
    let grandchild2 = UIView()
    let unrelatedView = UIView()

    override func setUp() {
        super.setUp()

        var window = UIApplication.sharedApplication().delegate!.window!
        viewController = window!.rootViewController
        viewController.loadView()
        view = viewController.view
        child1.addSubview(grandchild1)
        child2.addSubview(grandchild2)
        view.addSubview(child1)
        view.addSubview(child2)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testApplyingConstantConstraintToView() {
        let constraint = child1.height =* 14.42
        constraint.apply()
        XCTAssertTrue(contains(child1.constraints() as [Constraint], constraint), "The specified constraint should be added to the view")
    }

    func testApplyingReflexiveConstraintToView() {
        let constraint = child2.height =* child2.width
        constraint.apply()
        XCTAssertTrue(contains(child2.constraints() as [Constraint], constraint), "The specified constraint should be added to the view")
    }

    func testApplyingConstraintBetweenParentAndChildViews() {
        let constraint = child1.centerX =* view.centerX
        constraint.apply()
        XCTAssertTrue(contains(view.constraints() as [Constraint], constraint), "The specified constraint should be added to the parent view")
    }

    func testApplyingConstraintBetweenParentAndGrandchildViews() {
        let constraint = grandchild1.centerX =* view.centerX
        constraint.apply()
        XCTAssertTrue(contains(view.constraints() as [Constraint], constraint), "The specified constraint should be added to the grandparent view")
    }

    func testAppylyingConstraintBetweenSiblingViews() {
        let constraint = child1.left =* child2.right + 15
        constraint.apply()
        XCTAssertTrue(contains(view.constraints() as [Constraint], constraint), "The specified constraint should be added to the parent view")
    }

    func testApplyingConstraintBetweenCousinViews() {
        let constraint = grandchild1.left =* grandchild2.right + 15
        constraint.apply()
        XCTAssertTrue(contains(view.constraints() as [Constraint], constraint), "The specified constraint should be added to the parent view")
    }

    func testNotApplyingConstraintBetweenUnrelatedViews() {
        let constraint = child1.centerX =* unrelatedView.left
        constraint.apply()
        XCTAssertFalse(contains(view.constraints() as [Constraint], constraint), "The specified constraint should not be added to any view")
        XCTAssertFalse(contains(child1.constraints() as [Constraint], constraint), "The specified constraint should not be added to any view")
        XCTAssertFalse(contains(unrelatedView.constraints() as [Constraint], constraint), "The specified constraint should not be added to any view")
    }

    func testApplyingConstraintToLayoutSupportFirstItem() {
        let constraint = viewController.top =* child2.top - 10
        constraint.apply()
        XCTAssertTrue(contains(view.constraints() as [Constraint], constraint), "A constraint involving a view controller guide should be added to the view controller's view")
    }

    func testApplyingConstraintToLayoutSupportSecondItem() {
        let constraint = child1.top =* viewController.top + 10
        constraint.apply()
        XCTAssertTrue(contains(view.constraints() as [Constraint], constraint), "A constraint involving a view controller guide should be added to the view controller's view")
    }

}
