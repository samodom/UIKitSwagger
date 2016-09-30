//
//  ShowHideTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/1/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest
import UIKitSwagger

class ShowHideTests: XCTestCase {

    var viewOne = UIView()
    var viewTwo = UIView()
    var viewThree = UIView()

    fileprivate func hideAll() {
        viewOne.isHidden = true
        viewTwo.isHidden = true
        viewThree.isHidden = true
    }

    func testHidingOfView() {
        HideViews(viewOne)
        XCTAssertTrue(viewOne.isHidden, "The first view should be hidden")
        XCTAssertFalse(viewTwo.isHidden, "The second view should not be hidden")
        XCTAssertFalse(viewThree.isHidden, "The third view should not be hidden")
    }

    func testHidingOfViewsVariadic() {
        HideViews(viewOne, viewThree)
        XCTAssertTrue(viewOne.isHidden, "The first view should be hidden")
        XCTAssertFalse(viewTwo.isHidden, "The second view should not be hidden")
        XCTAssertTrue(viewThree.isHidden, "The third view should be hidden")
    }

    func testHidingOfViewsArray() {
        HideViews([viewOne, viewThree])
        XCTAssertTrue(viewOne.isHidden, "The first view should be hidden")
        XCTAssertFalse(viewTwo.isHidden, "The second view should not be hidden")
        XCTAssertTrue(viewThree.isHidden, "The third view should be hidden")
    }

    func testShowingOfView() {
        hideAll()
        ShowViews(viewOne)
        XCTAssertFalse(viewOne.isHidden, "The first view should no longer be hidden")
        XCTAssertTrue(viewTwo.isHidden, "The second view should still be hidden")
        XCTAssertTrue(viewThree.isHidden, "The third view should still be hidden")
    }

    func testShowingOfViewsVariadic() {
        hideAll()
        ShowViews(viewOne, viewThree)
        XCTAssertFalse(viewOne.isHidden, "The first view should no longer be hidden")
        XCTAssertTrue(viewTwo.isHidden, "The second view should still be hidden")
        XCTAssertFalse(viewThree.isHidden, "The third view should no longer be hidden")
    }

    func testShowingOfViewsArray() {
        hideAll()
        ShowViews([viewOne, viewThree])
        XCTAssertFalse(viewOne.isHidden, "The first view should no longer be hidden")
        XCTAssertTrue(viewTwo.isHidden, "The second view should still be hidden")
        XCTAssertFalse(viewThree.isHidden, "The third view should no longer be hidden")
    }

}
