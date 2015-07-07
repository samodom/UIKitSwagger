//
//  StackViewSyntaxTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 7/7/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import XCTest
@testable import UIKitSwagger

@available(iOS 9.0, *)
class StackViewSyntaxTests: XCTestCase {

    var stackView: UIStackView!
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
    var arrangedViews: [UIView]!
    
    override func setUp() {
        super.setUp()

        arrangedViews = [view1, view2, view3]
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testCreatingHorizontalStackView() {
        stackView = StackHorizontally(arrangedViews, alignment: .Center, distribution: .EqualSpacing, spacing: 14.0)
        XCTAssertEqual(stackView.axis, .Horizontal, "The stack view should use the horizontal layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, .Center, "The stack view should use the provided alignment")
        XCTAssertEqual(stackView.distribution, .EqualSpacing, "The stack view should use the provided distribution")
        XCTAssertEqual(stackView.spacing, 14.0, "The stack view should use the provided spacing")
    }

    func testCreatingHorizontalStackViewWithoutAlignment() {
        stackView = StackHorizontally(arrangedViews, distribution: .EqualSpacing, spacing: 14.0)
        XCTAssertEqual(stackView.axis, .Horizontal, "The stack view should use the horizontal layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, .Fill, "The stack view should use the default alignment")
        XCTAssertEqual(stackView.distribution, .EqualSpacing, "The stack view should use the provided distribution")
        XCTAssertEqual(stackView.spacing, 14.0, "The stack view should use the provided spacing")
    }

    func testCreatingHorizontalStackViewWithoutDistribution() {
        stackView = StackHorizontally(arrangedViews, alignment: .Center, spacing: 14.0)
        XCTAssertEqual(stackView.axis, .Horizontal, "The stack view should use the horizontal layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, .Center, "The stack view should use the provided alignment")
        XCTAssertEqual(stackView.distribution, .Fill, "The stack view should use the default distribution")
        XCTAssertEqual(stackView.spacing, 14.0, "The stack view should use the provided spacing")
    }

    func testCreatingHorizontalStackViewWithoutSpacing() {
        stackView = StackHorizontally(arrangedViews, alignment: .Center, distribution: .EqualSpacing)
        XCTAssertEqual(stackView.axis, .Horizontal, "The stack view should use the horizontal layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, .Center, "The stack view should use the provided alignment")
        XCTAssertEqual(stackView.distribution, .EqualSpacing, "The stack view should use the provided distribution")
        XCTAssertEqual(stackView.spacing, 0.0, "The stack view should use the default spacing")
    }

    func testCreatingHorizontalStackViewWithAlignmentOnly() {
        stackView = StackHorizontally(arrangedViews, alignment: .Center)
        XCTAssertEqual(stackView.axis, .Horizontal, "The stack view should use the horizontal layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, .Center, "The stack view should use the provided alignment")
        XCTAssertEqual(stackView.distribution, .Fill, "The stack view should use the default distribution")
        XCTAssertEqual(stackView.spacing, 0.0, "The stack view should use the default spacing")
    }

    func testCreatingHorizontalStackViewWithDistributionOnly() {
        stackView = StackHorizontally(arrangedViews, distribution: .EqualSpacing)
        XCTAssertEqual(stackView.axis, .Horizontal, "The stack view should use the horizontal layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, .Fill, "The stack view should use the default alignment")
        XCTAssertEqual(stackView.distribution, .EqualSpacing, "The stack view should use the provided distribution")
        XCTAssertEqual(stackView.spacing, 0.0, "The stack view should use the default spacing")
    }

    func testCreatingHorizontalStackViewWithSpacingOnly() {
        stackView = StackHorizontally(arrangedViews, spacing: 14.0)
        XCTAssertEqual(stackView.axis, .Horizontal, "The stack view should use the horizontal layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, .Fill, "The stack view should use the default alignment")
        XCTAssertEqual(stackView.distribution, .Fill, "The stack view should use the default distribution")
        XCTAssertEqual(stackView.spacing, 14.0, "The stack view should use the provided spacing")
    }

    func testCreatingVerticalStackView() {
        stackView = StackVertically(arrangedViews, alignment: .Center, distribution: .EqualSpacing, spacing: 14.0)
        XCTAssertEqual(stackView.axis, .Vertical, "The stack view should use the vertical layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, .Center, "The stack view should use the provided alignment")
        XCTAssertEqual(stackView.distribution, .EqualSpacing, "The stack view should use the provided distribution")
        XCTAssertEqual(stackView.spacing, 14.0, "The stack view should use the provided spacing")
    }

    func testCreatingVerticalStackViewWithoutAlignment() {
        stackView = StackVertically(arrangedViews, distribution: .EqualSpacing, spacing: 14.0)
        XCTAssertEqual(stackView.axis, .Vertical, "The stack view should use the vertical layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, .Fill, "The stack view should use the default alignment")
        XCTAssertEqual(stackView.distribution, .EqualSpacing, "The stack view should use the provided distribution")
        XCTAssertEqual(stackView.spacing, 14.0, "The stack view should use the provided spacing")
    }

    func testCreatingVerticalStackViewWithoutDistribution() {
        stackView = StackVertically(arrangedViews, alignment: .Center, spacing: 14.0)
        XCTAssertEqual(stackView.axis, .Vertical, "The stack view should use the vertical layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, .Center, "The stack view should use the provided alignment")
        XCTAssertEqual(stackView.distribution, .Fill, "The stack view should use the default distribution")
        XCTAssertEqual(stackView.spacing, 14.0, "The stack view should use the provided spacing")
    }

    func testCreatingVerticalStackViewWithoutSpacing() {
        stackView = StackVertically(arrangedViews, alignment: .Center, distribution: .EqualSpacing)
        XCTAssertEqual(stackView.axis, .Vertical, "The stack view should use the vertical layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, .Center, "The stack view should use the provided alignment")
        XCTAssertEqual(stackView.distribution, .EqualSpacing, "The stack view should use the provided distribution")
        XCTAssertEqual(stackView.spacing, 0.0, "The stack view should use the default spacing")
    }

    func testCreatingVerticalStackViewWithAlignmentOnly() {
        stackView = StackVertically(arrangedViews, alignment: .Center)
        XCTAssertEqual(stackView.axis, .Vertical, "The stack view should use the vertical layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, .Center, "The stack view should use the provided alignment")
        XCTAssertEqual(stackView.distribution, .Fill, "The stack view should use the default distribution")
        XCTAssertEqual(stackView.spacing, 0.0, "The stack view should use the default spacing")
    }

    func testCreatingVerticalStackViewWithDistributionOnly() {
        stackView = StackVertically(arrangedViews, distribution: .EqualSpacing)
        XCTAssertEqual(stackView.axis, .Vertical, "The stack view should use the vertical layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, .Fill, "The stack view should use the default alignment")
        XCTAssertEqual(stackView.distribution, .EqualSpacing, "The stack view should use the provided distribution")
        XCTAssertEqual(stackView.spacing, 0.0, "The stack view should use the default spacing")
    }

    func testCreatingVerticalStackViewWithSpacingOnly() {
        stackView = StackVertically(arrangedViews, spacing: 14.0)
        XCTAssertEqual(stackView.axis, .Vertical, "The stack view should use the vertical layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, .Fill, "The stack view should use the default alignment")
        XCTAssertEqual(stackView.distribution, .Fill, "The stack view should use the default distribution")
        XCTAssertEqual(stackView.spacing, 14.0, "The stack view should use the provided spacing")
    }

}
