//
//  ViewAddableSyntaxTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/5/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest
@testable import UIKitSwagger

class ViewAddableSyntaxTests: XCTestCase {

    let view = UIView()
    var subview1 = UIView()
    var subview2 = UIView()
    var guide1 = UILayoutGuide()
    var guide2 = UILayoutGuide()
    var constraint1: NSLayoutConstraint!
    var constraint2: NSLayoutConstraint!
    var effect1 = UIInterpolatingMotionEffect()
    var effect2 = UIInterpolatingMotionEffect()
    var recognizer1 = UIGestureRecognizer()
    var recognizer2 = UIGestureRecognizer()

    override func setUp() {
        super.setUp()

        constraint1 = subview1.centerY =* subview2.centerY
        constraint2 = guide2.centerXAnchor.constraintEqualToAnchor(guide1.centerXAnchor)
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

    func testAddingLayoutGuideWithOperator() {
        view += guide1
        XCTAssertEqual(guide1.owningView!, view, "The supplied layout guide operand should be added to the view")
    }

    func testAddingLayoutGuideArrayWithOperator() {
        view += [guide1, guide2]
        XCTAssertEqual(guide1.owningView!, view, "Each supplied layout guide should be added to the view")
        XCTAssertEqual(guide2.owningView!, view, "Each supplied layout guide should be added to the view")
    }

    func testAddingConstraintWithOperator() {
        view.addSubview(subview1)
        view.addSubview(subview2)
        view += constraint1
        XCTAssertEqual(view.constraints, [constraint1], "The supplied constraint operand should be added to the view")
    }

    func testAddingConstraintArrayWithOperator() {
        view.addSubview(subview1)
        view.addSubview(subview2)
        view += [constraint1, constraint2]
        XCTAssertEqual(view.constraints, [constraint1, constraint2], "Each supplied constraint should be added to the view")
    }

    func testAddingMotionEffectWithOperator() {
        subview1 += effect1
        XCTAssertEqual(subview1.motionEffects, [effect1], "The supplied motion effect operand should be added to the view")
    }

    func testAddingMotionEffectArrayWithOperator() {
        subview1 += [effect1, effect2]
        XCTAssertTrue(subview1.motionEffects.contains(effect1), "Each supplied motion effect should be added to the view")
        XCTAssertTrue(subview1.motionEffects.contains(effect2), "Each supplied motion effect should be added to the view")
    }

    func testAddingGestureRecognizerWithOperator() {
        view += recognizer1
        XCTAssertEqual(view.gestureRecognizers!, [recognizer1], "The supplied gesture recognizer operand should be added to the view")
    }

    func testAddingGestureRecognizerArrayWithOperator() {
        view += [recognizer1, recognizer2]
        XCTAssertTrue(view.gestureRecognizers!.contains(recognizer1), "Each supplied gesture recognizer should be added to the view")
        XCTAssertTrue(view.gestureRecognizers!.contains(recognizer2), "Each supplied gesture recognizer should be added to the view")
    }

    func testAddingMixOfAddablesWithOperator() {
        view += [effect1, recognizer2, subview1, guide2, constraint2, effect2, constraint1, subview2, recognizer1, guide1]
        XCTAssertEqual(subview1.superview!, view, "Each supplied subview should be added to the view")
        XCTAssertEqual(subview2.superview!, view, "Each supplied subview should be added to the view")
        XCTAssertEqual(guide1.owningView!, view, "Each supplied layout guide should be added to the view")
        XCTAssertEqual(guide2.owningView!, view, "Each supplied layout guide should be added to the view")
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

    func testRemovingLayoutGuideWithOperator() {
        view.addLayoutGuide(guide1)
        view -= guide1
        XCTAssertNil(guide1.owningView, "The supplied layout guide operand should be removed from the view")
    }

    func testRemovingLayoutGuideArrayWithOperator() {
        view.addLayoutGuide(guide1)
        view.addLayoutGuide(guide2)
        view -= [guide1, guide2]
        XCTAssertNil(guide1.owningView, "Each supplied layout guide should be removed from the view")
        XCTAssertNil(guide2.owningView, "Each supplied layout guide should be removed from the view")
    }

     func testRemovingConstraintWithOperator() {
        view.addSubview(subview1)
        view.addSubview(subview2)
        view.addConstraint(constraint1)
        view -= constraint1
        XCTAssertEqual(view.constraints.count, 0, "The supplied constraint operand should be removed from the view")
    }

    func testRemovingConstraintArrayWithOperator() {
        view.addSubview(subview1)
        view.addSubview(subview2)
        view.addLayoutGuide(guide1)
        view.addLayoutGuide(guide2)
        view.addConstraint(constraint1)
        view.addConstraint(constraint2)
        view -= [constraint1, constraint2]
        XCTAssertEqual(view.constraints.count, 0, "Each supplied constraint should be removed from the view")
    }

    func testRemovingMotionEffectWithOperator() {
        subview1.addMotionEffect(effect1)
        subview1 -= effect1
        XCTAssertEqual(subview1.motionEffects.count, 0, "The supplied motion effect operand should be removed from the view")
    }

    func testRemovingMotionEffectArrayWithOperator() {
        subview1.addMotionEffect(effect1)
        subview1.addMotionEffect(effect2)
        subview1 -= [effect1, effect2]
        XCTAssertEqual(subview1.motionEffects.count, 0, "Each supplied motion effect should be removed from the view")
    }

    func testRemovingGestureRecognizerWithOperator() {
        view.addGestureRecognizer(recognizer1)
        view -= recognizer1
        XCTAssertEqual(view.gestureRecognizers!.count, 0, "The supplied gesture recognizer operand should be removed from the view")
    }

    func testRemovingGestureRecognizerArrayWithOperator() {
        view.addGestureRecognizer(recognizer1)
        view.addGestureRecognizer(recognizer2)
        view -= [recognizer1, recognizer2]
        XCTAssertEqual(view.gestureRecognizers!.count, 0, "Each supplied gesture recognizer should be removed from the view")
    }

    func testRemovingMixOfAddablesWithOperator() {
        view += [effect1, recognizer2, subview1, guide2, constraint2, effect2, constraint1, subview2, recognizer1, guide1]
        view -= [effect1, recognizer2, subview1, guide2, constraint2, effect2, constraint1, subview2, recognizer1, guide1]
        XCTAssertNil(subview1.superview, "Each supplied subview should be removed from the view")
        XCTAssertNil(subview2.superview, "Each supplied subview should be removed from the view")
        XCTAssertNil(guide1.owningView, "Each supplied layout guide should be removed from the view")
        XCTAssertNil(guide2.owningView, "Each supplied layout guide should be removed from the view")
        XCTAssertEqual(view.constraints.count, 0, "Each supplied constraint should be removed from the view")
        XCTAssertEqual(view.motionEffects.count, 0, "Each supplied motion effect should be removed from the view")

        if let recognizerCount = view.gestureRecognizers?.count {
            XCTAssertEqual(recognizerCount, 0, "If there is still a recognizer array, it shouldn't have any contents")
        }
        else {
            XCTAssertNil(view.gestureRecognizers, "Each supplied gesture recognizer should be removed from the view")
        }
    }

}
