//
//  ViewHierarchyTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 6/23/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import XCTest
import UIKit

class ViewHierarchyExtensionsTests: XCTestCase {

    var rootView = UIView()
    let subview0 = UIView()
    let subview1 = UIView()
    let subview2 = UIView()
    let subview1_0 = UIView()
    let subview1_1 = UIView()
    let subview1_0_0 = UIView()
    let subview1_0_1 = UIView()

    var ancestor: UIView!

    override func setUp() {
        super.setUp()

        buildComplexViewHierarchy()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func buildComplexViewHierarchy() {
        rootView.addSubview(subview0)

        rootView.addSubview(subview1)
        subview1.addSubview(subview1_0)
        subview1.addSubview(subview1_1)
        subview1_0.addSubview(subview1_0_0)
        subview1_0.addSubview(subview1_0_1)

        rootView.addSubview(subview2)
    }

    func testViewSubscriptingReturnsSubviewAtIndex() {
        XCTAssertEqual(rootView[0]!, subview0, "The subview at index 0 should be subview0")
        XCTAssertEqual(rootView[1]!, subview1, "The subview at index 1 should be subview1")
        XCTAssertEqual(rootView[2]!, subview2, "The subview at index 2 should be subview2")
    }

    func testViewSubscriptingReturnsNilForIndexBeyondRange() {
        XCTAssertTrue(rootView[4] == nil, "Out-of-range indices should return a nil value instead of raising an exception")
    }

    func testViewSubscriptingReplacesSubviewAtIndex() {
        rootView = UIView()
        rootView.addSubview(subview0)
        rootView.addSubview(subview1)
        rootView[0] = subview2
        XCTAssertEqual(rootView.subviews.count, 2, "There should still be two subviews")
        XCTAssertEqual(rootView.subviews[0] as! UIView, subview2, "The subview at index 0 should have been replaced with subview2")
        XCTAssertEqual(subview2.superview!, rootView, "The newly added subview should have the rootView as its superview")
        XCTAssertNil(subview0.superview, "The subview that was removed should no longer have a superview")
    }

    func testViewSubscriptingRemovesSubviewAtIndex() {
        rootView[1] = nil
        XCTAssertEqual(rootView.subviews.count, 2, "There should now be two subviews left")
        XCTAssertTrue(subview1.superview == nil, "The removed subview should no longer have a superview")
    }

    func testValidSubviewSwapping() {
        rootView.swap(0, 2)
        XCTAssertEqual(rootView[0]!, subview2, "The subview at index 2 should now be at index 0")
        XCTAssertEqual(rootView[2]!, subview0, "The subview at index 0 should now be at index 2")
    }

    func testIgnoredSubviewSwapping() {
        rootView.swap(1, 1)
        XCTAssertEqual(rootView[1]!, subview1, "No subview should be moved if the two indices are equal")
    }

    func testInvalidSubviewSwapping() {
        rootView.swap(0, 4)
        XCTAssertEqual(rootView[0]!, subview0, "No subview should be moved if one of the indices is out of range")

        rootView.swap(4, 0)
        XCTAssertEqual(rootView[0]!, subview0, "No subview should be moved if one of the indices is out of range")
    }

    func testViewSubscriptingReturnsNthSuperview() {
        XCTAssertEqual(subview1_0_1[-1]!, subview1_0, "The superview of subview1_0_1 should be subview1_0")
        XCTAssertEqual(subview1_0_1[-2]!, subview1, "The super-superview of subview1_0_1 should be subview1")
        XCTAssertEqual(subview1_0_1[-3]!, rootView, "The super-super-superview of subview1_0_1 should be the root view")
    }

    func testViewSubscriptingMovesViewToSuperview() {
        subview1_0_0[-1] = rootView
        XCTAssertEqual(subview1_0_0.superview!, rootView, "The deeply nested subview should have been moved to the root view")
        subview1_0_1[-5] = rootView
        XCTAssertEqual(subview1_0_1.superview!, rootView, "Any negative index should move the subview to the new superview")
    }

    func testFirstCommonAncestorOfViewAndItselfIsItself() {
        ancestor = subview0.firstCommonAncestor(subview0)
        XCTAssertEqual(ancestor, subview0, "The first common ancestor of a view and itself is itself")
    }

    func testFirstCommonAncestorOfViewAndImmediateSubviewIsView() {
        ancestor = rootView.firstCommonAncestor(subview0)
        XCTAssertEqual(ancestor, rootView, "The first common ancestor of a view and one of its immediate subviews is that parent view")
        ancestor = subview0.firstCommonAncestor(rootView)
        XCTAssertEqual(ancestor, rootView, "The first common ancestor of a view and its immediate superview is the parent view")
    }

    func testFirstCommonAncestorOfViewAndNestedSubviewIsView() {
        ancestor = rootView.firstCommonAncestor(subview1_0_1)
        XCTAssertEqual(ancestor, rootView, "The first common ancestor of a view and one of its nested subviews is the parent view")
        ancestor = subview1_0_1.firstCommonAncestor(rootView)
        XCTAssertEqual(ancestor, rootView, "The first common ancestor of a view and its distant superview is the parent view")
    }

    func testFirstCommonAncestorOfViewAndSiblingIsSuperview() {
        ancestor = subview0.firstCommonAncestor(subview1)
        XCTAssertEqual(ancestor, rootView, "The first common ancestor of a view and one of its siblings is their parent view")
    }

    func testFirstCommonAncestorOfViewAndDescendentOfSiblingIsSuperview() {
        ancestor = subview0.firstCommonAncestor(subview1_0_1)
        XCTAssertEqual(ancestor, rootView, "The first common ancestor of a view and one of its sibling's descendents is their parent view")
        ancestor = subview1_0_1.firstCommonAncestor(subview0)
        XCTAssertEqual(ancestor, rootView, "The first common ancestor of a view and one of its ancestors siblings is the parent view of the siblings")
    }

    func testThereIsNoFirstCommonAncestorOfTwoTopLevelViews() {
        let anotherView = UIView()
        ancestor = anotherView.firstCommonAncestor(rootView)
        XCTAssertNil(ancestor, "Two top-level views cannot have a common ancestor")
        ancestor = rootView.firstCommonAncestor(anotherView)
        XCTAssertNil(ancestor, "Two top-level views cannot have a common ancestor")
    }

    func testThereIsNoFirstCommonAncestorOfUnrelatedViews() {
        let unrelatedView = UIView()
        ancestor = subview0.firstCommonAncestor(unrelatedView)
        XCTAssertNil(ancestor, "There is no first common ancestor between unrelated views")
        ancestor = unrelatedView.firstCommonAncestor(subview0)
        XCTAssertNil(ancestor, "There is no first common ancestor between unrelated views")
    }

}
