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
        XCTAssertEqual(LayoutEdge.Leading.layoutAxis, UILayoutConstraintAxis.Horizontal, "The leading edge should be an edge on the horizontal axis")
        XCTAssertEqual(LayoutEdge.Trailing.layoutAxis, UILayoutConstraintAxis.Horizontal, "The trailing edge should be an edge on the horizontal axis")
        XCTAssertEqual(LayoutEdge.Left.layoutAxis, UILayoutConstraintAxis.Horizontal, "The left edge should be an edge on the horizontal axis")
        XCTAssertEqual(LayoutEdge.Right.layoutAxis, UILayoutConstraintAxis.Horizontal, "The right edge should be an edge on the horizontal axis")
        XCTAssertEqual(LayoutEdge.Top.layoutAxis, UILayoutConstraintAxis.Vertical, "The top edge should be an edge on the vertical axis")
        XCTAssertEqual(LayoutEdge.Top.layoutAxis, UILayoutConstraintAxis.Vertical, "The top edge should be an edge on the horizontal axis")
    }

}
