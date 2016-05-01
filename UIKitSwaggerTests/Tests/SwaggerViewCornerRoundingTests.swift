//
//  SwaggerViewCornerRoundingTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 4/25/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import XCTest
import UIKitSwagger

class SwaggerViewCornerRoundingTests: XCTestCase {

    let view = SwaggerView()
    let radius: CGFloat = 4.2

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

//    func test<#Name#>() {

    }


    //  MARK: Rounded corners

    func testAllCornersAreRoundedByDefault() {
        XCTAssertEqual(view.roundedCorners, UIRectCorner.AllCorners, "All corners should be rounded by default")
    }

    func testSettingRoundedCorners() {
        view.roundedCorners = [.TopLeft, .BottomRight]
        XCTAssertEqual(view.roundedCorners, [.TopLeft, .BottomRight], "Should be able to change the rounded corners")

        view.roundedCorners = [.TopRight]
        XCTAssertEqual(view.roundedCorners, [.TopRight], "Should be able to change the rounded corners")
    }

    func testMixingIndividualCornersWithAllCornersIgnoresIndividualCorners() {
        view.roundedCorners = [.TopLeft, .AllCorners]
        XCTAssertEqual(view.roundedCorners, [.AllCorners], "If all corners are provided, exactly that should be used")
    }

    func testAddingAllIndividualCornersUsesAllCorners() {
        view.roundedCorners = [.TopLeft, .TopRight, .BottomLeft, .BottomRight]
        XCTAssertEqual(view.roundedCorners, [.AllCorners], "If all corners are provided, exactly that should be used")
    }

    func testClearingRoundedCornersRoundsAllCorners() {
        view.roundedCorners = []
        XCTAssertEqual(view.roundedCorners, UIRectCorner.AllCorners, "Clearing the rounded corners should reset them to all corners")
    }

    // set needs display

    //  MARK: Corner-rounding flags

    //  MARK: Top-left

    func testTopLeftCornerRoundingFlagIsSetByDefault() {
        XCTAssertTrue(view.topLeftCornerRounded, "The top left corner should be rounded by default")
    }

    func testTopLeftCornerRoundingFlagMatchesRoundedCornersMembership() {
        view.roundedCorners = [.TopLeft]
        XCTAssertTrue(view.topLeftCornerRounded, "The top left corner rounding flag should be active when the corner is included in the rounded corners set")

        view.roundedCorners = [.TopRight, .BottomLeft, .BottomRight]
        XCTAssertFalse(view.topLeftCornerRounded, "The top left corner rounding flag should not be active when the corner is not included in the rounded corners set")
    }

    func testClearingTopLeftCornerRoundingFlagRemovesRoundedCornersMembership() {
        precondition(view.topLeftCornerRounded)
        view.topLeftCornerRounded = false
        XCTAssertFalse(view.roundedCorners.contains(.TopLeft), "Clearing the top left corner rounding flag should remove the corner from the rounded corners set")
    }

    // set needs display

    //  MARK: Top-right

    func testTopRightCornerRoundingFlagIsSetByDefault() {
        XCTAssertTrue(view.topRightCornerRounded, "The top right corner should be rounded by default")
    }

    func testTopRightCornerRoundingFlagMatchesRoundedCornersMembership() {
        view.roundedCorners = [.TopRight]
        XCTAssertTrue(view.topRightCornerRounded, "The top right corner rounding flag should be active when the corner is included in the rounded corners set")

        view.roundedCorners = [.TopLeft, .BottomRight, .BottomRight]
        XCTAssertFalse(view.topRightCornerRounded, "The top right corner rounding flag should not be active when the corner is not included in the rounded corners set")
    }

    func testClearingTopRightCornerRoundingFlagRemovesRoundedCornersMembership() {
        precondition(view.topRightCornerRounded)
        view.topRightCornerRounded = false
        XCTAssertFalse(view.roundedCorners.contains(.TopRight), "Clearing the top right corner rounding flag should remove the corner from the rounded corners set")
    }

    // set needs display

    //  MARK: Bottom-left

    func testBottomLeftCornerRoundingFlagIsSetByDefault() {
        XCTAssertTrue(view.bottomLeftCornerRounded, "The bottom left corner should be rounded by default")
    }

    func testBottomLeftCornerRoundingFlagMatchesRoundedCornersMembership() {
        view.roundedCorners = [.BottomLeft]
        XCTAssertTrue(view.bottomLeftCornerRounded, "The bottom left corner rounding flag should be active when the corner is included in the rounded corners set")

        view.roundedCorners = [.TopRight, .TopLeft, .BottomRight]
        XCTAssertFalse(view.bottomLeftCornerRounded, "The bottom left corner rounding flag should not be active when the corner is not included in the rounded corners set")
    }

    func testClearingBottomLeftCornerRoundingFlagRemovesRoundedCornersMembership() {
        precondition(view.bottomLeftCornerRounded)
        view.bottomLeftCornerRounded = false
        XCTAssertFalse(view.roundedCorners.contains(.BottomLeft), "Clearing the bottom left corner rounding flag should remove the corner from the rounded corners set")
    }

    // set needs display

    //  MARK: Bottom-right

    func testBottomRightCornerRoundingFlagIsSetByDefault() {
        XCTAssertTrue(view.bottomRightCornerRounded, "The bottom right corner should be rounded by default")
    }

    func testBottomRightCornerRoundingFlagMatchesRoundedCornersMembership() {
        view.roundedCorners = [.BottomRight]
        XCTAssertTrue(view.bottomRightCornerRounded, "The bottom right corner rounding flag should be active when the corner is included in the rounded corners set")

        view.roundedCorners = [.TopLeft, .TopRight, .BottomLeft]
        XCTAssertFalse(view.bottomRightCornerRounded, "The bottom right corner rounding flag should not be active when the corner is not included in the rounded corners set")
    }

    func testClearingBottomRightCornerRoundingFlagRemovesRoundedCornersMembership() {
        precondition(view.bottomRightCornerRounded)
        view.bottomRightCornerRounded = false
        XCTAssertFalse(view.roundedCorners.contains(.BottomRight), "Clearing the bottom right corner rounding flag should remove the corner from the rounded corners set")
    }
    
    // set needs display

    func testClearingAllCornerRoundingFlagsResetsAllFlags() {
        view.topLeftCornerRounded = false
        view.topRightCornerRounded = false
        view.bottomLeftCornerRounded = false
        view.bottomRightCornerRounded = false
        XCTAssertTrue(view.topLeftCornerRounded, "All corner rounding flags should have been reset")
        XCTAssertTrue(view.topRightCornerRounded, "All corner rounding flags should have been reset")
        XCTAssertTrue(view.bottomLeftCornerRounded, "All corner rounding flags should have been reset")
        XCTAssertTrue(view.bottomRightCornerRounded, "All corner rounding flags should have been reset")
    }


    // set needs display

    // set needs display

}
