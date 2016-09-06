//
//  SwaggerViewCornerRoundingTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 4/25/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import XCTest
@testable import UIKitSwagger

class SwaggerViewCornerRoundingTests: XCTestCase {

    var view: SwaggerView!
    let radius: CGFloat = 4.2
    let radii = CGSize(width: 4.2, height: 4.2)
    let frame = CGRect(
        origin: CGPointZero,
        size: CGSize(
            width: 42,
            height: 99
        )
    )

    override func setUp() {
        super.setUp()

        view = SwaggerView(frame: frame)
    }

    //  MARK: Corner radius

    func testDefaultCornerRadiusValue() {
        XCTAssertEqual(view.cornerRadius, 0, "A view's corner radius should be zero by default")
    }

    func testViewCornerRadiusIsNotMappedToLayerCornerRadius() {
        view.layer.cornerRadius = radius
        XCTAssertEqual(view.cornerRadius, 0, "A view's corner radius should not correspond to its layer's corner radius")

        view.cornerRadius = 1.4
        XCTAssertEqual(view.layer.cornerRadius, radius, "A view's corner radius should not correspond to its layer's corner radius")
    }

    func testChangingCornerRadiusUpdatesLayerPath() {
        view.cornerRadius = 4.2

        let expectedPath = UIBezierPath(
            roundedRect: view.bounds,
            byRoundingCorners: [],
            cornerRadii: CGSizeZero
        )

        let layer = view.layer as! CAShapeLayer
        let path = UIBezierPath(CGPath: layer.path!)

        XCTAssertEqual(path, expectedPath, "Updating the corner radius should update the view's layer path")
    }

    //  MARK: Rounded corners

    func testNoCornersAreRoundedByDefault() {
        XCTAssertEqual(view.roundedCorners, ViewCorners.None, "No corners should be rounded by default")
    }

    func testSettingRoundedCorners() {
        view.roundedCorners = [.TopLeft, .BottomRight]
        XCTAssertEqual(view.roundedCorners, [.TopLeft, .BottomRight], "Should be able to change the rounded corners")
    }

    func testClearingRoundedCorners() {
        view.roundedCorners = .Top
        view.roundedCorners = .None
        XCTAssertEqual(view.roundedCorners, ViewCorners.None, "Should be able to clear the rounded corners")
    }

    func testChangingRoundedCornersUpdatesLayerPath() {
        view.cornerRadius = 4.2
        view.roundedCorners = [.TopRight, .BottomLeft]

        let expectedPath = UIBezierPath(
            roundedRect: view.bounds,
            byRoundingCorners: [.TopRight, .BottomLeft],
            cornerRadii: radii
        )

        let layer = view.layer as! CAShapeLayer
        let path = UIBezierPath(CGPath: layer.path!)

        XCTAssertEqual(path, expectedPath, "Updating the corner radius should update the view's layer path")
    }

    //  MARK: Corner-rounding flags

    //  MARK: Top-left

    func testTopLeftCornerRoundingFlagIsClearByDefault() {
        XCTAssertFalse(view.topLeft, "The top left corner should not be rounded by default")
    }

    func testTopLeftCornerRoundingFlagMatchesRoundedCornersMembership() {
        view.roundedCorners = [.TopLeft]
        XCTAssertTrue(view.topLeft, "The top left corner rounding flag should be active when the corner is included in the rounded corners set")

        view.roundedCorners = ViewCorners.All.subtract(.TopLeft)
        XCTAssertFalse(view.topLeft, "The top left corner rounding flag should not be active when the corner is not included in the rounded corners set")
    }

    func testClearingTopLeftCornerRoundingFlagRemovesRoundedCornersMembership() {
        view.roundedCorners = .All
        view.topLeft = false
        XCTAssertFalse(view.roundedCorners.contains(.TopLeft), "Clearing the top left corner rounding flag should remove the corner from the rounded corners set")
    }

    func testChangingTopLeftCornerRoundingFlagUpdatesLayerPath() {
        view.cornerRadius = 4.2
        view.topLeft = true

        let expectedPath = UIBezierPath(
            roundedRect: view.bounds,
            byRoundingCorners: .TopLeft,
            cornerRadii: radii
        )

        let layer = view.layer as! CAShapeLayer
        let path = UIBezierPath(CGPath: layer.path!)

        XCTAssertEqual(path, expectedPath, "Updating the top left corner rounding flag should update the view's layer path")
    }

    //  MARK: Top-right

    func testTopRightCornerRoundingFlagIsClearByDefault() {
        XCTAssertFalse(view.topRight, "The top right corner should not be rounded by default")
    }

    func testTopRightCornerRoundingFlagMatchesRoundedCornersMembership() {
        view.roundedCorners = [.TopRight]
        XCTAssertTrue(view.topRight, "The top right corner rounding flag should be active when the corner is included in the rounded corners set")

        view.roundedCorners = ViewCorners.All.subtract(.TopRight)
        XCTAssertFalse(view.topRight, "The top right corner rounding flag should not be active when the corner is not included in the rounded corners set")
    }

    func testClearingTopRightCornerRoundingFlagRemovesRoundedCornersMembership() {
        view.roundedCorners = .All
        view.topRight = false
        XCTAssertFalse(view.roundedCorners.contains(.TopRight), "Clearing the top right corner rounding flag should remove the corner from the rounded corners set")
    }

    func testChangingTopRightCornerRoundingFlagUpdatesLayerPath() {
        view.cornerRadius = 4.2
        view.topRight = true

        let expectedPath = UIBezierPath(
            roundedRect: view.bounds,
            byRoundingCorners: .TopRight,
            cornerRadii: radii
        )

        let layer = view.layer as! CAShapeLayer
        let path = UIBezierPath(CGPath: layer.path!)

        XCTAssertEqual(path, expectedPath, "Updating the top right corner rounding flag should update the view's layer path")
    }

    //  MARK: Bottom-left

    func testBottomLeftCornerRoundingFlagIsClearByDefault() {
        XCTAssertFalse(view.bottomLeft, "The bottom left corner should not be rounded by default")
    }

    func testBottomLeftCornerRoundingFlagMatchesRoundedCornersMembership() {
        view.roundedCorners = [.BottomLeft]
        XCTAssertTrue(view.bottomLeft, "The bottom left corner rounding flag should be active when the corner is included in the rounded corners set")

        view.roundedCorners = ViewCorners.All.subtract(.BottomLeft)
        XCTAssertFalse(view.bottomLeft, "The bottom left corner rounding flag should not be active when the corner is not included in the rounded corners set")
    }

    func testClearingBottomLeftCornerRoundingFlagRemovesRoundedCornersMembership() {
        view.roundedCorners = .All
        view.bottomLeft = false
        XCTAssertFalse(view.roundedCorners.contains(.BottomLeft), "Clearing the bottom left corner rounding flag should remove the corner from the rounded corners set")
    }

    func testChangingBottomLeftCornerRoundingFlagUpdatesLayerPath() {
        view.cornerRadius = 4.2
        view.bottomLeft = true

        let expectedPath = UIBezierPath(
            roundedRect: view.bounds,
            byRoundingCorners: .BottomLeft,
            cornerRadii: radii
        )

        let layer = view.layer as! CAShapeLayer
        let path = UIBezierPath(CGPath: layer.path!)

        XCTAssertEqual(path, expectedPath, "Updating the bottom left corner rounding flag should update the view's layer path")
    }

    //  MARK: Bottom-right

    func testBottomRightCornerRoundingFlagIsClearByDefault() {
        XCTAssertFalse(view.bottomRight, "The bottom right corner should not be rounded by default")
    }

    func testBottomRightCornerRoundingFlagMatchesRoundedCornersMembership() {
        view.roundedCorners = [.BottomRight]
        XCTAssertTrue(view.bottomRight, "The bottom right corner rounding flag should be active when the corner is included in the rounded corners set")

        view.roundedCorners = ViewCorners.All.subtract(.BottomRight)
        XCTAssertFalse(view.bottomRight, "The bottom right corner rounding flag should not be active when the corner is not included in the rounded corners set")
    }

    func testClearingBottomRightCornerRoundingFlagRemovesRoundedCornersMembership() {
        view.roundedCorners = .All
        view.bottomRight = false
        XCTAssertFalse(view.roundedCorners.contains(.BottomRight), "Clearing the bottom right corner rounding flag should remove the corner from the rounded corners set")
    }

    func testChangingBottomRightCornerRoundingFlagUpdatesLayerPath() {
        view.cornerRadius = 4.2
        view.bottomRight = true

        let expectedPath = UIBezierPath(
            roundedRect: view.bounds,
            byRoundingCorners: .BottomRight,
            cornerRadii: radii
        )

        let layer = view.layer as! CAShapeLayer
        let path = UIBezierPath(CGPath: layer.path!)

        XCTAssertEqual(path, expectedPath, "Updating the bottom right corner rounding flag should update the view's layer path")
    }

    //  MARK: - Opacity

    func testViewIsNotOpaqueWithCornerRounding() {
        view.cornerRadius = 4.2
        view.roundedCorners = .Top
        XCTAssertFalse(view.opaque, "The view should not be opaque when rounding corners")
    }

    func testViewIsOpaqueWithoutCornerRounding() {
        view.cornerRadius = 4.2
        XCTAssertTrue(view.opaque, "The view should be opaque when not rounding corners")

        view.cornerRadius = 0
        view.roundedCorners = .Top
        XCTAssertTrue(view.opaque, "The view should be opaque when not rounding corners")
    }

}
