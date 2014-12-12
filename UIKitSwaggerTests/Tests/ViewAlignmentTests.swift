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
    var appliedConstraints: [Constraint]!
    var returnedConstraints: [Constraint]!

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
        returnedConstraints = AlignLeft(subview1, subview2, controller)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = view.constraints() as [Constraint]
        var expected = subview2.left =* subview1.left
        XCTAssertTrue(contains(appliedConstraints, expected), "The second subview should be left-aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = controller.left =* subview1.left
        XCTAssertTrue(contains(appliedConstraints, expected), "The main view should be left-aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testLeftAlignmentWithArray() {
        returnedConstraints = AlignLeft([subview1, subview2, controller])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = view.constraints() as [Constraint]
        var expected = subview2.left =* subview1.left
        XCTAssertTrue(contains(appliedConstraints, expected), "The second subview should be left-aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = controller.left =* subview1.left
        XCTAssertTrue(contains(appliedConstraints, expected), "The main view should be left-aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testLeadingAlignmentWithList() {
        returnedConstraints = AlignLeading(subview1, subview2, controller)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = view.constraints() as [Constraint]
        var expected = subview2.leading =* subview1.leading
        XCTAssertTrue(contains(appliedConstraints, expected), "The second subview should be leading-aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = controller.leading =* subview1.leading
        XCTAssertTrue(contains(appliedConstraints, expected), "The main view should be leading-aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testLeadingAlignmentWithArray() {
        returnedConstraints = AlignLeading([subview1, subview2, controller])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = view.constraints() as [Constraint]
        var expected = subview2.leading =* subview1.leading
        XCTAssertTrue(contains(appliedConstraints, expected), "The second subview should be leading-aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = controller.leading =* subview1.leading
        XCTAssertTrue(contains(appliedConstraints, expected), "The main view should be leading-aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testRightAlignmentWithList() {
        returnedConstraints = AlignRight(subview1, subview2, controller)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = view.constraints() as [Constraint]
        var expected = subview2.right =* subview1.right
        XCTAssertTrue(contains(appliedConstraints, expected), "The second subview should be right-aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = controller.right =* subview1.right
        XCTAssertTrue(contains(appliedConstraints, expected), "The main view should be right-aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testRightAlignmentWithArray() {
        returnedConstraints = AlignRight([subview1, subview2, controller])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = view.constraints() as [Constraint]
        var expected = subview2.right =* subview1.right
        XCTAssertTrue(contains(appliedConstraints, expected), "The second subview should be right-aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = controller.right =* subview1.right
        XCTAssertTrue(contains(appliedConstraints, expected), "The main view should be right-aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testTrailingAlignmentWithList() {
        returnedConstraints = AlignTrailing(subview1, subview2, controller)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = view.constraints() as [Constraint]
        var expected = subview2.trailing =* subview1.trailing
        XCTAssertTrue(contains(appliedConstraints, expected), "The second subview should be trailing-aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = controller.trailing =* subview1.trailing
        XCTAssertTrue(contains(appliedConstraints, expected), "The main view should be trailing-aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testTrailingAlignmentWithArray() {
        returnedConstraints = AlignTrailing([subview1, subview2, controller])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = view.constraints() as [Constraint]
        var expected = subview2.trailing =* subview1.trailing
        XCTAssertTrue(contains(appliedConstraints, expected), "The second subview should be trailing-aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = controller.trailing =* subview1.trailing
        XCTAssertTrue(contains(appliedConstraints, expected), "The main view should be trailing-aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testTopAlignmentWithList() {
        returnedConstraints = AlignTop(subview1, subview2, controller)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = view.constraints() as [Constraint]
        var expected = subview2.top =* subview1.top
        XCTAssertTrue(contains(appliedConstraints, expected), "The second subview should be top-aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = controller.top =* subview1.top
        XCTAssertTrue(contains(appliedConstraints, expected), "The controller's top layout guide should be aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testTopAlignmentWithArray() {
        returnedConstraints = AlignTop([subview1, subview2, controller])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = view.constraints() as [Constraint]
        var expected = subview2.top =* subview1.top
        XCTAssertTrue(contains(appliedConstraints, expected), "The second subview should be top-aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = controller.top =* subview1.top
        XCTAssertTrue(contains(appliedConstraints, expected), "The controller's top layout guide should be aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testBottomAlignmentWithList() {
        returnedConstraints = AlignBottom(subview1, subview2, controller)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = view.constraints() as [Constraint]
        var expected = subview2.bottom =* subview1.bottom
        XCTAssertTrue(contains(appliedConstraints, expected), "The second subview should be bottom-aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = controller.bottom =* subview1.bottom
        XCTAssertTrue(contains(appliedConstraints, expected), "The controller's bottom layout guide should be aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testBottomAlignmentWithArray() {
        returnedConstraints = AlignBottom([subview1, subview2, controller])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = view.constraints() as [Constraint]
        var expected = subview2.bottom =* subview1.bottom
        XCTAssertTrue(contains(appliedConstraints, expected), "The second subview should be bottom-aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = controller.bottom =* subview1.bottom
        XCTAssertTrue(contains(appliedConstraints, expected), "The controller's bottom layout guide should be aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testHorizontalAlignmentWithList() {
        returnedConstraints = AlignHorizontally(subview1, subview2, controller)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = view.constraints() as [Constraint]
        var expected = subview2.centerX =* subview1.centerX
        XCTAssertTrue(contains(appliedConstraints, expected), "The second subview should be horizontally aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = controller.centerX =* subview1.centerX
        XCTAssertTrue(contains(appliedConstraints, expected), "The controller's view should be horizontally aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testHorizontalAlignmentWithArray() {
        returnedConstraints = AlignHorizontally([subview1, subview2, controller])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = view.constraints() as [Constraint]
        var expected = subview2.centerX =* subview1.centerX
        XCTAssertTrue(contains(appliedConstraints, expected), "The second subview should be horizontally aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = controller.centerX =* subview1.centerX
        XCTAssertTrue(contains(appliedConstraints, expected), "The controller's view should be horizontally aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testVerticalAlignmentWithList() {
        returnedConstraints = AlignVertically(subview1, subview2, controller)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = view.constraints() as [Constraint]
        var expected = subview2.centerY =* subview1.centerY
        XCTAssertTrue(contains(appliedConstraints, expected), "The second subview should be vertically aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = controller.centerY =* subview1.centerY
        XCTAssertTrue(contains(appliedConstraints, expected), "The controller's view should be vertically aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testVerticalAlignmentWithArray() {
        returnedConstraints = AlignVertically([subview1, subview2, controller])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = view.constraints() as [Constraint]
        var expected = subview2.centerY =* subview1.centerY
        XCTAssertTrue(contains(appliedConstraints, expected), "The second subview should be vertically aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = controller.centerY =* subview1.centerY
        XCTAssertTrue(contains(appliedConstraints, expected), "The controller's view should be vertically aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testCenterAlignmentWithList() {
        returnedConstraints = AlignCenters(subview1, subview2, controller)
        XCTAssertEqual(returnedConstraints.count, 4, "There should be four total constraints returned")
        appliedConstraints = view.constraints() as [Constraint]
        var expected = subview2.centerY =* subview1.centerY
        XCTAssertTrue(contains(appliedConstraints, expected), "The second subview should be vertically aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = controller.centerY =* subview1.centerY
        XCTAssertTrue(contains(appliedConstraints, expected), "The controller's view should be vertically aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = subview2.centerX =* subview1.centerX
        XCTAssertTrue(contains(appliedConstraints, expected), "The second subview should be horizontally aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = controller.centerX =* subview1.centerX
        XCTAssertTrue(contains(appliedConstraints, expected), "The controller's view should be horizontally aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testCenterAlignmentWithArray() {
        returnedConstraints = AlignCenters(subview1, subview2, controller)
        XCTAssertEqual(returnedConstraints.count, 4, "There should be four total constraints returned")
        appliedConstraints = view.constraints() as [Constraint]
        var expected = subview2.centerY =* subview1.centerY
        XCTAssertTrue(contains(appliedConstraints, expected), "The second subview should be vertically aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = controller.centerY =* subview1.centerY
        XCTAssertTrue(contains(appliedConstraints, expected), "The controller's view should be vertically aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = subview2.centerX =* subview1.centerX
        XCTAssertTrue(contains(appliedConstraints, expected), "The second subview should be horizontally aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = controller.centerX =* subview1.centerX
        XCTAssertTrue(contains(appliedConstraints, expected), "The controller's view should be horizontally aligned with the first subview")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testBaselineAlignmentWithList() {
        returnedConstraints = AlignBaselines(label1, label2, label3)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = subview1.constraints() as [Constraint]
        var expected = label2.baseline =* label1.baseline
        XCTAssertTrue(contains(appliedConstraints, expected), "The second label should be baseline-aligned with the first label")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = label3.baseline =* label1.baseline
        XCTAssertTrue(contains(appliedConstraints, expected), "The third label should be baseline-aligned with the first label")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testBaselineAlignmentWithArray() {
        returnedConstraints = AlignBaselines([label1, label2, label3])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = subview1.constraints() as [Constraint]
        var expected = label2.baseline =* label1.baseline
        XCTAssertTrue(contains(appliedConstraints, expected), "The second label should be baseline-aligned with the first label")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = label3.baseline =* label1.baseline
        XCTAssertTrue(contains(appliedConstraints, expected), "The third label should be baseline-aligned with the first label")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

}
