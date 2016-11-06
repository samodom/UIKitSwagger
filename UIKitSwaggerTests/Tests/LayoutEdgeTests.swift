//
//  LayoutEdgeTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 10/10/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import XCTest
@testable import UIKitSwagger

class LayoutEdgeTests: XCTestCase {

    func testEdgeAxisAssociations() {
        XCTAssertEqual(LayoutEdge.leading.layoutAxis, UILayoutConstraintAxis.horizontal, "The leading edge should be an edge on the horizontal axis")
        XCTAssertEqual(LayoutEdge.trailing.layoutAxis, UILayoutConstraintAxis.horizontal, "The trailing edge should be an edge on the horizontal axis")
        XCTAssertEqual(LayoutEdge.left.layoutAxis, UILayoutConstraintAxis.horizontal, "The left edge should be an edge on the horizontal axis")
        XCTAssertEqual(LayoutEdge.right.layoutAxis, UILayoutConstraintAxis.horizontal, "The right edge should be an edge on the horizontal axis")
        XCTAssertEqual(LayoutEdge.top.layoutAxis, UILayoutConstraintAxis.vertical, "The top edge should be an edge on the vertical axis")
        XCTAssertEqual(LayoutEdge.top.layoutAxis, UILayoutConstraintAxis.vertical, "The top edge should be an edge on the horizontal axis")
    }

}
