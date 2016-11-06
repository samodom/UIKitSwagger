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
        direction = .leftToRight
        opposite = .rightToLeft
        XCTAssertEqual(direction.rawValue, -opposite.rawValue, "Left-to-right should use the opposite value of right-to-left")
        XCTAssertEqual(direction, -opposite, "Negation should produce the reverse direction")
        XCTAssertEqual(direction.attributePair.0, NSLayoutAttribute.left, "The attribute pair should be left followed by right")
        XCTAssertEqual(direction.attributePair.1, NSLayoutAttribute.right, "The attribute pair should be left followed by right")
        XCTAssertEqual(direction.axis, UILayoutConstraintAxis.horizontal, "The layout axis should be horizontal")
    }

    func testRightToLeftDirection() {
        direction = .rightToLeft
        opposite = .leftToRight
        XCTAssertEqual(direction.rawValue, -opposite.rawValue, "Right-to-left should use the opposite value of left-to-right")
        XCTAssertEqual(direction, -opposite, "Negation should produce the reverse direction")
        XCTAssertEqual(direction.attributePair.0, NSLayoutAttribute.right, "The attribute pair should be right followed by left")
        XCTAssertEqual(direction.attributePair.1, NSLayoutAttribute.left, "The attribute pair should be right followed by left")
        XCTAssertEqual(direction.axis, UILayoutConstraintAxis.horizontal, "The layout axis should be horizontal")
    }

    func testLeadingToTrailingDirection() {
        direction = .leadingToTrailing
        opposite = .trailingToLeading
        XCTAssertEqual(direction.rawValue, -opposite.rawValue, "Leading-to-trailing should use the opposite value of trailing-to-leading")
        XCTAssertEqual(direction, -opposite, "Negation should produce the reverse direction")
        XCTAssertEqual(direction.attributePair.0, NSLayoutAttribute.leading, "The attribute pair should be leading followed by trailing")
        XCTAssertEqual(direction.attributePair.1, NSLayoutAttribute.trailing, "The attribute pair should be leading followed by trailing")
        XCTAssertEqual(direction.axis, UILayoutConstraintAxis.horizontal, "The layout axis should be horizontal")
    }

    func testTrailingToLeadingDirection() {
        direction = .trailingToLeading
        opposite = .leadingToTrailing
        XCTAssertEqual(direction.rawValue, -opposite.rawValue, "Trailing-to-leading should use the opposite value of leading-to-trailing")
        XCTAssertEqual(direction, -opposite, "Negation should produce the reverse direction")
        XCTAssertEqual(direction.attributePair.0, NSLayoutAttribute.trailing, "The attribute pair should be trailing followed by leading")
        XCTAssertEqual(direction.attributePair.1, NSLayoutAttribute.leading, "The attribute pair should be trailing followed by leading")
        XCTAssertEqual(direction.axis, UILayoutConstraintAxis.horizontal, "The layout axis should be horizontal")
    }

    func testTopToBottomDirection() {
        direction = .topToBottom
        opposite = .bottomToTop
        XCTAssertEqual(direction.rawValue, -opposite.rawValue, "Top-to-bottom should use the opposite value of bottom-to-top")
        XCTAssertEqual(direction, -opposite, "Negation should produce the reverse direction")
        XCTAssertEqual(direction.attributePair.0, NSLayoutAttribute.top, "The attribute pair should be top followed by bottom")
        XCTAssertEqual(direction.attributePair.1, NSLayoutAttribute.bottom, "The attribute pair should be top followed by bottom")
        XCTAssertEqual(direction.axis, UILayoutConstraintAxis.vertical, "The layout axis should be vertical")
    }

    func testBottomToTopDirection() {
        direction = .bottomToTop
        opposite = .topToBottom
        XCTAssertEqual(direction.rawValue, -opposite.rawValue, "Bottom-to-top should use the opposite value of top-to-bottom")
        XCTAssertEqual(direction, -opposite, "Negation should produce the reverse direction")
        XCTAssertEqual(direction.attributePair.0, NSLayoutAttribute.bottom, "The attribute pair should be bottom followed by top")
        XCTAssertEqual(direction.attributePair.1, NSLayoutAttribute.top, "The attribute pair should be bottom followed by top")
        XCTAssertEqual(direction.axis, UILayoutConstraintAxis.vertical, "The layout axis should be vertical")
    }

}
