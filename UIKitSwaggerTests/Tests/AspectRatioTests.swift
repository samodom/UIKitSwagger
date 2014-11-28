//
//  AspectRatioTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class AspectRatioTests: XCTestCase {

    var superview = UIView()
    var view1 = UIView()
    var view2 = UIView()
    var view3 = UIView()
    var appliedConstraints: [Constraint]!
    var returnedConstraint: Constraint!
    var returnedConstraints: [Constraint]!

    override func setUp() {
        super.setUp()

        superview.addSubview(view1)
        superview.addSubview(view2)
        superview.addSubview(view3)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    //  MARK: Single-item aspect ratio

    func testWidthToHeightAspectRatio() {
        returnedConstraint = view1.constrainWidthToHeight(2.5)
        let expected = view1.width =* 2.5 * view1.height
        appliedConstraints = view1.constraints() as [Constraint]
        XCTAssertTrue(contains(appliedConstraints, expected), "The view's width should be constrained to 2.5 times its height")
        XCTAssertEqual(returnedConstraint, expected, "The applied constraint should be returned to the caller")
    }

    func testWidthToHeightAspectRatioWithOffset() {
        returnedConstraint = view1.constrainWidthToHeight(2.5, offset: 14)
        let expected = view1.width =* 2.5 * view1.height + 14
        appliedConstraints = view1.constraints() as [Constraint]
        XCTAssertTrue(contains(appliedConstraints, expected), "The view's width should be constrained to 2.5 times its height plus 14 pt")
        XCTAssertEqual(returnedConstraint, expected, "The applied constraint should be returned to the caller")
    }

    func testWidthToHeightSquareAspectRatio() {
        returnedConstraint = view1.constrainWidthToHeight()
        let expected = view1.width =* view1.height
        appliedConstraints = view1.constraints() as [Constraint]
        XCTAssertTrue(contains(appliedConstraints, expected), "The view's width should be constrained to 2.5 times its height")
        XCTAssertEqual(returnedConstraint, expected, "The applied constraint should be returned to the caller")
    }

    func testHeightToWidthAspectRatio() {
        returnedConstraint = view1.constrainHeightToWidth(2.5)
        let expected = view1.height =* 2.5 * view1.width
        appliedConstraints = view1.constraints() as [Constraint]
        XCTAssertTrue(contains(appliedConstraints, expected), "The view's height should be constrained to its width")
        XCTAssertEqual(returnedConstraint, expected, "The applied constraint should be returned to the caller")
    }

    func testHeightToWidthAspectRatioWithOffset() {
        returnedConstraint = view1.constrainHeightToWidth(2.5, offset: 14)
        let expected = view1.height =* 2.5 * view1.width + 14
        appliedConstraints = view1.constraints() as [Constraint]
        XCTAssertTrue(contains(appliedConstraints, expected), "The view's height should be constrained to its width plus 14 pt")
        XCTAssertEqual(returnedConstraint, expected, "The applied constraint should be returned to the caller")
    }

    func testHeightToWidthSquareAspectRatio() {
        returnedConstraint = view1.constrainHeightToWidth()
        let expected = view1.height =* view1.width
        appliedConstraints = view1.constraints() as [Constraint]
        XCTAssertTrue(contains(appliedConstraints, expected), "The view's height should be constrained to its width")
        XCTAssertEqual(returnedConstraint, expected, "The applied constraint should be returned to the caller")
    }

    //  MARK: Matching dimensions between items

    func testConstrainingViewWidthsWithList() {
        returnedConstraints = ConstrainWidths(view1, view2, view3)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = superview.constraints() as [Constraint]
        var expected = view2.width =* view1.width
        XCTAssertTrue(contains(appliedConstraints, expected), "The second view should have the same width as the first view")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = view3.width =* view1.width
        XCTAssertTrue(contains(appliedConstraints, expected), "The third view should have the same width as the first view")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testConstrainingViewWidthsWithArray() {
        returnedConstraints = ConstrainWidths([view1, view2, view3])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = superview.constraints() as [Constraint]
        var expected = view2.width =* view1.width
        XCTAssertTrue(contains(appliedConstraints, expected), "The second view should have the same width as the first view")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = view3.width =* view1.width
        XCTAssertTrue(contains(appliedConstraints, expected), "The third view should have the same width as the first view")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testConstrainingViewHeightsWithList() {
        returnedConstraints = ConstrainHeights(view1, view2, view3)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = superview.constraints() as [Constraint]
        var expected = view2.height =* view1.height
        XCTAssertTrue(contains(appliedConstraints, expected), "The second view should have the same height as the first view")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = view3.height =* view1.height
        XCTAssertTrue(contains(appliedConstraints, expected), "The third view should have the same height as the first view")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testConstrainingViewHeightsWithArray() {
        returnedConstraints = ConstrainHeights([view1, view2, view3])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = superview.constraints() as [Constraint]
        var expected = view2.height =* view1.height
        XCTAssertTrue(contains(appliedConstraints, expected), "The second view should have the same height as the first view")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = view3.height =* view1.height
        XCTAssertTrue(contains(appliedConstraints, expected), "The third view should have the same height as the first view")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

}
