//
//  LayoutDirectionTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 7/10/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import XCTest
@testable import UIKitSwagger

class LayoutDirectionTests: XCTestCase {

    var direction: LayoutDirection!
    var opposite: LayoutDirection!

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testCreatingDirectionFromRawValues() {
        for raw in -10 ... 10 {
            direction = LayoutDirection(rawValue: raw)
            if (1 ... 3).contains(abs(raw)) {
                XCTAssertTrue(direction != nil, "Raw integer value \(raw) should produce a layout direction")
            }
            else {
                XCTAssertTrue(direction == nil, "The value \(raw) should not be a raw value for a layout direction")
            }
        }
    }

    func testLeftToRightDirection() {
        direction = .LeftToRight
        opposite = .RightToLeft
        XCTAssertEqual(direction.rawValue, -opposite.rawValue, "Left-to-right should use the opposite value of right-to-left")
        XCTAssertEqual(direction, -opposite, "Negation should produce the reverse direction")
        XCTAssertEqual(direction.attributePair.0, .Left, "The attribute pair should be left followed by right")
        XCTAssertEqual(direction.attributePair.1, .Right, "The attribute pair should be left followed by right")
        XCTAssertEqual(direction.axis, .Horizontal, "The layout axis should be horizontal")
    }

    func testRightToLeftDirection() {
        direction = .RightToLeft
        opposite = .LeftToRight
        XCTAssertEqual(direction.rawValue, -opposite.rawValue, "Right-to-left should use the opposite value of left-to-right")
        XCTAssertEqual(direction, -opposite, "Negation should produce the reverse direction")
        XCTAssertEqual(direction.attributePair.0, .Right, "The attribute pair should be right followed by left")
        XCTAssertEqual(direction.attributePair.1, .Left, "The attribute pair should be right followed by left")
        XCTAssertEqual(direction.axis, .Horizontal, "The layout axis should be horizontal")
    }

    func testLeadingToTrailingDirection() {
        direction = .LeadingToTrailing
        opposite = .TrailingToLeading
        XCTAssertEqual(direction.rawValue, -opposite.rawValue, "Leading-to-trailing should use the opposite value of trailing-to-leading")
        XCTAssertEqual(direction, -opposite, "Negation should produce the reverse direction")
        XCTAssertEqual(direction.attributePair.0, .Leading, "The attribute pair should be leading followed by trailing")
        XCTAssertEqual(direction.attributePair.1, .Trailing, "The attribute pair should be leading followed by trailing")
        XCTAssertEqual(direction.axis, .Horizontal, "The layout axis should be horizontal")
    }

    func testTrailingToLeadingDirection() {
        direction = .TrailingToLeading
        opposite = .LeadingToTrailing
        XCTAssertEqual(direction.rawValue, -opposite.rawValue, "Trailing-to-leading should use the opposite value of leading-to-trailing")
        XCTAssertEqual(direction, -opposite, "Negation should produce the reverse direction")
        XCTAssertEqual(direction.attributePair.0, .Trailing, "The attribute pair should be trailing followed by leading")
        XCTAssertEqual(direction.attributePair.1, .Leading, "The attribute pair should be trailing followed by leading")
        XCTAssertEqual(direction.axis, .Horizontal, "The layout axis should be horizontal")
    }

    func testTopToBottomDirection() {
        direction = .TopToBottom
        opposite = .BottomToTop
        XCTAssertEqual(direction.rawValue, -opposite.rawValue, "Top-to-bottom should use the opposite value of bottom-to-top")
        XCTAssertEqual(direction, -opposite, "Negation should produce the reverse direction")
        XCTAssertEqual(direction.attributePair.0, .Top, "The attribute pair should be top followed by bottom")
        XCTAssertEqual(direction.attributePair.1, .Bottom, "The attribute pair should be top followed by bottom")
        XCTAssertEqual(direction.axis, .Vertical, "The layout axis should be vertical")
    }

    func testBottomToTopDirection() {
        direction = .BottomToTop
        opposite = .TopToBottom
        XCTAssertEqual(direction.rawValue, -opposite.rawValue, "Bottom-to-top should use the opposite value of top-to-bottom")
        XCTAssertEqual(direction, -opposite, "Negation should produce the reverse direction")
        XCTAssertEqual(direction.attributePair.0, .Bottom, "The attribute pair should be bottom followed by top")
        XCTAssertEqual(direction.attributePair.1, .Top, "The attribute pair should be bottom followed by top")
        XCTAssertEqual(direction.axis, .Vertical, "The layout axis should be vertical")
    }

}
