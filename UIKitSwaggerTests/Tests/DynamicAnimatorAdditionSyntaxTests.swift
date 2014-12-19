//
//  DynamicAnimatorAdditionSyntaxTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/14/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class DynamicAnimatorAdditionSyntaxTests: XCTestCase {

    let animator = UIDynamicAnimator()
    let behavior1 = UIDynamicBehavior()
    let behavior2 = UIDynamicBehavior()
    let behavior3 = UIDynamicBehavior()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testAddingDynamicBehaviorWithOperator() {
        animator += behavior1
        XCTAssertEqual(animator.behaviors as [UIDynamicBehavior], [behavior1], "The behavior should be added to the animator")
    }

    func testAddingDynamicBehaviorArrayWithOperator() {
        animator += [behavior1, behavior2, behavior3]
        XCTAssertEqual(animator.behaviors as [UIDynamicBehavior], [behavior1, behavior2, behavior3], "The behaviors should be added to the animator in the order provided")
    }

    func testRemovingDynamicBehaviorWithOperator() {
        animator.addBehavior(behavior1)
        animator.addBehavior(behavior2)
        animator.addBehavior(behavior3)
        animator -= behavior2
        XCTAssertEqual(animator.behaviors as [UIDynamicBehavior], [behavior1, behavior3], "The behavior should be removed from the animator")
    }

    func testRemovingDynamicBehaviorArrayWithOperator() {
        animator.addBehavior(behavior1)
        animator.addBehavior(behavior2)
        animator.addBehavior(behavior3)
        animator -= [behavior1, behavior3]
        XCTAssertEqual(animator.behaviors as [UIDynamicBehavior], [behavior2], "The behaviors should be removed from the animator")
    }

}
