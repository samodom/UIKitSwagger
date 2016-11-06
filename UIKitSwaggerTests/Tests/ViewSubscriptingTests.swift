//
//  ViewSubscriptingTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 6/23/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import XCTest

class ViewSubscriptingTests: XCTestCase {

    var rootView = UIView()
    let child1 = UIView()
    let child2 = UIView()
    let child3 = UIView()
    let grandchild1 = UIView()
    let grandchild2 = UIView()
    let greatGrandchild = UIView()

    var ancestor: UIView!

    override func setUp() {
        super.setUp()

        rootView.addSubview(child1)
        rootView.addSubview(child2)
        child2.addSubview(grandchild1)
        child2.addSubview(grandchild2)
        grandchild1.addSubview(greatGrandchild)
        rootView.addSubview(child3)
    }

    func testViewSubscriptingReturnsSubviewAtIndex() {
        XCTAssertEqual(rootView[0]!, child1, "The subview at index 0 should be child1")
        XCTAssertEqual(rootView[1]!, child2, "The subview at index 1 should be child2")
        XCTAssertEqual(rootView[2]!, child3, "The subview at index 2 should be child3")
    }

    func testViewSubscriptingReturnsNilForIndexBeyondRange() {
        XCTAssertNil(rootView[4], "Out-of-range indices should return a nil value instead of raising an exception")
    }

    func testViewSubscriptingReplacesSubviewAtIndex() {
        rootView = UIView()
        rootView.addSubview(child1)
        rootView.addSubview(child2)
        rootView[0] = child3
        XCTAssertEqual(rootView.subviews.count, 2, "There should still be two subviews")
        XCTAssertEqual(rootView.subviews[0], child3, "The subview at index 0 should have been replaced with child3")
        XCTAssertEqual(child3.superview!, rootView, "The newly added subview should have the rootView as its superview")
        XCTAssertNil(child1.superview, "The subview that was removed should no longer have a superview")
    }

    func testViewSubscriptingRemovesSubviewAtIndex() {
        rootView[1] = nil
        XCTAssertEqual(rootView.subviews.count, 2, "There should now be two subviews left")
        XCTAssertNil(child2.superview, "The removed subview should no longer have a superview")
    }

    func testValidSubviewSwapping() {
        rootView.swap(0, 2)
        XCTAssertEqual(rootView[0]!, child3, "The subview at index 2 should now be at index 0")
        XCTAssertEqual(rootView[2]!, child1, "The subview at index 0 should now be at index 2")
    }

    func testIgnoredSubviewSwapping() {
        rootView.swap(1, 1)
        XCTAssertEqual(rootView[1]!, child2, "No subview should be moved if the two indices are equal")
    }

    func testInvalidSubviewSwapping() {
        rootView.swap(0, 4)
        XCTAssertEqual(rootView[0]!, child1, "No subview should be moved if one of the indices is out of range")

        rootView.swap(4, 0)
        XCTAssertEqual(rootView[0]!, child1, "No subview should be moved if one of the indices is out of range")
    }

    func testViewSubscriptingReturnsNthSuperview() {
        XCTAssertEqual(greatGrandchild[-1]!, grandchild1, "The superview of greatGrandchild should be grandchild1")
        XCTAssertEqual(greatGrandchild[-2]!, child2, "The super-superview of greatGrandchild should be child2")
        XCTAssertEqual(greatGrandchild[-3]!, rootView, "The super-super-superview of greatGrandchild should be the root view")
    }

    func testViewSubscriptingMovesViewToSuperview() {
        greatGrandchild[-1] = rootView
        XCTAssertEqual(greatGrandchild.superview!, rootView, "The deeply nested subview should have been moved to the root view")
        grandchild1[-5] = rootView
        XCTAssertEqual(grandchild1.superview!, rootView, "Any negative index should move the subview to the new superview")
    }

}
