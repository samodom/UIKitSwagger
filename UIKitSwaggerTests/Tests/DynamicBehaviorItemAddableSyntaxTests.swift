//
//  DynamicBehaviorItemAddableSyntaxTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/14/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class DynamicBehaviorItemAddableSyntaxTests: XCTestCase {

    let itemBehavior = UIDynamicItemBehavior()
    let dynamicItem1 = UIView()
    let dynamicItem2 = UIView()
    let dynamicItem3 = UIView()

    override func setUp() {
        super.setUp()
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
    
}
