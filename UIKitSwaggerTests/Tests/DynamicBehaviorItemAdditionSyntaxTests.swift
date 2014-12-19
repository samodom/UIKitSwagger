//
//  DynamicBehaviorItemAdditionSyntaxTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/14/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class DynamicBehaviorItemAdditionSyntaxTests: XCTestCase {

    let animator = UIDynamicAnimator()
    let itemBehavior = UIDynamicItemBehavior()
    let gravityBehavior = UIGravityBehavior()
    let collisionBehavior = UICollisionBehavior()
    let pushBehavior = UIPushBehavior()
    var dynamicItem1: UIView!
    var dynamicItem2: UIView!
    var dynamicItem3: UIView!

    override func setUp() {
        super.setUp()

        dynamicItem1 = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        dynamicItem2 = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        dynamicItem3 = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 10))
        animator.addBehavior(itemBehavior)
        animator.addBehavior(gravityBehavior)
        animator.addBehavior(collisionBehavior)
        animator.addBehavior(pushBehavior)
    }

    override func tearDown() {
        super.tearDown()
    }

    //  MARK: UIDynamicItemBehavior

    func testAddingDynamicItemToItemBehavior() {
        itemBehavior += dynamicItem1
        XCTAssertEqual(itemBehavior.items as [UIView], [dynamicItem1], "The item should be added to the item behavior")
    }

    func testAddingDynamicItemArrayToItemBehavior() {
        itemBehavior += [dynamicItem1, dynamicItem2, dynamicItem3]
        XCTAssertEqual(itemBehavior.items as [UIView], [dynamicItem1, dynamicItem2, dynamicItem3], "The items should be added to the item behavior in the order provided")
    }

    func testRemovingDynamicItemFromItemBehavior() {
        itemBehavior.addItem(dynamicItem1)
        itemBehavior.addItem(dynamicItem2)
        itemBehavior.addItem(dynamicItem3)
        itemBehavior -= dynamicItem2
        XCTAssertEqual(itemBehavior.items as [UIView], [dynamicItem1, dynamicItem3], "The item should be removed from the item behavior")
    }

    func testRemovingDynamicItemArrayFromItemBehavior() {
        itemBehavior.addItem(dynamicItem1)
        itemBehavior.addItem(dynamicItem2)
        itemBehavior.addItem(dynamicItem3)
        itemBehavior -= [dynamicItem1, dynamicItem3]
        XCTAssertEqual(itemBehavior.items as [UIView], [dynamicItem2], "The items should be removed from the item behavior")
    }

    //  MARK:  UIGravityBehavior

    func testAddingDynamicItemToGravityBehavior() {
        gravityBehavior += dynamicItem1
        XCTAssertEqual(gravityBehavior.items as [UIView], [dynamicItem1], "The item should be added to the gravity behavior")
    }

    func testAddingDynamicItemArrayToGravityBehavior() {
        gravityBehavior += [dynamicItem1, dynamicItem2, dynamicItem3]
        XCTAssertEqual(gravityBehavior.items as [UIView], [dynamicItem1, dynamicItem2, dynamicItem3], "The items should be added to the gravity behavior in the order provided")
    }

    func testRemovingDynamicItemFromGravityBehavior() {
        gravityBehavior.addItem(dynamicItem1)
        gravityBehavior.addItem(dynamicItem2)
        gravityBehavior.addItem(dynamicItem3)
        gravityBehavior -= dynamicItem2
        XCTAssertEqual(gravityBehavior.items as [UIView], [dynamicItem1, dynamicItem3], "The item should be removed from the gravity behavior")
    }

    func testRemovingDynamicItemArrayFromGravityBehavior() {
        gravityBehavior.addItem(dynamicItem1)
        gravityBehavior.addItem(dynamicItem2)
        gravityBehavior.addItem(dynamicItem3)
        gravityBehavior -= [dynamicItem1, dynamicItem3]
        XCTAssertEqual(gravityBehavior.items as [UIView], [dynamicItem2], "The items should be removed from the gravity behavior")
    }

    //  MARK: UICollisionBehavior

    func testAddingDynamicItemToCollisionBehavior() {
        collisionBehavior += dynamicItem1
        XCTAssertEqual(collisionBehavior.items as [UIView], [dynamicItem1], "The item should be added to the collision behavior")
    }

    func testAddingDynamicItemArrayToCollisionBehavior() {
        collisionBehavior += [dynamicItem1, dynamicItem2, dynamicItem3]
        XCTAssertEqual(collisionBehavior.items as [UIView], [dynamicItem1, dynamicItem2, dynamicItem3], "The items should be added to the collision behavior in the order provided")
    }

    func testRemovingDynamicItemFromCollisionBehavior() {
        collisionBehavior.addItem(dynamicItem1)
        collisionBehavior.addItem(dynamicItem2)
        collisionBehavior.addItem(dynamicItem3)
        collisionBehavior -= dynamicItem2
        XCTAssertEqual(collisionBehavior.items as [UIView], [dynamicItem1, dynamicItem3], "The item should be removed from the collision behavior")
    }

    func testRemovingDynamicItemArrayFromCollisionBehavior() {
        collisionBehavior.addItem(dynamicItem1)
        collisionBehavior.addItem(dynamicItem2)
        collisionBehavior.addItem(dynamicItem3)
        collisionBehavior -= [dynamicItem1, dynamicItem3]
        XCTAssertEqual(collisionBehavior.items as [UIView], [dynamicItem2], "The items should be removed from the collision behavior")
    }

    //  MARK: UIPushBehavior

    func testAddingDynamicItemToPushBehavior() {
        pushBehavior += dynamicItem1
        XCTAssertEqual(pushBehavior.items as [UIView], [dynamicItem1], "The item should be added to the push behavior")
    }

    func testAddingDynamicItemArrayToPushBehavior() {
        pushBehavior += [dynamicItem1, dynamicItem2, dynamicItem3]
        XCTAssertEqual(pushBehavior.items as [UIView], [dynamicItem1, dynamicItem2, dynamicItem3], "The items should be added to the push behavior in the order provided")
    }

    func testRemovingDynamicItemFromPushBehavior() {
        pushBehavior.addItem(dynamicItem1)
        pushBehavior.addItem(dynamicItem2)
        pushBehavior.addItem(dynamicItem3)
        pushBehavior -= dynamicItem2
        XCTAssertEqual(pushBehavior.items as [UIView], [dynamicItem1, dynamicItem3], "The item should be removed from the push behavior")
    }

    func testRemovingDynamicItemArrayFromPushBehavior() {
        pushBehavior.addItem(dynamicItem1)
        pushBehavior.addItem(dynamicItem2)
        pushBehavior.addItem(dynamicItem3)
        pushBehavior -= [dynamicItem1, dynamicItem3]
        XCTAssertEqual(pushBehavior.items as [UIView], [dynamicItem2], "The items should be removed from the push behavior")
    }

}
