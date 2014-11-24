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

    let unusedView = UIView()
    let unusedAttribute = NSLayoutAttribute.RightMargin

    var constraint1: Constraint!
    var constraint2: Constraint!
    var constraint3: Constraint!
    var constraint4: Constraint!
    var constraint5: Constraint!
    var constraint6: Constraint!

    var constraints: [Constraint]?

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
        constraints = superview.constraintsForItem(subview)
        XCTAssertTrue(constraints != nil, "There should be an array of constraints returned")
        XCTAssertEqual(constraints!.count, 4, "All constraints with the subview as an item should be returned")
        XCTAssertTrue(contains(constraints!, constraint1), "The first constraint should be included")
        XCTAssertTrue(contains(constraints!, constraint2), "The second constraint should be included")
        XCTAssertTrue(contains(constraints!, constraint3), "The third constraint should be included")
        XCTAssertTrue(contains(constraints!, constraint6), "The sixth constraint should be included")
    }

    func testMissingConstraintsForItem() {
        constraints = superview.constraintsForItem(unusedView)
        XCTAssertTrue(constraints == nil, "There should be no constraints returned")
    }

    func testConstraintSearchByAttribute() {
        constraints = superview.constraintsForAttribute(.Leading)
        XCTAssertTrue(constraints != nil, "There should be an array of constraints returned")
        XCTAssertEqual(constraints!.count, 3, "All constraints with the leading attribute should be returned")
        XCTAssertTrue(contains(constraints!, constraint1), "The first constraint should be included")
        XCTAssertTrue(contains(constraints!, constraint3), "The third constraint should be included")
        XCTAssertTrue(contains(constraints!, constraint6), "The sixth constraint should be included")
    }

    func testMissingConstraintsForAttribute() {
        constraints = superview.constraintsForAttribute(unusedAttribute)
        XCTAssertTrue(constraints == nil, "There should be no constraints returned")
    }

    func testConstraintSearchByItemAndAttribute() {
        constraints = superview.constraintsForItem(subview, attribute: .CenterX)
        XCTAssertTrue(constraints != nil, "There should be an array of constraints returned")
        XCTAssertEqual(constraints!.count, 2, "All constraints with the subview as an item with center X attribute should be returned")
        XCTAssertTrue(contains(constraints!, constraint3), "The third constraint should be included")
        XCTAssertTrue(contains(constraints!, constraint6), "The sixth constraint should be included")
    }

    func testMissingConstraintsForItemAndAttribute() {
        constraints = superview.constraintsForItem(unusedView, attribute: unusedAttribute)
        XCTAssertTrue(constraints == nil, "There should be no constraints returned")
    }

    func testConstraintSearchByTwoItems() {
        constraints = superview.constraintsForItems(button, image)
        XCTAssertTrue(constraints != nil, "There should be an array of constraints returned")
        XCTAssertEqual(constraints!.count, 2, "All constraints with both the button and image as items should be returned")
        XCTAssertTrue(contains(constraints!, constraint4), "The fourth constraint should be included")
        XCTAssertTrue(contains(constraints!, constraint5), "The fifth constraint should be included")
    }

    func testMissingConstraintsForTwoItems() {
        constraints = superview.constraintsForItems(button, unusedView)
        XCTAssertTrue(constraints == nil, "There should be no constraints returned")
    }

    func testConstraintSearchByTwoItemsAndAttributes() {
        let imageCenterY = (image, .CenterY) as AttributedItem
        let buttonLeading = (button, .Top) as AttributedItem
        constraints = superview.constraintsForItems(imageCenterY, buttonLeading)
        XCTAssertTrue(constraints != nil, "There should be an array of constraints returned")
        XCTAssertEqual(constraints!.count, 1, "Only the constraint with the image's center Y attribute and the button's leading attribute should be returned")
        XCTAssertTrue(contains(constraints!, constraint4), "The fourth constraint is the expected result")
        constraints = superview.constraintsForItems(buttonLeading, imageCenterY)
        XCTAssertTrue(constraints != nil, "There should be an array of constraints returned")
        XCTAssertEqual(constraints!.count, 1, "Only the constraint with the image's center Y attribute and the button's leading attribute should be returned")
        XCTAssertTrue(contains(constraints!, constraint4), "The fourth constraint is the expected result")
    }

    func testMissingConstraintsForTwoItemsAndAttributes() {
        let imageCenterY = (image, .CenterY) as AttributedItem
        let unusedItemAndAttribute = (unusedView, unusedAttribute) as AttributedItem
        constraints = superview.constraintsForItems(imageCenterY, unusedItemAndAttribute)
        XCTAssertTrue(constraints == nil, "There should be no constraints returned")
    }

}
