//
//  AttributedItemTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class AttributedItemTests: XCTestCase {

    let controller = UIViewController()
    let view = UIView()
    var attributedItem: AutoLayoutAttributedItem!

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testViewAttributedItem() {
        attributedItem = AutoLayoutAttributedItem(view, .Leading)
        XCTAssertEqual(attributedItem.item as UIView, view, "The item's attributable item should be the view")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Leading, "The provided attribute should be the attribute")
    }

    func testViewControllerLayoutGuideItem() {
        attributedItem = AutoLayoutAttributedItem(controller.topLayoutGuide, .Bottom)
        XCTAssertTrue(attributedItem.item === controller.topLayoutGuide, "The item's attributable item should be the view controller's top layout guide")
        XCTAssertEqual(attributedItem.attribute, NSLayoutAttribute.Bottom, "The provided attribute should be the attribute")
    }

}
