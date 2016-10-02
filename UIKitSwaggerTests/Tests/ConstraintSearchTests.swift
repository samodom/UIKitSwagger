//
//  ConstraintSearchTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 9/24/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import XCTest
import UIKitSwagger

class ConstraintSearchTests: XCTestCase {

    var controller: UIViewController!
    var superview: UIView!
    let subview = UIView()
    let button = UIButton()
    let image = UIImageView()
    let slider = UISlider()

    let unusedView = UIView()
    let unusedAttribute = NSLayoutAttribute.rightMargin

    var constraint1: NSLayoutConstraint!
    var constraint2: NSLayoutConstraint!
    var constraint3: NSLayoutConstraint!
    var constraint4: NSLayoutConstraint!
    var constraint5: NSLayoutConstraint!
    var constraint6: NSLayoutConstraint!

    var constraints: [NSLayoutConstraint]!

    override func setUp() {
        super.setUp()

        let window = UIApplication.shared.delegate!.window!
        controller = window!.rootViewController
        superview = controller.view
        subview.addSubview(button)
        subview.addSubview(image)
        subview.addSubview(slider)
        superview.addSubview(subview)
        setupConstraints()
    }
    
    override func tearDown() {
        subview.removeFromSuperview()
        constraints?.deactivate()

        super.tearDown()
    }

    func setupConstraints() {
        constraint1 = NSLayoutConstraint(
            item: subview,
            attribute: .leading,
            relatedBy: .equal,
            toItem: superview,
            attribute: .leading,
            multiplier: 1.0,
            constant: 5.0
        )
        constraint2 = NSLayoutConstraint(
            item: superview,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: subview,
            attribute: .trailing,
            multiplier: 1.0,
            constant: 5.0
        )
        constraint3 = NSLayoutConstraint(
            item: button,
            attribute: .leading,
            relatedBy: .equal,
            toItem: subview,
            attribute: .centerX,
            multiplier: 1.0,
            constant: -10.0
        )
        constraint4 = NSLayoutConstraint(
            item: image,
            attribute: .centerY,
            relatedBy: .greaterThanOrEqual,
            toItem: button,
            attribute: .top,
            multiplier: 4.0,
            constant: 0.0
        )
        constraint5 = NSLayoutConstraint(
            item: button,
            attribute: .centerX,
            relatedBy: .lessThanOrEqual,
            toItem: image,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 1.0
        )
        constraint6 = NSLayoutConstraint(
            item: subview,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: slider,
            attribute: .leading,
            multiplier: 3.0,
            constant: 3.4
        )

        [constraint1, constraint2, constraint3, constraint4, constraint5, constraint6].activate()
    }

    func testConstraintSearchByItem() {
        constraints = superview.constraintsForItem(subview)
        XCTAssertEqual(constraints!.count, 2, "All constraints with the subview as an item should be returned")
        XCTAssertTrue(constraints!.contains(constraint1), "The first constraint should be included")
        XCTAssertTrue(constraints!.contains(constraint2), "The second constraint should be included")

        constraints = subview.constraintsForItem(subview)
        XCTAssertEqual(constraints!.count, 2, "All constraints with the subview as an item should be returned")
        XCTAssertTrue(constraints!.contains(constraint3), "The third constraint should be included")
        XCTAssertTrue(constraints!.contains(constraint6), "The sixth constraint should be included")
    }

    func testMissingConstraintsForItem() {
        constraints = superview.constraintsForItem(unusedView)
        XCTAssertEqual(constraints, [], "There should be no constraints returned")
    }

    func testConstraintSearchByAttribute() {
        constraints = superview.constraintsForAttribute(.leading)
        XCTAssertEqual(constraints!.count, 1, "All constraints with the leading attribute should be returned")
        XCTAssertTrue(constraints!.contains(constraint1), "The first constraint should be included")

        constraints = subview.constraintsForAttribute(.leading)
        XCTAssertEqual(constraints!.count, 2, "All constraints with the leading attribute should be returned")
        XCTAssertTrue(constraints!.contains(constraint3), "The third constraint should be included")
        XCTAssertTrue(constraints!.contains(constraint6), "The sixth constraint should be included")
    }

    func testMissingConstraintsForAttribute() {
        constraints = superview.constraintsForAttribute(unusedAttribute)
        XCTAssertEqual(constraints, [], "There should be no constraints returned")
    }

    func testConstraintSearchByItemAndAttribute() {
        let attributedItem = AutoLayoutAttributedItem(subview, .centerX)
        constraints = subview.constraintsForAttributedItem(attributedItem)
        XCTAssertEqual(constraints!.count, 2, "All constraints with the subview as an item with center X attribute should be returned")
        XCTAssertTrue(constraints!.contains(constraint3), "The third constraint should be included")
        XCTAssertTrue(constraints!.contains(constraint6), "The sixth constraint should be included")
    }

    func testMissingConstraintsForItemAndAttribute() {
        let attributedItem = AutoLayoutAttributedItem(unusedView, unusedAttribute)
        constraints = superview.constraintsForAttributedItem(attributedItem)
        XCTAssertEqual(constraints.count, 0, "There should be no constraints returned")
    }

    func testConstraintSearchByTwoItems() {
        constraints = subview.constraintsForItems(button, image)
        XCTAssertEqual(constraints!.count, 2, "All constraints with both the button and image as items should be returned")
        XCTAssertTrue(constraints!.contains(constraint4), "The fourth constraint should be included")
        XCTAssertTrue(constraints!.contains(constraint5), "The fifth constraint should be included")
    }

    func testMissingConstraintsForTwoItems() {
        constraints = superview.constraintsForItems(button, unusedView)
        XCTAssertEqual(constraints.count, 0, "There should be no constraints returned")
    }

    func testConstraintSearchByTwoItemsAndAttributes() {
        let imageCenterY = AutoLayoutAttributedItem(image, .centerY)
        let buttonLeading = AutoLayoutAttributedItem(button, .top)
        constraints = subview.constraintsForAttributedItems(imageCenterY, buttonLeading)
        XCTAssertEqual(constraints.count, 1, "Only the constraint with the image's center Y attribute and the button's leading attribute should be returned")
        XCTAssertTrue(constraints.contains(constraint4), "The fourth constraint is the expected result")
        constraints = subview.constraintsForAttributedItems(buttonLeading, imageCenterY)
        XCTAssertEqual(constraints.count, 1, "Only the constraint with the image's center Y attribute and the button's leading attribute should be returned")
        XCTAssertTrue(constraints.contains(constraint4), "The fourth constraint is the expected result")
    }

    func testMissingConstraintsForTwoItemsAndAttributes() {
        let imageCenterY = AutoLayoutAttributedItem(image, .centerY)
        let unusedItemAndAttribute = AutoLayoutAttributedItem(unusedView, unusedAttribute)
        constraints = superview.constraintsForAttributedItems(imageCenterY, unusedItemAndAttribute)
        XCTAssertEqual(constraints.count, 0, "There should be no constraints returned")
    }

    func testCheckingForConstraintInclusion() {
        let unappliedConstraint = image.centerX =* slider.centerX
        XCTAssertTrue(superview.hasConstraint(constraint1), "The specified constraint should be found")
        XCTAssertFalse(superview.hasConstraint(unappliedConstraint), "The specified constraint should not be found")
    }

}
