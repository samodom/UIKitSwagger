//
//  StackViewSyntaxTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 7/7/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import XCTest
import UIKitSwagger

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

    //  MARK: Horizontal

    func testCreatingHorizontalStackViewWithoutSubviews() {
        stackView = StackHorizontally(views: [],
            alignment: .center,
            distribution: .equalSpacing,
            spacing: 14
        )
        XCTAssertEqual(stackView.axis, UILayoutConstraintAxis.horizontal, "The stack view should use the horizontal layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, [], "The stack view should not contain any arranged subviews")
        XCTAssertEqual(stackView.alignment, UIStackViewAlignment.center, "The stack view should use the provided alignment")
        XCTAssertEqual(stackView.distribution, UIStackViewDistribution.equalSpacing, "The stack view should use the provided distribution")
        XCTAssertEqual(stackView.spacing, 14, "The stack view should use the provided spacing")
    }

    func testCreatingHorizontalStackView() {
        stackView = StackHorizontally(views: arrangedViews,
            alignment: .center,
            distribution: .equalSpacing,
            spacing: 14
        )
        XCTAssertEqual(stackView.axis, UILayoutConstraintAxis.horizontal, "The stack view should use the horizontal layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, UIStackViewAlignment.center, "The stack view should use the provided alignment")
        XCTAssertEqual(stackView.distribution, UIStackViewDistribution.equalSpacing, "The stack view should use the provided distribution")
        XCTAssertEqual(stackView.spacing, 14, "The stack view should use the provided spacing")
    }

    func testCreatingHorizontalStackViewWithoutAlignment() {
        stackView = StackHorizontally(views: arrangedViews,
            distribution: .equalSpacing,
            spacing: 14
        )
        XCTAssertEqual(stackView.axis, UILayoutConstraintAxis.horizontal, "The stack view should use the horizontal layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, UIStackViewAlignment.fill, "The stack view should use the default alignment")
        XCTAssertEqual(stackView.distribution, UIStackViewDistribution.equalSpacing, "The stack view should use the provided distribution")
        XCTAssertEqual(stackView.spacing, 14, "The stack view should use the provided spacing")
    }

    func testCreatingHorizontalStackViewWithoutDistribution() {
        stackView = StackHorizontally(views: arrangedViews,
            alignment: .center,
            spacing: 14
        )
        XCTAssertEqual(stackView.axis, UILayoutConstraintAxis.horizontal, "The stack view should use the horizontal layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, UIStackViewAlignment.center, "The stack view should use the provided alignment")
        XCTAssertEqual(stackView.distribution, UIStackViewDistribution.fill, "The stack view should use the default distribution")
        XCTAssertEqual(stackView.spacing, 14, "The stack view should use the provided spacing")
    }

    func testCreatingHorizontalStackViewWithoutSpacing() {
        stackView = StackHorizontally(views: arrangedViews,
            alignment: .center,
            distribution: .equalSpacing
        )
        XCTAssertEqual(stackView.axis, UILayoutConstraintAxis.horizontal, "The stack view should use the horizontal layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, UIStackViewAlignment.center, "The stack view should use the provided alignment")
        XCTAssertEqual(stackView.distribution, UIStackViewDistribution.equalSpacing, "The stack view should use the provided distribution")
        XCTAssertEqual(stackView.spacing, 0, "The stack view should use the default spacing")
    }

    func testCreatingHorizontalStackViewWithAlignmentOnly() {
        stackView = StackHorizontally(views: arrangedViews, alignment: .center)
        XCTAssertEqual(stackView.axis, UILayoutConstraintAxis.horizontal, "The stack view should use the horizontal layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, UIStackViewAlignment.center, "The stack view should use the provided alignment")
        XCTAssertEqual(stackView.distribution, UIStackViewDistribution.fill, "The stack view should use the default distribution")
        XCTAssertEqual(stackView.spacing, 0, "The stack view should use the default spacing")
    }

    func testCreatingHorizontalStackViewWithDistributionOnly() {
        stackView = StackHorizontally(views: arrangedViews, distribution: .equalSpacing)
        XCTAssertEqual(stackView.axis, UILayoutConstraintAxis.horizontal, "The stack view should use the horizontal layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, UIStackViewAlignment.fill, "The stack view should use the default alignment")
        XCTAssertEqual(stackView.distribution, UIStackViewDistribution.equalSpacing, "The stack view should use the provided distribution")
        XCTAssertEqual(stackView.spacing, 0, "The stack view should use the default spacing")
    }

    func testCreatingHorizontalStackViewWithSpacingOnly() {
        stackView = StackHorizontally(views: arrangedViews, spacing: 14)
        XCTAssertEqual(stackView.axis, UILayoutConstraintAxis.horizontal, "The stack view should use the horizontal layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, UIStackViewAlignment.fill, "The stack view should use the default alignment")
        XCTAssertEqual(stackView.distribution, UIStackViewDistribution.fill, "The stack view should use the default distribution")
        XCTAssertEqual(stackView.spacing, 14, "The stack view should use the provided spacing")
    }

    func testCreatingHorizontalStackViewWithViewsOnly() {
        stackView = StackHorizontally(views: arrangedViews)
        XCTAssertEqual(stackView.axis, UILayoutConstraintAxis.horizontal, "The stack view should use the horizontal layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, UIStackViewAlignment.fill, "The stack view should use the default alignment")
        XCTAssertEqual(stackView.distribution, UIStackViewDistribution.fill, "The stack view should use the default distribution")
        XCTAssertEqual(stackView.spacing, 0, "The stack view should use the default spacing")
    }


    //  MARK: Vertical

    func testCreatingVerticalStackViewWithoutSubviews() {
        stackView = StackVertically(views: [],
            alignment: .center,
            distribution: .equalSpacing,
            spacing: 14
        )
        XCTAssertEqual(stackView.axis, UILayoutConstraintAxis.vertical, "The stack view should use the vertical layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, [], "The stack view should not contain any arranged subviews")
        XCTAssertEqual(stackView.alignment, UIStackViewAlignment.center, "The stack view should use the provided alignment")
        XCTAssertEqual(stackView.distribution, UIStackViewDistribution.equalSpacing, "The stack view should use the provided distribution")
        XCTAssertEqual(stackView.spacing, 14, "The stack view should use the provided spacing")
    }

    func testCreatingVerticalStackView() {
        stackView = StackVertically(views: arrangedViews,
            alignment: .center,
            distribution: .equalSpacing,
            spacing: 14
        )
        XCTAssertEqual(stackView.axis, UILayoutConstraintAxis.vertical, "The stack view should use the vertical layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, UIStackViewAlignment.center, "The stack view should use the provided alignment")
        XCTAssertEqual(stackView.distribution, UIStackViewDistribution.equalSpacing, "The stack view should use the provided distribution")
        XCTAssertEqual(stackView.spacing, 14, "The stack view should use the provided spacing")
    }

    func testCreatingVerticalStackViewWithoutAlignment() {
        stackView = StackVertically(views: arrangedViews,
            distribution: .equalSpacing,
            spacing: 14
        )
        XCTAssertEqual(stackView.axis, UILayoutConstraintAxis.vertical, "The stack view should use the vertical layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, UIStackViewAlignment.fill, "The stack view should use the default alignment")
        XCTAssertEqual(stackView.distribution, UIStackViewDistribution.equalSpacing, "The stack view should use the provided distribution")
        XCTAssertEqual(stackView.spacing, 14, "The stack view should use the provided spacing")
    }

    func testCreatingVerticalStackViewWithoutDistribution() {
        stackView = StackVertically(views: arrangedViews,
            alignment: .center,
            spacing: 14
        )
        XCTAssertEqual(stackView.axis, UILayoutConstraintAxis.vertical, "The stack view should use the vertical layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, UIStackViewAlignment.center, "The stack view should use the provided alignment")
        XCTAssertEqual(stackView.distribution, UIStackViewDistribution.fill, "The stack view should use the default distribution")
        XCTAssertEqual(stackView.spacing, 14, "The stack view should use the provided spacing")
    }

    func testCreatingVerticalStackViewWithoutSpacing() {
        stackView = StackVertically(views: arrangedViews,
            alignment: .center,
            distribution: .equalSpacing
        )
        XCTAssertEqual(stackView.axis, UILayoutConstraintAxis.vertical, "The stack view should use the vertical layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, UIStackViewAlignment.center, "The stack view should use the provided alignment")
        XCTAssertEqual(stackView.distribution, UIStackViewDistribution.equalSpacing, "The stack view should use the provided distribution")
        XCTAssertEqual(stackView.spacing, 0, "The stack view should use the default spacing")
    }

    func testCreatingVerticalStackViewWithAlignmentOnly() {
        stackView = StackVertically(views: arrangedViews, alignment: .center)
        XCTAssertEqual(stackView.axis, UILayoutConstraintAxis.vertical, "The stack view should use the vertical layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, UIStackViewAlignment.center, "The stack view should use the provided alignment")
        XCTAssertEqual(stackView.distribution, UIStackViewDistribution.fill, "The stack view should use the default distribution")
        XCTAssertEqual(stackView.spacing, 0, "The stack view should use the default spacing")
    }

    func testCreatingVerticalStackViewWithDistributionOnly() {
        stackView = StackVertically(views: arrangedViews, distribution: .equalSpacing)
        XCTAssertEqual(stackView.axis, UILayoutConstraintAxis.vertical, "The stack view should use the vertical layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, UIStackViewAlignment.fill, "The stack view should use the default alignment")
        XCTAssertEqual(stackView.distribution, UIStackViewDistribution.equalSpacing, "The stack view should use the provided distribution")
        XCTAssertEqual(stackView.spacing, 0, "The stack view should use the default spacing")
    }

    func testCreatingVerticalStackViewWithSpacingOnly() {
        stackView = StackVertically(views: arrangedViews, spacing: 14)
        XCTAssertEqual(stackView.axis, UILayoutConstraintAxis.vertical, "The stack view should use the vertical layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, UIStackViewAlignment.fill, "The stack view should use the default alignment")
        XCTAssertEqual(stackView.distribution, UIStackViewDistribution.fill, "The stack view should use the default distribution")
        XCTAssertEqual(stackView.spacing, 14, "The stack view should use the provided spacing")
    }

    func testCreatingVerticalStackViewWithViewsOnly() {
        stackView = StackVertically(views: arrangedViews)
        XCTAssertEqual(stackView.axis, UILayoutConstraintAxis.vertical, "The stack view should use the vertical layout axis")
        XCTAssertEqual(stackView.arrangedSubviews, arrangedViews, "The stack view should contain the same arrangement of subviews provided")
        XCTAssertEqual(stackView.alignment, UIStackViewAlignment.fill, "The stack view should use the default alignment")
        XCTAssertEqual(stackView.distribution, UIStackViewDistribution.fill, "The stack view should use the default distribution")
        XCTAssertEqual(stackView.spacing, 0, "The stack view should use the default spacing")
    }

}
