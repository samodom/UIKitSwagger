//
//  CMYKComponentsTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 3/1/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest
@testable import UIKitSwagger

//  See `ColorTestHelpers.swift` for colors and values used herein.

class CMYKComponentsTests: XCTestCase {

    var components = CMYKComponents(
        cyan: randomCyanValue,
        magenta: randomMagentaValue,
        yellow: randomYellowValue,
        key: randomKeyValue,
        alpha: randomAlphaValue
    )

    var expectedCyan = CGFloat(0)
    var expectedMagenta = CGFloat(0)
    var expectedYellow = CGFloat(0)
    var expectedKey = CGFloat(0)

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    private func computeExpectedCMYKValuesForColor(color: UIColor) {
        let maximumValue = max(color.red, color.green, color.blue)
        if maximumValue > 0 {
            expectedCyan = 1 - (color.red / maximumValue)
            expectedMagenta = 1 - (color.green / maximumValue)
            expectedYellow = 1 - (color.blue / maximumValue)
            expectedKey = 1 - maximumValue
        }
        else {
            expectedCyan = 0
            expectedMagenta = 0
            expectedYellow = 0
            expectedKey = 1
        }
    }

    //  MARK: - Component values

    func testGettingCMYKComponentValues() {
        computeExpectedCMYKValuesForColor(sampleRGBColor)
        var cyanValue = CGFloat(0)
        var magentaValue = CGFloat(0)
        var yellowValue = CGFloat(0)
        var keyValue = CGFloat(0)
        var alphaValue = CGFloat(0)
        let success =
        sampleRGBColor.getCyan(
            &cyanValue,
            magenta: &magentaValue,
            yellow: &yellowValue,
            key: &keyValue,
            alpha: &alphaValue
        )
        XCTAssertTrue(success, "The method should always return true")
        XCTAssertEqual(cyanValue, expectedCyan, "The cyan value should be correctly calculated")
        XCTAssertEqual(magentaValue, expectedMagenta, "The magenta value should be correctly calculated")
        XCTAssertEqual(yellowValue, expectedYellow, "The yellow value should be correctly calculated")
        XCTAssertEqual(keyValue, expectedKey, "The key value should be correctly calculated")
        XCTAssertEqual(alphaValue, randomAlphaValue, "The alpha value should be produced")
    }

    func testCyanComponentWithRGBColor() {
        computeExpectedCMYKValuesForColor(sampleRGBColor)
        XCTAssertEqual(sampleRGBColor.cyan, expectedCyan, "The cyan component of the RGB color should be provided")
    }

    func testCyanComponentWithHSBColor() {
        computeExpectedCMYKValuesForColor(sampleHSBColor)
        XCTAssertEqual(sampleHSBColor.cyan, expectedCyan, "The cyan component of the HSB color should be provided")
    }

    func testCyanComponentWithMonochromeColor() {
        XCTAssertEqual(sampleMonochromeColor.cyan, 0, "The cyan component of the monochrome color should be provided")
    }

    func testMagentaComponentWithRGBColor() {
        computeExpectedCMYKValuesForColor(sampleRGBColor)
        XCTAssertEqual(sampleRGBColor.magenta, expectedMagenta, "The magenta component of the RGB color should be provided")
    }

    func testMagentaComponentWithHSBColor() {
        computeExpectedCMYKValuesForColor(sampleHSBColor)
        XCTAssertEqual(sampleHSBColor.magenta, expectedMagenta, "The magenta component of the HSB color should be provided")
    }

    func testMagentaComponentWithMonochromeColor() {
        XCTAssertEqual(sampleMonochromeColor.magenta, 0, "The magenta component of the monochrome color should be provided")
    }

    func testYellowComponentWithRGBColor() {
        computeExpectedCMYKValuesForColor(sampleRGBColor)
        XCTAssertEqual(sampleRGBColor.yellow, expectedYellow, "The yellow component of the RGB color should be provided")
    }

    func testYellowComponentWithHSBColor() {
        computeExpectedCMYKValuesForColor(sampleHSBColor)
        XCTAssertEqual(sampleHSBColor.yellow, expectedYellow, "The yellow component of the HSB color should be provided")
    }

    func testYellowComponentWithMonochromeColor() {
        XCTAssertEqual(sampleMonochromeColor.yellow, 0, "The yellow component of the monochrome color should be provided")
    }

    func testKeyComponentWithRGBColor() {
        computeExpectedCMYKValuesForColor(sampleRGBColor)
        XCTAssertEqual(sampleRGBColor.key, expectedKey, "The key component of the RGB color should be provided")
    }

    func testKeyComponentWithHSBColor() {
        computeExpectedCMYKValuesForColor(sampleHSBColor)
        XCTAssertEqual(sampleHSBColor.key, expectedKey, "The alpha component of the HSB color should be provided")
    }

    func testKeyComponentWithMonochromeColor() {
        expectedKey = 1 - sampleMonochromeColor.white
        XCTAssertEqual(sampleMonochromeColor.key, expectedKey, "The alpha component of the monochrome color should be provided")
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

    func testCMYKComponentStructureWithDefaultAlpha() {
        components = CMYKComponents(
            cyan: randomCyanValue,
            magenta: randomMagentaValue,
            yellow: randomYellowValue,
            key: randomKeyValue
        )
        XCTAssertEqual(components.cyan, randomCyanValue, "The components should include a cyan value")
        XCTAssertEqual(components.magenta, randomMagentaValue, "The components should include a magenta value")
        XCTAssertEqual(components.yellow, randomYellowValue, "The components should include a yellow value")
        XCTAssertEqual(components.key, randomKeyValue, "The components should include a key value")
        XCTAssertEqual(components.alpha, 1.0, "The components should use a default alpha value of 1.0")
    }

    func testCMYKComponentStructure() {
        XCTAssertEqual(components.cyan, randomCyanValue, "The components should include a cyan value")
        XCTAssertEqual(components.magenta, randomMagentaValue, "The components should include a magenta value")
        XCTAssertEqual(components.yellow, randomYellowValue, "The components should include a yellow value")
        XCTAssertEqual(components.key, randomKeyValue, "The components should include a key value")
        XCTAssertEqual(components.alpha, randomAlphaValue, "The components should include an alpha value")
    }

    //  MARK: Equality

    func testEqualityOfCMYKComponentStructure() {
        let moreComponents = CMYKComponents(
            cyan: randomCyanValue,
            magenta: randomMagentaValue,
            yellow: randomYellowValue,
            key: randomKeyValue,
            alpha: randomAlphaValue
        )
        XCTAssertEqual(components, moreComponents, "The components should be considered equal")
    }

    func testInequalityOfCMYKComponentsWithMismatchedCyanValues() {
        let moreComponents = CMYKComponents(
            cyan: nudgeComponentValue(randomCyanValue),
            magenta: randomMagentaValue,
            yellow: randomYellowValue,
            key: randomKeyValue,
            alpha: randomAlphaValue
        )
        XCTAssertNotEqual(components, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfCMYKComponentsWithMismatchedMagentaValues() {
        let moreComponents = CMYKComponents(
            cyan: randomCyanValue,
            magenta: nudgeComponentValue(randomMagentaValue),
            yellow: randomYellowValue, 
            key: randomKeyValue,
            alpha: randomAlphaValue
        )
        XCTAssertNotEqual(components, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfCMYKComponentsWithMismatchedYellowValues() {
        let moreComponents = CMYKComponents(
            cyan: randomCyanValue,
            magenta: randomMagentaValue,
            yellow: nudgeComponentValue(randomYellowValue),
            key: randomKeyValue,
            alpha: randomAlphaValue
        )
        XCTAssertNotEqual(components, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfCMYKComponentsWithMismatchedKeyValues() {
        let moreComponents = CMYKComponents(
            cyan: randomCyanValue,
            magenta: randomMagentaValue,
            yellow: randomYellowValue,
            key: nudgeComponentValue(randomKeyValue),
            alpha: randomAlphaValue
        )
        XCTAssertNotEqual(components, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfCMYKComponentsWithMismatchedAlphaValues() {
        let moreComponents = CMYKComponents(
            cyan: randomCyanValue,
            magenta: randomMagentaValue,
            yellow: randomYellowValue,
            key: randomKeyValue,
            alpha: nudgeComponentValue(randomAlphaValue)
        )
        XCTAssertNotEqual(components, moreComponents, "The components should not be considered equal")
    }

    //  MARK: Creating components from colors

    func testCMYKComponentsWithRGBColor() {
        computeExpectedCMYKValuesForColor(sampleRGBColor)
        components = CMYKComponents(
            cyan: expectedCyan,
            magenta: expectedMagenta,
            yellow: expectedYellow,
            key: expectedKey,
            alpha: randomAlphaValue
        )
        XCTAssertEqual(sampleRGBColor.cmykComponents, components, "The cyan, magenta, yellow, key and alpha components of the color should be provided")
    }

    func testCMYKComponentsWithHSBColor() {
        computeExpectedCMYKValuesForColor(sampleHSBColor)
        components = CMYKComponents(
            cyan: expectedCyan,
            magenta: expectedMagenta,
            yellow: expectedYellow,
            key: expectedKey,
            alpha: randomAlphaValue
        )
        XCTAssertEqual(sampleHSBColor.cmykComponents, components, "The cyan, magenta, yellow, key and alpha components of the color should be provided")
    }

    func testCMYKComponentsWithMonochromeColor() {
        expectedKey = 1 - sampleMonochromeColor.white
        components = CMYKComponents(
            cyan: 0,
            magenta: 0,
            yellow: 0,
            key: expectedKey,
            alpha: randomAlphaValue
        )
        XCTAssertEqual(sampleMonochromeColor.cmykComponents, components, "The cyan, magenta, yellow, key and alpha components of the color should be provided")
    }

    //  MARK: Reference colors

    func testCMYKComponentsWithBlackColor() {
        components = Black.cmykComponents
        let expected = CMYKComponents(
            cyan: 0,
            magenta: 0,
            yellow: 0,
            key: 1,
            alpha: 1
        )
        XCTAssertEqual(components, expected, "Black should produce the appropriate CMYK components")
    }

    func testCMYKComponentsWithWhiteColor() {
        components = White.cmykComponents
        let expected = CMYKComponents(
            cyan: 0,
            magenta: 0,
            yellow: 0,
            key: 0,
            alpha: 1
        )
        XCTAssertEqual(components, expected, "White should produce the appropriate CMYK components")
    }

    func testCMYKComponentsWithRedColor() {
        components = Red.cmykComponents
        let expected = CMYKComponents(
            cyan: 0,
            magenta: 1,
            yellow: 1,
            key: 0,
            alpha: 1
        )
        XCTAssertEqual(components, expected, "Red should produce the appropriate CMYK components")
    }

    func testCMYKComponentsWithGreenColor() {
        components = Green.cmykComponents
        let expected = CMYKComponents(
            cyan: 1,
            magenta: 0,
            yellow: 1,
            key: 0,
            alpha: 1
        )
        XCTAssertEqual(components, expected, "Green should produce the appropriate CMYK components")
    }

    func testCMYKComponentsWithBlueColor() {
        components = Blue.cmykComponents
        let expected = CMYKComponents(
            cyan: 1,
            magenta: 1,
            yellow: 0,
            key: 0,
            alpha: 1
        )
        XCTAssertEqual(components, expected, "Blue should produce the appropriate CMYK components")
    }

    func testCMYKComponentsWithCyanColor() {
        components = Cyan.cmykComponents
        let expected = CMYKComponents(
            cyan: 1,
            magenta: 0,
            yellow: 0,
            key: 0,
            alpha: 1
        )
        XCTAssertEqual(components, expected, "Cyan should produce the appropriate CMYK components")
    }

    func testCMYKComponentsWithMagentaColor() {
        components = Magenta.cmykComponents
        let expected = CMYKComponents(
            cyan: 0,
            magenta: 1,
            yellow: 0,
            key: 0,
            alpha: 1
        )
        XCTAssertEqual(components, expected, "Magenta should produce the appropriate CMYK components")
    }

    func testCMYKComponentsWithYellowColor() {
        components = Yellow.cmykComponents
        let expected = CMYKComponents(
            cyan: 0,
            magenta: 0,
            yellow: 1,
            key: 0,
            alpha: 1
        )
        XCTAssertEqual(components, expected, "Yellow should produce the appropriate CMYK components")
    }

    //  MARK: Creating colors from components

    func testColorCreationWithCMYKComponentValues() {
        let color = UIColor(
            cyan: randomCyanValue,
            magenta: randomMagentaValue,
            yellow: randomYellowValue,
            key: randomKeyValue,
            alpha: randomAlphaValue
        )
        XCTAssertEqual(color, components.asRGBComponents().color(), "The component values should be used to create an instance of UIColor")
    }

    func testColorCreationWithCMYKComponents() {
        XCTAssertEqual(components.color(), components.asRGBComponents().color(), "The components should create an instance of UIColor using its component values")
    }

}
