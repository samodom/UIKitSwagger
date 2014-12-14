//
//  DynamicItemBehaviorSyntaxTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/14/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class DynamicItemBehaviorSyntaxTests: XCTestCase {

    let animator = UIDynamicAnimator()
    let itemBehavior = UIDynamicItemBehavior()
    var dynamicItem1: UIView!
    var dynamicItem2: UIView!
    var dynamicItem3: UIView!

    override func setUp() {
        super.setUp()

        dynamicItem1 = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        dynamicItem2 = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        dynamicItem3 = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 10))
        animator.addBehavior(itemBehavior)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testAddingDynamicItemWithOperator() {
        itemBehavior += dynamicItem1
        XCTAssertEqual(itemBehavior.items as [UIView], [dynamicItem1], "The item should be added to the item behavior")
    }

    func testAddingDynamicItemArrayWithOperator() {
        itemBehavior += [dynamicItem1, dynamicItem2, dynamicItem3]
        XCTAssertEqual(itemBehavior.items as [UIView], [dynamicItem1, dynamicItem2, dynamicItem3], "The items should be added to the item behavior in the order provided")
    }

    func testRemovingDynamicItemWithOperator() {
        itemBehavior.addItem(dynamicItem1)
        itemBehavior.addItem(dynamicItem2)
        itemBehavior.addItem(dynamicItem3)
        itemBehavior -= dynamicItem2
        XCTAssertEqual(itemBehavior.items as [UIView], [dynamicItem1, dynamicItem3], "The item should be removed from the item behavior")
    }

    func testRemovingDynamicItemArrayWithOperator() {
        itemBehavior.addItem(dynamicItem1)
        itemBehavior.addItem(dynamicItem2)
        itemBehavior.addItem(dynamicItem3)
        itemBehavior -= [dynamicItem1, dynamicItem3]
        XCTAssertEqual(itemBehavior.items as [UIView], [dynamicItem2], "The items should be removed from the item behavior")
    }

    func testSettingAngularVelocityOfDynamicItemWithOperator() {
        itemBehavior.addItem(dynamicItem1)
        itemBehavior <+ (dynamicItem1, 0.1)
        XCTAssertEqualWithAccuracy(itemBehavior.angularVelocityForItem(dynamicItem1), CGFloat(0.1), 1e-8, "The `<+` operator should add angular velocity to the provided dynamic item using the specified value in radians per second")
        itemBehavior <+ (dynamicItem1, -0.2)
        XCTAssertEqualWithAccuracy(itemBehavior.angularVelocityForItem(dynamicItem1), CGFloat(-0.1), 1e-8, "The `<+` operator should add angular velocity to the provided dynamic item using the specified value in radians per second")
    }

    func testGettingAngularVelocityOfDynamicItemWithOperator() {
        itemBehavior.addItem(dynamicItem1)
        itemBehavior.addAngularVelocity(0.1, forItem: dynamicItem1)
        let velocity = itemBehavior <? dynamicItem1
        XCTAssertEqualWithAccuracy(velocity, CGFloat(0.1), 1e-8, "The `<?` operator should return the angular velocity of the specified dynamic item")
    }

    func testSettingLinearVelocityOfDynamicItemWithOperator() {
        itemBehavior.addItem(dynamicItem2)
        let velocity1 = CGPoint(x: 1.5, y: -2.4)
        itemBehavior -+ (dynamicItem2, velocity1)
        var newVelocity = itemBehavior.linearVelocityForItem(dynamicItem2)
        XCTAssertEqualWithAccuracy(newVelocity.x, velocity1.x, 1e-7, "The `-+` operator should add linear velocity to the provided dynamic item using the specified value in points per second")
        XCTAssertEqualWithAccuracy(newVelocity.y, velocity1.y, 1e-7, "The `-+` operator should add linear velocity to the provided dynamic item using the specified value in points per second")

        let velocity2 = CGPoint(x: -1.1, y: 1.1)
        let expected = CGPoint(x: velocity1.x + velocity2.x, y: velocity1.y + velocity2.y)
        itemBehavior -+ (dynamicItem2, velocity2)
        newVelocity = itemBehavior.linearVelocityForItem(dynamicItem2)
        XCTAssertEqualWithAccuracy(newVelocity.x, expected.x, 1e-7, "The `-+` operator should add linear velocity to the provided dynamic item using the specified value in points per second")
        XCTAssertEqualWithAccuracy(newVelocity.y, expected.y, 1e-7, "The `-+` operator should add linear velocity to the provided dynamic item using the specified value in points per second")
    }

    func testGettingLinearVelocityOfDynamicItemWithOperator() {
        itemBehavior.addItem(dynamicItem2)
        let velocityToAdd = CGPoint(x: 1.1, y: -2.2)
        itemBehavior.addLinearVelocity(velocityToAdd, forItem: dynamicItem2)
        let velocity = itemBehavior -? dynamicItem2
        XCTAssertEqualWithAccuracy(velocity.x, velocityToAdd.x, 1e-7, "The `-?` operator should return the linear velocity of the specified dynamic item")
        XCTAssertEqualWithAccuracy(velocity.y, velocityToAdd.y, 1e-7, "The `-?` operator should return the linear velocity of the specified dynamic item")
    }

}
