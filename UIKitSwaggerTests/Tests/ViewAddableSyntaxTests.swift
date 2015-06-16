//
//  ViewAddableSyntaxTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/5/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class ViewAddableSyntaxTests: XCTestCase {

    let view = UIView()
    var subview1 = UIView()
    var subview2 = UIView()
    var constraint1: Constraint!
    var constraint2: Constraint!
    var effect1 = UIInterpolatingMotionEffect()
    var effect2 = UIInterpolatingMotionEffect()
    var recognizer1 = UIGestureRecognizer()
    var recognizer2 = UIGestureRecognizer()

    override func setUp() {
        super.setUp()

        constraint1 = subview1.centerY =* subview2.centerY
        constraint2 = subview1.centerX =* view.centerX
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testAddingSubviewWithOperator() {
        view += subview1
        XCTAssertEqual(subview1.superview!, view, "The supplied subview operand should be added to the view")
    }

    func testAddingSubviewArrayWithOperator() {
        view += [subview1, subview2]
        XCTAssertEqual(subview1.superview!, view, "Each supplied subview should be added to the view")
        XCTAssertEqual(subview2.superview!, view, "Each supplied subview should be added to the view")
    }

    func testAddingConstraintWithOperator() {
        view.addSubview(subview1)
        view.addSubview(subview2)
        view += constraint1
        XCTAssertTrue(view.constraints.contains(constraint1), "The supplied constraint operand should be added to the view")
    }

    func testAddingConstraintArrayWithOperator() {
        view.addSubview(subview1)
        view.addSubview(subview2)
        view += [constraint1, constraint2]
        XCTAssertTrue(view.constraints.contains(constraint1), "Each supplied constraint should be added to the view")
        XCTAssertTrue(view.constraints.contains(constraint2), "Each supplied constraint should be added to the view")
    }

    func testAddingMotionEffectWithOperator() {
        subview1 += effect1
        XCTAssertTrue(subview1.motionEffects.contains(effect1), "The supplied motion effect operand should be added to the view")
    }

    func testAddingMotionEffectArrayWithOperator() {
        subview1 += [effect1, effect2]
        XCTAssertTrue(subview1.motionEffects.contains(effect1), "Each supplied motion effect should be added to the view")
        XCTAssertTrue(subview1.motionEffects.contains(effect2), "Each supplied motion effect should be added to the view")
    }

    func testAddingGestureRecognizerWithOperator() {
        view += recognizer1
        XCTAssertTrue(view.gestureRecognizers!.contains(recognizer1), "The supplied gesture recognizer operand should be added to the view")
    }

    func testAddingGestureRecognizerArrayWithOperator() {
        view += [recognizer1, recognizer2]
        XCTAssertTrue(view.gestureRecognizers!.contains(recognizer1), "Each supplied gesture recognizer should be added to the view")
        XCTAssertTrue(view.gestureRecognizers!.contains(recognizer2), "Each supplied gesture recognizer should be added to the view")
    }

    func testAddingMixOfAddablesWithOperator() {
        let addables = [effect1, recognizer2, subview1, constraint2, effect2, constraint1, subview2, recognizer1] as [UIViewAddable]
        view += addables
        XCTAssertEqual(subview1.superview!, view, "Each supplied subview should be added to the view")
        XCTAssertEqual(subview2.superview!, view, "Each supplied subview should be added to the view")
        XCTAssertTrue(view.constraints.contains(constraint1), "Each supplied constraint should be added to the view")
        XCTAssertTrue(view.constraints.contains(constraint2), "Each supplied constraint should be added to the view")
        XCTAssertTrue(view.motionEffects.contains(effect1), "Each supplied motion effect should be added to the view")
        XCTAssertTrue(view.motionEffects.contains(effect2), "Each supplied motion effect should be added to the view")
        XCTAssertTrue(view.gestureRecognizers!.contains(recognizer1), "Each supplied gesture recognizer should be added to the view")
        XCTAssertTrue(view.gestureRecognizers!.contains(recognizer2), "Each supplied gesture recognizer should be added to the view")
    }

    func testRemovingSubviewWithOperator() {
        view.addSubview(subview1)
        view -= subview1
        XCTAssertNil(subview1.superview, "The supplied subview operand should be removed from the view")
    }

    func testRemovingSubviewArrayWithOperator() {
        view.addSubview(subview1)
        view.addSubview(subview2)
        view -= [subview1, subview2]
        XCTAssertNil(subview1.superview, "Each supplied subview should be removed from the view")
        XCTAssertNil(subview2.superview, "Each supplied subview should be removed from the view")
    }

     func testRemovingConstraintWithOperator() {
        view.addSubview(subview1)
        view.addSubview(subview2)
        view.addConstraint(constraint1)
        view -= constraint1
        XCTAssertFalse(view.constraints.contains(constraint1), "The supplied constraint operand should be removed from the view")
    }

    func testRemovingConstraintArrayWithOperator() {
        view.addSubview(subview1)
        view.addSubview(subview2)
        view.addConstraint(constraint1)
        view.addConstraint(constraint2)
        view -= [constraint1, constraint2]
        XCTAssertFalse(view.constraints.contains(constraint1), "Each supplied constraint should be removed from the view")
        XCTAssertFalse(view.constraints.contains(constraint2), "Each supplied constraint should be removed from the view")
    }

    func testRemovingMotionEffectWithOperator() {
        subview1.addMotionEffect(effect1)
        subview1 -= effect1
        XCTAssertFalse(subview1.motionEffects.contains(effect1), "The supplied motion effect operand should be removed from the view")
    }

    func testRemovingMotionEffectArrayWithOperator() {
        subview1.addMotionEffect(effect1)
        subview1.addMotionEffect(effect2)
        subview1 -= [effect1, effect2]
        XCTAssertFalse(subview1.motionEffects.contains(effect1), "Each supplied motion effect should be removed from the view")
        XCTAssertFalse(subview1.motionEffects.contains(effect2), "Each supplied motion effect should be removed from the view")
    }

    func testRemovingGestureRecognizerWithOperator() {
        view.addGestureRecognizer(recognizer1)
        view -= recognizer1
        XCTAssertFalse(view.gestureRecognizers!.contains(recognizer1), "The supplied gesture recognizer operand should be removed from the view")
    }

    func testRemovingGestureRecognizerArrayWithOperator() {
        view.addGestureRecognizer(recognizer1)
        view.addGestureRecognizer(recognizer2)
        view -= [recognizer1, recognizer2]
        XCTAssertFalse(view.gestureRecognizers!.contains(recognizer1), "Each supplied gesture recognizer should be removed from the view")
        XCTAssertFalse(view.gestureRecognizers!.contains(recognizer2), "Each supplied gesture recognizer should be removed from the view")
    }

    func testRemovingMixOfAddablesWithOperator() {
        let addables = [effect1, recognizer2, subview1, constraint2, effect2, constraint1, subview2, recognizer1] as [UIViewAddable]
        view += addables
        view -= addables
        XCTAssertNil(subview1.superview, "Each supplied subview should be removed from the view")
        XCTAssertNil(subview2.superview, "Each supplied subview should be removed from the view")
        XCTAssertFalse(view.constraints.contains(constraint1), "Each supplied constraint should be removed from the view")
        XCTAssertFalse(view.constraints.contains(constraint2), "Each supplied constraint should be removed from the view")
        XCTAssertEqual(view.motionEffects.count, 0, "Each supplied motion effect should be removed from the view")
        XCTAssertNil(view.gestureRecognizers, "Each supplied gesture recognizer should be removed from the view")
    }

}
