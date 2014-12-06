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

    func testAddingConstraintWithOperator() {
        view.addSubview(subview1)
        view.addSubview(subview2)
        view += constraint1
        let allConstraints = view.constraints() as [Constraint]
        XCTAssertTrue(contains(allConstraints, constraint1), "The supplied constraint operand should be added to the view")
    }

    func testAddingMotionEffectWithOperator() {
        subview1 += effect1
        let allEffects = subview1.motionEffects as [UIMotionEffect]!
        XCTAssertTrue(contains(allEffects, effect1), "The supplied motion effect operand should be added to the view")
    }

    func testAddingGestureRecognizerWithOperator() {
        view += recognizer1
        let allRecognizers = view.gestureRecognizers as [UIGestureRecognizer]!
        XCTAssertTrue(contains(allRecognizers, recognizer1), "The supplied gesture recognizer operand should be added to the view")
    }

    func testRemovingSubviewWithOperator() {
        view.addSubview(subview1)
        view -= subview1
        XCTAssertNil(subview1.superview, "The supplied subview operand should be removed from the view")
    }

    func testRemovingConstraintWithOperator() {
        view.addSubview(subview1)
        view.addSubview(subview2)
        view.addConstraint(constraint1)
        view -= constraint1
        let allConstraints = view.constraints() as [Constraint]
        XCTAssertFalse(contains(allConstraints, constraint1), "The supplied constraint operand should be removed from the view")
    }

    func testRemovingMotionEffectWithOperator() {
        subview1.addMotionEffect(effect1)
        subview1 -= effect1
        let allEffects = subview1.motionEffects as [UIMotionEffect]!
        XCTAssertFalse(contains(allEffects, effect1), "The supplied motion effect operand should be removed from the view")
    }

    func testRemovingGestureRecognizerWithOperator() {
        view.addGestureRecognizer(recognizer1)
        view -= recognizer1
        let allRecognizers = view.gestureRecognizers as [UIGestureRecognizer]!
        XCTAssertFalse(contains(allRecognizers, recognizer1), "The supplied gesture recognizer operand should be removed from the view")
    }

}
