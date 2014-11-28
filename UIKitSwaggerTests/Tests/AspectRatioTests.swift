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

    override func setUp() {
        super.setUp()

        superview.addSubview(view1)
        superview.addSubview(view2)
        superview.addSubview(view3)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testWidthToHeightAspectRatio() {
        view1.constrainWidthToHeight(2.5)
        let expected = view1.width =* 2.5 * view1.height
        let constraints = view1.constraints() as [Constraint]
        XCTAssertTrue(contains(constraints, expected), "The view's width should be constrained to 2.5 times its height")
    }

    func testWidthToHeightAspectRatioWithOffset() {
        view1.constrainWidthToHeight(2.5, offset: 14)
        let expected = view1.width =* 2.5 * view1.height + 14
        let constraints = view1.constraints() as [Constraint]
        XCTAssertTrue(contains(constraints, expected), "The view's width should be constrained to 2.5 times its height plus 14 pt")
    }

    func testWidthToHeightSquareAspectRatio() {
        view1.constrainWidthToHeight()
        let expected = view1.width =* view1.height
        let constraints = view1.constraints() as [Constraint]
        XCTAssertTrue(contains(constraints, expected), "The view's width should be constrained to 2.5 times its height")
    }

    func testHeightToWidthAspectRatio() {
        view1.constrainHeightToWidth(2.5)
        let expected = view1.height =* 2.5 * view1.width
        let constraints = view1.constraints() as [Constraint]
        XCTAssertTrue(contains(constraints, expected), "The view's height should be constrained to its width")
    }

    func testHeightToWidthAspectRatioWithOffset() {
        view1.constrainHeightToWidth(2.5, offset: 14)
        let expected = view1.height =* 2.5 * view1.width + 14
        let constraints = view1.constraints() as [Constraint]
        XCTAssertTrue(contains(constraints, expected), "The view's height should be constrained to its width plus 14 pt")
    }

    func testHeightToWidthSquareAspectRatio() {
        view1.constrainHeightToWidth()
        let expected = view1.height =* view1.width
        let constraints = view1.constraints() as [Constraint]
        XCTAssertTrue(contains(constraints, expected), "The view's height should be constrained to its width")
    }

    func testConstrainingViewWidthsWithList() {
        ConstrainWidths(view1, view2, view3)
        let constraints = superview.constraints() as [Constraint]
        var expected = view2.width =* view1.width
        XCTAssertTrue(contains(constraints, expected), "The second view should have the same width as the first view")
        expected = view3.width =* view1.width
        XCTAssertTrue(contains(constraints, expected), "The third view should have the same width as the first view")
    }

    func testConstrainingViewWidthsWithArray() {
        ConstrainWidths([view1, view2, view3])
        let constraints = superview.constraints() as [Constraint]
        var expected = view2.width =* view1.width
        XCTAssertTrue(contains(constraints, expected), "The second view should have the same width as the first view")
        expected = view3.width =* view1.width
        XCTAssertTrue(contains(constraints, expected), "The third view should have the same width as the first view")
    }

    func testConstrainingViewHeightsWithList() {
        ConstrainHeights(view1, view2, view3)
        let constraints = superview.constraints() as [Constraint]
        var expected = view2.height =* view1.height
        XCTAssertTrue(contains(constraints, expected), "The second view should have the same height as the first view")
        expected = view3.height =* view1.height
        XCTAssertTrue(contains(constraints, expected), "The third view should have the same height as the first view")
    }

    func testConstrainingViewHeightsWithArray() {
        ConstrainHeights([view1, view2, view3])
        let constraints = superview.constraints() as [Constraint]
        var expected = view2.height =* view1.height
        XCTAssertTrue(contains(constraints, expected), "The second view should have the same height as the first view")
        expected = view3.height =* view1.height
        XCTAssertTrue(contains(constraints, expected), "The third view should have the same height as the first view")
    }

}
