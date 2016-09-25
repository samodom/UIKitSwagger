//
//  GrayscaleComponentsTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 3/1/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest
@testable import UIKitSwagger

//  See `ColorTestHelpers.swift` for colors and values used herein.

class GrayscaleComponentsTests: XCTestCase {

    var components = GrayscaleComponents(
        white: randomWhiteValue,
        alpha: randomAlphaValue
    )

    //  MARK: - Component values

    func testWhiteComponentWithRGBColor() {
        XCTAssertEqual(sampleRGBColor.white, sampleRGBColor.grayscaleComponents.white, "The white component of the RGB color should be provided")
    }

    func testWhiteComponentWithHSBColor() {
        XCTAssertEqual(sampleHSBColor.white, sampleHSBColor.grayscaleComponents.white, "The white component of the HSB color should be provided")
    }

    func testWhiteComponentWithMonochromeColor() {
        XCTAssertEqualWithAccuracy(sampleMonochromeColor.white, randomWhiteValue, accuracy: ColorComponentValueTestAccuracy, "The white component of the monochrome color should be provided")
    }
    
    //  MARK: - Components structure

    func testGrayscaleComponentStructureWithDefaultAlpha() {
        components = GrayscaleComponents(white: randomWhiteValue)
        XCTAssertEqual(components.white, randomWhiteValue, "The components should include a white value")
        XCTAssertEqual(components.alpha, 1, "The components should use a default alpha value of 1.0")
    }

    func testGrayscaleComponentStructure() {
        XCTAssertEqual(components.white, randomWhiteValue, "The components should include a white value")
        XCTAssertEqual(components.alpha, randomAlphaValue, "The components should include an alpha value")
    }

    //  MARK: Equality

    func testEqualityOfGrayscaleComponentStructure() {
        let moreComponents = GrayscaleComponents(
            white: randomWhiteValue,
            alpha: randomAlphaValue
        )
        XCTAssertEqual(components, moreComponents, "The components should be considered equal")
    }

    func testInequalityOfGrayscaleComponentsWithMismatchedWhiteValues() {
        let moreComponents = GrayscaleComponents(
            white: nudgeComponentValue(randomWhiteValue),
            alpha: randomAlphaValue
        )
        XCTAssertNotEqual(components, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfGrayscaleComponentsWithMismatchedAlphaValues() {
        let moreComponents = GrayscaleComponents(
            white: randomWhiteValue,
            alpha: nudgeComponentValue(randomAlphaValue)
        )
        XCTAssertNotEqual(components, moreComponents, "The components should not be considered equal")
    }

    //  MARK: Creating components from colors

    func testGrayscaleComponentsWithRGBColor() {
        var whiteValue: CGFloat = 0
        var alphaValue: CGFloat = 0
        sampleRGBColor.getWhite(&whiteValue, alpha: &alphaValue)
        components = GrayscaleComponents(
            white: whiteValue,
            alpha: alphaValue
        )
        XCTAssertEqual(sampleRGBColor.grayscaleComponents, components, "The white and alpha components of the color should be provided")
    }

    func testGrayscaleComponentsWithHSBColor() {
        var whiteValue: CGFloat = 0
        var alphaValue: CGFloat = 0
        sampleHSBColor.getWhite(&whiteValue, alpha: &alphaValue)
        components = GrayscaleComponents(
            white: whiteValue,
            alpha: alphaValue
        )
        XCTAssertEqual(sampleHSBColor.grayscaleComponents, components, "The white and alpha components of the color should be provided")
    }

    func testGrayscaleComponentsWithMonochromeColor() {
        XCTAssertEqual(sampleMonochromeColor.grayscaleComponents, components, "The white and alpha components of the color should be provided")
    }

    //  MARK: Creating colors from components

    func testColorCreationWithGrayscaleComponents() {
        XCTAssertEqual(components.uiColor, sampleMonochromeColor, "The components should create an instance of UIColor using the same values")
    }

}
