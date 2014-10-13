//
//  ConstraintSearchTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 9/24/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import UIKit
import XCTest

class ConstraintSearchTests: XCTestCase {

    let superview = UIView()
    let subview = UIView()
    let button = UIButton()
    let image = UIImageView()
    let slider = UISlider()

    var constraint1: Constraint!
    var constraint2: Constraint!
    var constraint3: Constraint!
    var constraint4: Constraint!
    var constraint5: Constraint!
    var constraint6: Constraint!

    override func setUp() {
        super.setUp()

        setupConstraints()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func setupConstraints() {
        constraint1 = Constraint(item: subview, attribute: .Leading, relatedBy: .Equal, toItem: superview, attribute: .Leading, multiplier: 1.0, constant: 5.0)
        constraint2 = Constraint(item: superview, attribute: .Trailing, relatedBy: .Equal, toItem: subview, attribute: .Trailing, multiplier: 1.0, constant: 5.0)
        constraint3 = Constraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: subview, attribute: .CenterX, multiplier: 1.0, constant: -10.0)
        constraint4 = Constraint(item: image, attribute: .CenterY, relatedBy: .GreaterThanOrEqual, toItem: button, attribute: .Top, multiplier: 4.0, constant: 0.0)
        constraint5 = Constraint(item: button, attribute: .CenterX, relatedBy: .LessThanOrEqual, toItem: image, attribute: .CenterX, multiplier: 1.0, constant: 1.0)
        constraint6 = Constraint(item: subview, attribute: .CenterX, relatedBy: .Equal, toItem: slider, attribute: .Leading, multiplier: 3.0, constant: 3.4)

        superview.addConstraints([constraint1, constraint2, constraint3, constraint4, constraint5, constraint6])
    }

    func testConstraintSearchByItem() {
        let constraints = superview.constraintsForItem(subview)
        XCTAssertEqual(constraints.count, 4, "All constraints with the subview as an item should be returned")
        XCTAssertTrue(contains(constraints, constraint1), "The first constraint should be included")
        XCTAssertTrue(contains(constraints, constraint2), "The second constraint should be included")
        XCTAssertTrue(contains(constraints, constraint3), "The third constraint should be included")
        XCTAssertTrue(contains(constraints, constraint6), "The sixth constraint should be included")
    }

    func testConstraintSearchByAttribute() {
        let constraints = superview.constraintsForAttribute(.Leading)
        XCTAssertEqual(constraints.count, 3, "All constraints with the leading attribute should be returned")
        XCTAssertTrue(contains(constraints, constraint1), "The first constraint should be included")
        XCTAssertTrue(contains(constraints, constraint3), "The third constraint should be included")
        XCTAssertTrue(contains(constraints, constraint6), "The sixth constraint should be included")
    }

    func testConstraintSearchByItemAndAttribute() {
        let constraints = superview.constraintsForItem(subview, attribute: .CenterX)
        XCTAssertEqual(constraints.count, 2, "All constraints with the subview as an item with center X attribute should be returned")
        XCTAssertTrue(contains(constraints, constraint3), "The third constraint should be included")
        XCTAssertTrue(contains(constraints, constraint6), "The sixth constraint should be included")
    }

    func testConstraintSearchByTwoItems() {
        let constraints = superview.constraintsForItems((button, image))
        XCTAssertEqual(constraints.count, 2, "All constraints with both the button and image as items should be returned")
        XCTAssertTrue(contains(constraints, constraint4), "The fourth constraint should be included")
        XCTAssertTrue(contains(constraints, constraint5), "The fifth constraint should be included")
    }

    func testConstraintSearchByTwoItemsAndAttributes() {
        let imageCenterY = (image, .CenterY) as AttributedItem
        let buttonLeading = (button, .Top) as AttributedItem
        var constraints = superview.constraintsForItems(imageCenterY, buttonLeading)
        XCTAssertEqual(constraints.count, 1, "Only the constraint with the image's center Y attribute and the button's leading attribute should be returned")
        XCTAssertTrue(contains(constraints, constraint4), "The fourth constraint is the expected result")
        constraints = superview.constraintsForItems(buttonLeading, imageCenterY)
        XCTAssertEqual(constraints.count, 1, "Only the constraint with the image's center Y attribute and the button's leading attribute should be returned")
        XCTAssertTrue(contains(constraints, constraint4), "The fourth constraint is the expected result")
    }

}
