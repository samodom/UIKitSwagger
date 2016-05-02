//
//  ViewCornersTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 5/2/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import XCTest
@testable import UIKitSwagger

class ViewCornersTests: XCTestCase {

    var corners: ViewCorners!

    func testTopLeftCorner() {
        corners = .TopLeft
        XCTAssertEqual(corners.rawValue, 1, "The raw value of the top-left corner should be 1")
        XCTAssertEqual(corners, [.TopLeft], "The named value should be equal to a set of that value")
    }

    func testTopRightCorner() {
        corners = .TopRight
        XCTAssertEqual(corners.rawValue, 2, "The raw value of the top-right corner should be 2")
        XCTAssertEqual(corners, [.TopRight], "The named value should be equal to a set of that value")
    }

    func testBottomLeftCorner() {
        corners = .BottomLeft
        XCTAssertEqual(corners.rawValue, 4, "The raw value of the bottom-left corner should be 4")
        XCTAssertEqual(corners, [.BottomLeft], "The named value should be equal to a set of that value")
    }

    func testBottomRightCorner() {
        corners = .BottomRight
        XCTAssertEqual(corners.rawValue, 8, "The raw value of the bottom-right corner should be 8")
        XCTAssertEqual(corners, [.BottomRight], "The named value should be equal to a set of that value")
    }

    func testTopCorners() {
        corners = .Top
        XCTAssertEqual(corners, [.TopLeft, .TopRight], "The named value should be equal to a set of its constituent value")
    }

    func testBottomCorners() {
        corners = .Bottom
        XCTAssertEqual(corners, [.BottomLeft, .BottomRight], "The named value should be equal to a set of its constituent value")
    }

    func testLeftCorners() {
        corners = .Left
        XCTAssertEqual(corners, [.TopLeft, .BottomLeft], "The named value should be equal to a set of its constituent value")
    }

    func testRightCorners() {
        corners = .Right
        XCTAssertEqual(corners, [.TopRight, .BottomRight], "The named value should be equal to a set of its constituent value")
    }

    func testNoCorners() {
        corners = ViewCorners.None
        XCTAssertEqual(corners, [], "The named value should be equal to an empty set")
    }

    func testAllCorners() {
        corners = .All
        XCTAssertEqual(corners, [.TopLeft, .TopRight, .BottomLeft, .BottomRight], "The named value should be equal to a set of its constituent value")
    }

    func testOverloadingCorners() {
        corners = .All
        corners.insert(.Top)
        XCTAssertEqual(corners, ViewCorners.All, "Adding corners to the set already contained within the set should have no effect")
    }

    func testSingleCornerFlags() {
        XCTAssertTrue(ViewCorners.TopLeft.isSingleCorner, "The top left corner alone is a single corner")
        XCTAssertTrue(ViewCorners.TopRight.isSingleCorner, "The top right corner alone is a single corner")
        XCTAssertTrue(ViewCorners.BottomLeft.isSingleCorner, "The bottom left corner alone is a single corner")
        XCTAssertTrue(ViewCorners.BottomRight.isSingleCorner, "The bottom right corner alone is a single corner")

        XCTAssertFalse(ViewCorners.Top.isSingleCorner, "The top corners together are not a single corner")
        XCTAssertFalse(ViewCorners.Bottom.isSingleCorner, "The bottom corners together are not a single corner")
        XCTAssertFalse(ViewCorners.Left.isSingleCorner, "The left corners together are not a single corner")
        XCTAssertFalse(ViewCorners.Right.isSingleCorner, "The right corners together are not a single corner")

        XCTAssertFalse(ViewCorners.None.isSingleCorner, "No corners at all are not a single corner")
        XCTAssertFalse(ViewCorners.All.isSingleCorner, "All corners together are not a single corner")
    }

    func testConversionToUIRectCorner() {
        XCTAssertEqual(ViewCorners.TopLeft.asUIRectCorner, UIRectCorner.TopLeft, "Single corners should be converted appropriately")
        XCTAssertEqual(ViewCorners.TopRight.asUIRectCorner, UIRectCorner.TopRight, "Single corners should be converted appropriately")
        XCTAssertEqual(ViewCorners.BottomLeft.asUIRectCorner, UIRectCorner.BottomLeft, "Single corners should be converted appropriately")
        XCTAssertEqual(ViewCorners.BottomRight.asUIRectCorner, UIRectCorner.BottomRight, "Single corners should be converted appropriately")

        XCTAssertEqual(ViewCorners.Top.asUIRectCorner, [UIRectCorner.TopLeft, .TopRight], "Corner pairs should be converted appropriately")
        XCTAssertEqual(ViewCorners.Bottom.asUIRectCorner, [UIRectCorner.BottomLeft, .BottomRight], "Corner pairs should be converted appropriately")
        XCTAssertEqual(ViewCorners.Left.asUIRectCorner, [UIRectCorner.TopLeft, .BottomLeft], "Corner pairs should be converted appropriately")
        XCTAssertEqual(ViewCorners.Right.asUIRectCorner, [UIRectCorner.TopRight, .BottomRight], "Corner pairs should be converted appropriately")

        XCTAssertEqual(ViewCorners.None.asUIRectCorner, [], "No corners should be converted to an empty set")
        XCTAssertEqual(ViewCorners.All.asUIRectCorner, UIRectCorner.AllCorners, "All corners should be converted appropriately")
    }

}
