//
//  DynamicBehaviorAdditionSyntaxTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/14/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest
import UIKitSwagger

class DynamicBehaviorAdditionSyntaxTests: XCTestCase {

    let parentBehavior = UIDynamicBehavior()
    let behavior1 = UIDynamicBehavior()
    let behavior2 = UIDynamicBehavior()
    let behavior3 = UIDynamicBehavior()

    func testAddingDynamicBehaviorWithOperator() {
        parentBehavior += behavior1
        XCTAssertEqual(parentBehavior.childBehaviors, [behavior1], "The behavior should be added to the parent behavior")
    }

    func testAddingDynamicBehaviorArrayWithOperator() {
        parentBehavior += [behavior1, behavior2, behavior3]
        XCTAssertEqual(parentBehavior.childBehaviors, [behavior1, behavior2, behavior3], "The behaviors should be added to the parent behavior in the order provided")
    }

    func testRemovingDynamicBehaviorWithOperator() {
        parentBehavior.addChildBehavior(behavior1)
        parentBehavior.addChildBehavior(behavior2)
        parentBehavior.addChildBehavior(behavior3)
        parentBehavior -= behavior2
        XCTAssertEqual(parentBehavior.childBehaviors, [behavior1, behavior3], "The behavior should be removed from the parent behavior")
    }

    func testRemovingDynamicBehaviorArrayWithOperator() {
        parentBehavior.addChildBehavior(behavior1)
        parentBehavior.addChildBehavior(behavior2)
        parentBehavior.addChildBehavior(behavior3)
        parentBehavior -= [behavior1, behavior3]
        XCTAssertEqual(parentBehavior.childBehaviors, [behavior2], "The behaviors should be removed from the parent behavior")
    }
    
}
