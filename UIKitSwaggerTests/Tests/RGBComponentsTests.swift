//
//  RGBComponentsTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 3/1/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest
@testable import UIKitSwagger

//  See `ColorTestHelpers.swift` for colors and values used herein.

class RGBComponentsTests: XCTestCase {

    var components = RGBComponents(
        red: randomRedValue,
        green: randomGreenValue,
        blue: randomBlueValue,
        alpha: randomAlphaValue
    )

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    //  MARK: - Component values

    func testRedComponentWithRGBColor() {
        XCTAssertEqual(sampleRGBColor.red, randomRedValue, "The red component of the RGB color should be provided")
    }

    func testRedComponentWithHSBColor() {
        XCTAssertEqual(sampleHSBColor.red, sampleHSBColor.rgbComponents.red, "The red component of the HSB color should be provided")
    }

    func testRedComponentWithMonochromeColor() {
        XCTAssertEqual(sampleMonochromeColor.red, sampleMonochromeColor.rgbComponents.red, "The white component of the monochrome color should be provided")
    }

    func testGreenComponentWithRGBColor() {
        XCTAssertEqualWithAccuracy(sampleRGBColor.green, randomGreenValue, accuracy: ColorComponentValueTestAccuracy, "The green component of the RGB color should be provided")
    }

    func testGreenComponentWithHSBColor() {
        XCTAssertEqual(sampleHSBColor.green, sampleHSBColor.rgbComponents.green, "The green component of the HSB color should be provided")
    }

    func testGreenComponentWithMonochromeColor() {
        XCTAssertEqual(sampleMonochromeColor.green, sampleMonochromeColor.rgbComponents.green, "The white component of the monochrome color should be provided")
    }

    func testBlueComponentWithRGBColor() {
        XCTAssertEqualWithAccuracy(sampleRGBColor.blue, randomBlueValue, accuracy: ColorComponentValueTestAccuracy, "The blue component of the RGB color should be provided")
    }

    func testBlueComponentWithHSBColor() {
        XCTAssertEqual(sampleHSBColor.blue, sampleHSBColor.rgbComponents.blue, "The blue component of the HSB color should be provided")
    }

    func testBlueComponentWithMonochromeColor() {
        XCTAssertEqual(sampleMonochromeColor.blue, sampleMonochromeColor.rgbComponents.blue, "The white component of the monochrome color should be provided")
    }

    func testAlphaComponentWithRGBColor() {
        XCTAssertEqual(sampleRGBColor.alpha, randomAlphaValue, "The alpha component of the RGB color should be provided")
    }

    func testAlphaComponentWithHSBColor() {
        XCTAssertEqual(sampleHSBColor.alpha, randomAlphaValue, "The alpha component of the HSB color should be provided")
    }

    func testAlphaComponentWithMonochromeColor() {
        XCTAssertEqual(sampleMonochromeColor.alpha, randomAlphaValue, "The alpha component of the monochrome color should be provided")
    }

    //  MARK: - Components structure

    func testRGBComponentStructureWithDefaultAlpha() {
        components = RGBComponents(
            red: randomRedValue,
            green: randomGreenValue,
            blue: randomBlueValue
        )
        XCTAssertEqual(components.red, randomRedValue, "The components should include a red value")
        XCTAssertEqual(components.green, randomGreenValue, "The components should include a green value")
        XCTAssertEqual(components.blue, randomBlueValue, "The components should include a blue value")
        XCTAssertEqual(components.alpha, 1.0, "The components should use a default alpha value of 1.0")
    }

    func testRGBComponentStructure() {
        XCTAssertEqual(components.red, randomRedValue, "The components should include a red value")
        XCTAssertEqual(components.green, randomGreenValue, "The components should include a green value")
        XCTAssertEqual(components.blue, randomBlueValue, "The components should include a blue value")
        XCTAssertEqual(components.alpha, randomAlphaValue, "The components should include an alpha value")
    }

    //  MARK:  Equality

    func testEqualityOfRGBComponentStructure() {
        let moreComponents = RGBComponents(
            red: randomRedValue,
            green: randomGreenValue,
            blue: randomBlueValue,
            alpha: randomAlphaValue
        )
        XCTAssertEqual(components, moreComponents, "The components should be considered equal")
    }

    func testInequalityOfRGBComponentsWithMismatchedRedValues() {
        let moreComponents = RGBComponents(
            red: nudgeComponentValue(randomRedValue),
            green: randomGreenValue,
            blue: randomBlueValue,
            alpha: randomAlphaValue
        )
        XCTAssertNotEqual(components, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfRGBComponentsWithMismatchedGreenValues() {
        let moreComponents = RGBComponents(
            red: randomRedValue,
            green: nudgeComponentValue(randomGreenValue),
            blue: randomBlueValue,
            alpha: randomAlphaValue
        )
        XCTAssertNotEqual(components, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfRGBComponentsWithMismatchedBlueValues() {
        let moreComponents = RGBComponents(
            red: randomRedValue,
            green: randomGreenValue,
            blue: nudgeComponentValue(randomBlueValue),
            alpha: randomAlphaValue
        )
        XCTAssertNotEqual(components, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfRGBComponentsWithMismatchedAlphaValues() {
        let moreComponents = RGBComponents(
            red: randomRedValue,
            green: randomGreenValue,
            blue: randomBlueValue,
            alpha: nudgeComponentValue(randomAlphaValue)
        )
        XCTAssertNotEqual(components, moreComponents, "The components should not be considered equal")
    }

    //  MARK: Creating components from colors

    func testRGBComponentsWithRGBColor() {
        XCTAssertEqual(sampleRGBColor.rgbComponents, components, "The red, green, blue and alpha components of the color should be provided")
    }

    func testRGBComponentsWithHSBColor() {
        var redValue = CGFloat(0)
        var greenValue = CGFloat(0)
        var blueValue = CGFloat(0)
        var alphaValue = CGFloat(0)
        sampleHSBColor.getRed(&redValue,
            green: &greenValue,
            blue: &blueValue,
            alpha: &alphaValue
        )
        components = RGBComponents(
            red: redValue,
            green: greenValue,
            blue: blueValue,
            alpha: alphaValue
        )
        XCTAssertEqual(sampleHSBColor.rgbComponents, components, "The red, green, blue and alpha components of the color should be provided")
    }

    func testRGBComponentsWithMonochromeColor() {
        var redValue = CGFloat(0)
        var greenValue = CGFloat(0)
        var blueValue = CGFloat(0)
        var alphaValue = CGFloat(0)
        sampleMonochromeColor.getRed(&redValue,
            green: &greenValue,
            blue: &blueValue,
            alpha: &alphaValue
        )
        components = RGBComponents(
            red: redValue,
            green: greenValue,
            blue: blueValue,
            alpha: alphaValue
        )
        XCTAssertEqual(sampleMonochromeColor.rgbComponents, components, "The red, green, blue and alpha components of the color should be provided")
    }

    //  MARK: Creating colors from components

    func testColorCreationWithRGBComponents() {
        XCTAssertEqual(components.color(), sampleRGBColor, "The components should create an instance of UIColor using the same values")
    }

}
