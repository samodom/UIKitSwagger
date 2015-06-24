//
//  HSBComponentsTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 3/1/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest
@testable import UIKitSwagger

//  See `ColorTestHelpers.swift` for colors and values used herein.

class HSBComponentsTests: XCTestCase {

    var components =
    UIColorHSBComponents(
        hue: randomHueValue,
        saturation: randomSaturationValue,
        brightness: randomBrightnessValue,
        alpha: randomAlphaValue
    )

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    //  MARK: - Component values

    func testHueComponentWithRGBColor() {
        XCTAssertEqual(sampleRGBColor.hue, sampleRGBColor.hsbComponents.hue, "The hue component of the RGB color should be provided")
    }

    func testHueComponentWithHSBColor() {
        XCTAssertEqualWithAccuracy(sampleHSBColor.hue, randomHueValue, accuracy: ColorComponentValueTestAccuracy, "The hue component of the HSB color should be provided")
    }

    func testHueComponentWithMonochromeColor() {
        XCTAssertEqual(sampleMonochromeColor.hue, sampleMonochromeColor.hsbComponents.hue, "The hue component of the monochrome color should be provided")
    }

    func testSaturationComponentWithRGBColor() {
        XCTAssertEqual(sampleRGBColor.saturation, sampleRGBColor.hsbComponents.saturation, "The saturation component of the RGB color should be provided")
    }

    func testSaturationComponentWithHSBColor() {
        XCTAssertEqualWithAccuracy(sampleHSBColor.saturation, randomSaturationValue, accuracy: ColorComponentValueTestAccuracy, "The saturation component of the HSB color should be provided")
    }

    func testSaturationComponentWithMonochromeColor() {
        XCTAssertEqual(sampleMonochromeColor.saturation, sampleMonochromeColor.hsbComponents.saturation, "The saturation component of the monochrome color should be provided")
    }

    func testBrightnessComponentWithRGBColor() {
        XCTAssertEqual(sampleRGBColor.brightness, sampleRGBColor.hsbComponents.brightness, "The brightness component of the RGB color should be provided")
    }

    func testBrightnessComponentWithHSBColor() {
        XCTAssertEqualWithAccuracy(sampleHSBColor.brightness, randomBrightnessValue, accuracy: ColorComponentValueTestAccuracy, "The brightness component of the HSB color should be provided")
    }

    func testBrightnessComponentWithMonochromeColor() {
        XCTAssertEqual(sampleMonochromeColor.brightness, sampleMonochromeColor.hsbComponents.brightness, "The white component of the monochrome color should be provided")
    }
    
    //  MARK: Components structure

    func testHSBComponentStructureWithDefaultAlpha() {
        components = UIColorHSBComponents(
            hue: randomHueValue,
            saturation: randomSaturationValue,
            brightness: randomBrightnessValue
        )
        XCTAssertEqual(components.hue, randomHueValue, "The components should include a hue value")
        XCTAssertEqual(components.saturation, randomSaturationValue, "The components should include a saturation value")
        XCTAssertEqual(components.brightness, randomBrightnessValue, "The components should include a brightness value")
        XCTAssertEqual(components.alpha, 1.0, "The components should use a default alpha value of 1.0")
    }

    func testHSBComponentStructure() {
        XCTAssertEqual(components.hue, randomHueValue, "The components should include a hue value")
        XCTAssertEqual(components.saturation, randomSaturationValue, "The components should include a saturation value")
        XCTAssertEqual(components.brightness, randomBrightnessValue, "The components should include a brightness value")
        XCTAssertEqual(components.alpha, randomAlphaValue, "The components should include an alpha value")
    }

    //  MARK: Equality

    func testEqualityOfHSBComponentStructure() {
        let moreComponents =
        UIColorHSBComponents(
            hue: randomHueValue,
            saturation: randomSaturationValue,
            brightness: randomBrightnessValue,
            alpha: randomAlphaValue
        )
        XCTAssertEqual(components, moreComponents, "The components should be considered equal")
    }

    func testInequalityOfHSBComponentsWithMismatchedHueValues() {
        let moreComponents =
        UIColorHSBComponents(
            hue: nudgeComponentValue(randomHueValue),
            saturation: randomSaturationValue,
            brightness: randomBrightnessValue,
            alpha: randomAlphaValue
        )
        XCTAssertNotEqual(components, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfHSBComponentsWithMismatchedSaturationValues() {
        let moreComponents =
        UIColorHSBComponents(
            hue: randomHueValue,
            saturation: nudgeComponentValue(randomSaturationValue),
            brightness: randomBrightnessValue,
            alpha: randomAlphaValue
        )
        XCTAssertNotEqual(components, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfHSBComponentsWithMismatchedBrightnessValues() {
        let moreComponents =
        UIColorHSBComponents(
            hue: randomHueValue,
            saturation: randomSaturationValue,
            brightness: nudgeComponentValue(randomBrightnessValue),
            alpha: randomAlphaValue
        )
        XCTAssertNotEqual(components, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfHSBComponentsWithMismatchedAlphaValues() {
        let moreComponents =
        UIColorHSBComponents(
            hue: randomHueValue,
            saturation: randomSaturationValue,
            brightness: randomBrightnessValue,
            alpha: nudgeComponentValue(randomAlphaValue)
        )
        XCTAssertNotEqual(components, moreComponents, "The components should not be considered equal")
    }

    //  MARK: Creating components from colors

    func testHSBComponentsWithRGBColor() {
        var hueValue = CGFloat(0)
        var saturationValue = CGFloat(0)
        var brightnessValue = CGFloat(0)
        var alphaValue = CGFloat(0)
        sampleRGBColor.getHue(&hueValue, saturation: &saturationValue, brightness: &brightnessValue, alpha: &alphaValue)
        components = UIColorHSBComponents(
            hue: hueValue,
            saturation: saturationValue,
            brightness: brightnessValue,
            alpha: alphaValue
        )
        XCTAssertEqual(sampleRGBColor.hsbComponents, components, "The hue, saturation, brightness and alpha components of the color should be provided")
    }

    func testHSBComponentsWithHSBColor() {
        XCTAssertEqual(sampleHSBColor.hsbComponents, components, "The hue, saturation, brightness and alpha components of the color should be provided")
    }

    func testHSBComponentsWithMonochromeColor() {
        var hueValue = CGFloat(0)
        var saturationValue = CGFloat(0)
        var brightnessValue = CGFloat(0)
        var alphaValue = CGFloat(0)
        sampleMonochromeColor.getHue(&hueValue, saturation: &saturationValue, brightness: &brightnessValue, alpha: &alphaValue)
        components = UIColorHSBComponents(
            hue: hueValue,
            saturation: saturationValue,
            brightness: brightnessValue,
            alpha: alphaValue
        )
        XCTAssertEqual(sampleMonochromeColor.hsbComponents, components, "The hue, saturation, brightness and alpha components of the color should be provided")
    }

    //  MARK: Creating colors from components

    func testColorCreationWithHSBComponents() {
        XCTAssertEqual(components.color(), sampleHSBColor, "The components should create an instance of UIColor using the same values")
    }

}
