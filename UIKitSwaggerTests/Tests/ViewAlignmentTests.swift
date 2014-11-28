//
//  ViewAlignmentTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/27/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class ViewAlignmentTests: XCTestCase {

    var controller: UIViewController!
    var view: UIView!
    let subview1 = UIView()
    let subview2 = UIView()
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()

    override func setUp() {
        super.setUp()

        let window = UIApplication.sharedApplication().delegate!.window!
        controller = window!.rootViewController
        controller.loadView()
        view = controller.view
        view.addSubview(subview1)
        view.addSubview(subview2)
        subview1.addSubview(label1)
        subview1.addSubview(label2)
        subview1.addSubview(label3)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testLeftAlignmentWithList() {
        AlignLeft(subview1, subview2, controller)
        let constraints = view.constraints() as [Constraint]
        var expected = subview2.left =* subview1.left
        XCTAssertTrue(contains(constraints, expected), "The second subview should be left-aligned with the first subview")
        expected = controller.left =* subview1.left
        XCTAssertTrue(contains(constraints, expected), "The main view should be left-aligned with the first subview")
    }

    func testLeftAlignmentWithArray() {
        AlignLeft([subview1, subview2, controller])
        let constraints = view.constraints() as [Constraint]
        var expected = subview2.left =* subview1.left
        XCTAssertTrue(contains(constraints, expected), "The second subview should be left-aligned with the first subview")
        expected = controller.left =* subview1.left
        XCTAssertTrue(contains(constraints, expected), "The main view should be left-aligned with the first subview")
    }

    func testRightAlignmentWithList() {
        AlignRight(subview1, subview2, controller)
        let constraints = view.constraints() as [Constraint]
        var expected = subview2.right =* subview1.right
        XCTAssertTrue(contains(constraints, expected), "The second subview should be right-aligned with the first subview")
        expected = controller.right =* subview1.right
        XCTAssertTrue(contains(constraints, expected), "The main view should be right-aligned with the first subview")
    }

    func testRightAlignmentWithArray() {
        AlignRight([subview1, subview2, controller])
        let constraints = view.constraints() as [Constraint]
        var expected = subview2.right =* subview1.right
        XCTAssertTrue(contains(constraints, expected), "The second subview should be right-margin-aligned with the first subview")
        expected = controller.right =* subview1.right
        XCTAssertTrue(contains(constraints, expected), "The main view should be right-margin-aligned with the first subview")
    }

    func testTopAlignmentWithList() {
        AlignTop(subview1, subview2, controller)
        let constraints = view.constraints() as [Constraint]
        var expected = subview2.top =* subview1.top
        XCTAssertTrue(contains(constraints, expected), "The second subview should be top-aligned with the first subview")
        expected = controller.top =* subview1.top
        XCTAssertTrue(contains(constraints, expected), "The controller's top layout guide should be aligned with the first subview")
    }

    func testTopAlignmentWithArray() {
        AlignTop([subview1, subview2, controller])
        let constraints = view.constraints() as [Constraint]
        var expected = subview2.top =* subview1.top
        XCTAssertTrue(contains(constraints, expected), "The second subview should be top-aligned with the first subview")
        expected = controller.top =* subview1.top
        XCTAssertTrue(contains(constraints, expected), "The controller's top layout guide should be aligned with the first subview")
    }

    func testBottomAlignmentWithList() {
        AlignBottom(subview1, subview2, controller)
        let constraints = view.constraints() as [Constraint]
        var expected = subview2.bottom =* subview1.bottom
        XCTAssertTrue(contains(constraints, expected), "The second subview should be bottom-aligned with the first subview")
        expected = controller.bottom =* subview1.bottom
        XCTAssertTrue(contains(constraints, expected), "The controller's bottom layout guide should be aligned with the first subview")
    }

    func testBottomAlignmentWithArray() {
        AlignBottom([subview1, subview2, controller])
        let constraints = view.constraints() as [Constraint]
        var expected = subview2.bottom =* subview1.bottom
        XCTAssertTrue(contains(constraints, expected), "The second subview should be bottom-aligned with the first subview")
        expected = controller.bottom =* subview1.bottom
        XCTAssertTrue(contains(constraints, expected), "The controller's bottom layout guide should be aligned with the first subview")
    }

    func testHorizontalAlignmentWithList() {
        AlignHorizontally(subview1, subview2, controller)
        let constraints = view.constraints() as [Constraint]
        var expected = subview2.centerX =* subview1.centerX
        XCTAssertTrue(contains(constraints, expected), "The second subview should be horizontally aligned with the first subview")
        expected = controller.centerX =* subview1.centerX
        XCTAssertTrue(contains(constraints, expected), "The controller's view should be horizontally aligned with the first subview")
    }

    func testHorizontalAlignmentWithArray() {
        AlignHorizontally([subview1, subview2, controller])
        let constraints = view.constraints() as [Constraint]
        var expected = subview2.centerX =* subview1.centerX
        XCTAssertTrue(contains(constraints, expected), "The second subview should be horizontally aligned with the first subview")
        expected = controller.centerX =* subview1.centerX
        XCTAssertTrue(contains(constraints, expected), "The controller's view should be horizontally aligned with the first subview")
    }

    func testVerticalAlignmentWithList() {
        AlignVertically(subview1, subview2, controller)
        let constraints = view.constraints() as [Constraint]
        var expected = subview2.centerY =* subview1.centerY
        XCTAssertTrue(contains(constraints, expected), "The second subview should be vertically aligned with the first subview")
        expected = controller.centerY =* subview1.centerY
        XCTAssertTrue(contains(constraints, expected), "The controller's view should be vertically aligned with the first subview")
    }

    func testVerticalAlignmentWithArray() {
        AlignVertically([subview1, subview2, controller])
        let constraints = view.constraints() as [Constraint]
        var expected = subview2.centerY =* subview1.centerY
        XCTAssertTrue(contains(constraints, expected), "The second subview should be vertically aligned with the first subview")
        expected = controller.centerY =* subview1.centerY
        XCTAssertTrue(contains(constraints, expected), "The controller's view should be vertically aligned with the first subview")
    }

    func testCenterAlignmentWithList() {
        AlignCenters(subview1, subview2, controller)
        let constraints = view.constraints() as [Constraint]
        var expected = subview2.centerY =* subview1.centerY
        XCTAssertTrue(contains(constraints, expected), "The second subview should be vertically aligned with the first subview")
        expected = controller.centerY =* subview1.centerY
        XCTAssertTrue(contains(constraints, expected), "The controller's view should be vertically aligned with the first subview")
        expected = subview2.centerX =* subview1.centerX
        XCTAssertTrue(contains(constraints, expected), "The second subview should be horizontally aligned with the first subview")
        expected = controller.centerX =* subview1.centerX
        XCTAssertTrue(contains(constraints, expected), "The controller's view should be horizontally aligned with the first subview")
    }

    func testCenterAlignmentWithArray() {
        AlignCenters(subview1, subview2, controller)
        let constraints = view.constraints() as [Constraint]
        var expected = subview2.centerY =* subview1.centerY
        XCTAssertTrue(contains(constraints, expected), "The second subview should be vertically aligned with the first subview")
        expected = controller.centerY =* subview1.centerY
        XCTAssertTrue(contains(constraints, expected), "The controller's view should be vertically aligned with the first subview")
        expected = subview2.centerX =* subview1.centerX
        XCTAssertTrue(contains(constraints, expected), "The second subview should be horizontally aligned with the first subview")
        expected = controller.centerX =* subview1.centerX
        XCTAssertTrue(contains(constraints, expected), "The controller's view should be horizontally aligned with the first subview")
    }

    func testBaselineAlignmentWithList() {
        AlignBaselines(label1, label2, label3)
        let constraints = subview1.constraints() as [Constraint]
        var expected = label2.baseline =* label1.baseline
        XCTAssertTrue(contains(constraints, expected), "The second label should be baseline-aligned with the first label")
        expected = label3.baseline =* label1.baseline
        XCTAssertTrue(contains(constraints, expected), "The third label should be baseline-aligned with the first label")
    }

    func testBaselineAlignmentWithArray() {
        AlignBaselines([label1, label2, label3])
        let constraints = subview1.constraints() as [Constraint]
        var expected = label2.baseline =* label1.baseline
        XCTAssertTrue(contains(constraints, expected), "The second label should be baseline-aligned with the first label")
        expected = label3.baseline =* label1.baseline
        XCTAssertTrue(contains(constraints, expected), "The third label should be baseline-aligned with the first label")
    }

}
