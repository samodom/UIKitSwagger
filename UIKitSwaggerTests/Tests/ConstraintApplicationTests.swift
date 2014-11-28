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

    var child1ToGrandchild1: Constraint!
    var viewToGrandchild2: Constraint!
    var child1ToController: Constraint!

    override func setUp() {
        super.setUp()

        let window = UIApplication.sharedApplication().delegate!.window!
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

    func testRemovingConstraintFromView() {
        let constraint = child1.height =* 14.42
        constraint.apply()
        XCTAssertTrue(contains(child1.constraints() as [Constraint], constraint), "Just making sure the constraint has been added")
        constraint.remove()
        XCTAssertFalse(contains(child1.constraints() as [Constraint], constraint), "The constraint should be removed")
    }

    //  MARK: Convenience functions for application/removal

    private func createSampleConstraints() {
        child1ToGrandchild1 = child1.centerX =* grandchild1.centerX
        viewToGrandchild2 = grandchild2.right =* view.rightMargin - 5
        child1ToController = child1.top =* viewController.top
    }

    func testApplyingSingleConstraint() {
        createSampleConstraints()
        ApplyConstraints(child1ToGrandchild1)
        XCTAssertTrue(contains(child1.constraints() as [Constraint], child1ToGrandchild1), "The single constraint should be applied where appropriate")
    }

    func testApplyingMultipleConstraints() {
        createSampleConstraints()
        ApplyConstraints(child1ToGrandchild1, viewToGrandchild2, child1ToController)
        XCTAssertTrue(contains(child1.constraints() as [Constraint], child1ToGrandchild1), "Each constraint should be applied where appropriate")
        XCTAssertTrue(contains(view.constraints() as [Constraint], viewToGrandchild2), "Each constraint should be applied where appropriate")
        XCTAssertTrue(contains(view.constraints() as [Constraint], child1ToController), "Each constraint should be applied where appropriate")
    }

    func testApplyingConstraintArray() {
        createSampleConstraints()
        ApplyConstraints([child1ToGrandchild1, viewToGrandchild2, child1ToController])
        XCTAssertTrue(contains(child1.constraints() as [Constraint], child1ToGrandchild1), "Each constraint should be applied where appropriate")
        XCTAssertTrue(contains(view.constraints() as [Constraint], viewToGrandchild2), "Each constraint should be applied where appropriate")
        XCTAssertTrue(contains(view.constraints() as [Constraint], child1ToController), "Each constraint should be applied where appropriate")
    }

    func testRemovingSingleConstraint() {
        createSampleConstraints()
        child1ToGrandchild1.apply()

        RemoveConstraints(child1ToGrandchild1)
        XCTAssertFalse(contains(child1.constraints() as [Constraint], child1ToGrandchild1), "The single constraint should be removed")
    }

    func testRemovingMultipleConstraints() {
        createSampleConstraints()
        child1ToGrandchild1.apply()
        viewToGrandchild2.apply()
        child1ToController.apply()

        RemoveConstraints(child1ToGrandchild1, viewToGrandchild2, child1ToController)
        XCTAssertFalse(contains(child1.constraints() as [Constraint], child1ToGrandchild1), "Each constraint should be removed")
        XCTAssertFalse(contains(view.constraints() as [Constraint], viewToGrandchild2), "Each constraint should be removed")
        XCTAssertFalse(contains(view.constraints() as [Constraint], child1ToController), "Each constraint should be removed")
    }

    func testRemovingConstraintArray() {
        createSampleConstraints()
        child1ToGrandchild1.apply()
        viewToGrandchild2.apply()
        child1ToController.apply()

        RemoveConstraints([child1ToGrandchild1, viewToGrandchild2, child1ToController])
        XCTAssertFalse(contains(child1.constraints() as [Constraint], child1ToGrandchild1), "Each constraint should be removed")
        XCTAssertFalse(contains(view.constraints() as [Constraint], viewToGrandchild2), "Each constraint should be removed")
        XCTAssertFalse(contains(view.constraints() as [Constraint], child1ToController), "Each constraint should be removed")
    }
    
}
