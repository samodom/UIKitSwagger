//
//  ShowHideTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/1/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class ShowHideTests: XCTestCase {

    var viewOne = UIView()
    var viewTwo = UIView()
    var viewThree = UIView()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    private func hideAll() {
        viewOne.hidden = true
        viewTwo.hidden = true
        viewThree.hidden = true
    }

    func testHidingOfView() {
        HideViews(viewOne)
        XCTAssertTrue(viewOne.hidden, "The first view should be hidden")
        XCTAssertFalse(viewTwo.hidden, "The second view should not be hidden")
        XCTAssertFalse(viewThree.hidden, "The third view should not be hidden")
    }

    func testHidingOfViewsVariadic() {
        HideViews(viewOne, viewThree)
        XCTAssertTrue(viewOne.hidden, "The first view should be hidden")
        XCTAssertFalse(viewTwo.hidden, "The second view should not be hidden")
        XCTAssertTrue(viewThree.hidden, "The third view should be hidden")
    }

    func testHidingOfViewsArray() {
        HideViews([viewOne, viewThree])
        XCTAssertTrue(viewOne.hidden, "The first view should be hidden")
        XCTAssertFalse(viewTwo.hidden, "The second view should not be hidden")
        XCTAssertTrue(viewThree.hidden, "The third view should be hidden")
    }

    func testShowingOfView() {
        hideAll()
        ShowViews(viewOne)
        XCTAssertFalse(viewOne.hidden, "The first view should no longer be hidden")
        XCTAssertTrue(viewTwo.hidden, "The second view should still be hidden")
        XCTAssertTrue(viewThree.hidden, "The third view should still be hidden")
    }

    func testShowingOfViewsVariadic() {
        hideAll()
        ShowViews(viewOne, viewThree)
        XCTAssertFalse(viewOne.hidden, "The first view should no longer be hidden")
        XCTAssertTrue(viewTwo.hidden, "The second view should still be hidden")
        XCTAssertFalse(viewThree.hidden, "The third view should no longer be hidden")
    }

    func testShowingOfViewsArray() {
        hideAll()
        ShowViews([viewOne, viewThree])
        XCTAssertFalse(viewOne.hidden, "The first view should no longer be hidden")
        XCTAssertTrue(viewTwo.hidden, "The second view should still be hidden")
        XCTAssertFalse(viewThree.hidden, "The third view should no longer be hidden")
    }

}
