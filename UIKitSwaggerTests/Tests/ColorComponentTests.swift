//
//  ColorComponentTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class ColorComponentTests: XCTestCase {

    var rgbColor = UIColor(red: 0.14, green: 0.42, blue: 0.77, alpha: 0.99)
    var hsbColor = UIColor(hue: 0.33, saturation: 0.55, brightness: 0.66, alpha: 0.11)
    var monochromeColor = UIColor(white: 0.88, alpha: 0.8)
    var rgbComponents: UIColorRGBComponents!
    var hsbComponents: UIColorHSBComponents!
    var grayscaleComponents: UIColorGrayscaleComponents!

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    //  MARK: Non-components in initializer

    func testNonComponentsCreatesColorWithAllZeroRGBAValues() {
        struct NonComponents: UIColorComponents {
            private func color() -> UIColor {
                return UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            }
        }

        let components = UIColor(components: NonComponents())
        rgbComponents = UIColorRGBComponents(red: 0, green: 0, blue: 0, alpha: 0)
        XCTAssertEqual(components.rgbComponents, rgbComponents, "The color produced for unknown types conforming to `UIColorComponents` should have all zeros for component values")
    }

    //  MARK: UIColorRGBComponents

    func testRGBComponentStructureWithDefaultAlpha() {
        rgbComponents = UIColorRGBComponents(red: 0.14, green: 0.42, blue: 0.77)
        XCTAssertEqual(rgbComponents.red, CGFloat(0.14), "The components should include a red value")
        XCTAssertEqual(rgbComponents.green, CGFloat(0.42), "The components should include a green value")
        XCTAssertEqual(rgbComponents.blue, CGFloat(0.77), "The components should include a blue value")
        XCTAssertEqual(rgbComponents.alpha, CGFloat(1.0), "The components should use a default alpha value of 1.0")
    }

    func testRGBComponentStructure() {
        rgbComponents = UIColorRGBComponents(red: 0.14, green: 0.42, blue: 0.77, alpha: 0.99)
        XCTAssertEqual(rgbComponents.red, CGFloat(0.14), "The components should include a red value")
        XCTAssertEqual(rgbComponents.green, CGFloat(0.42), "The components should include a green value")
        XCTAssertEqual(rgbComponents.blue, CGFloat(0.77), "The components should include a blue value")
        XCTAssertEqual(rgbComponents.alpha, CGFloat(0.99), "The components should include an alpha value")
    }

    func testEqualityOfRGBComponentStructure() {
        rgbComponents = UIColorRGBComponents(red: 0.14, green: 0.42, blue: 0.77, alpha: 0.99)
        let moreComponents = UIColorRGBComponents(red: 0.14, green: 0.42, blue: 0.77, alpha: 0.99)
        XCTAssertEqual(rgbComponents, moreComponents, "The components should be considered equal")
    }

    func testInequalityOfRGBComponentsWithMismatchedRedValues() {
        rgbComponents = UIColorRGBComponents(red: 0.14, green: 0.42, blue: 0.77, alpha: 0.99)
        let moreComponents = UIColorRGBComponents(red: 0.15, green: 0.42, blue: 0.77, alpha: 0.99)
        XCTAssertNotEqual(rgbComponents, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfRGBComponentsWithMismatchedGreenValues() {
        rgbComponents = UIColorRGBComponents(red: 0.14, green: 0.42, blue: 0.77, alpha: 0.99)
        let moreComponents = UIColorRGBComponents(red: 0.14, green: 0.41, blue: 0.77, alpha: 0.99)
        XCTAssertNotEqual(rgbComponents, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfRGBComponentsWithMismatchedBlueValues() {
        rgbComponents = UIColorRGBComponents(red: 0.14, green: 0.42, blue: 0.77, alpha: 0.99)
        let moreComponents = UIColorRGBComponents(red: 0.14, green: 0.42, blue: 0.78, alpha: 0.99)
        XCTAssertNotEqual(rgbComponents, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfRGBComponentsWithMismatchedAlphaValues() {
        rgbComponents = UIColorRGBComponents(red: 0.14, green: 0.42, blue: 0.77, alpha: 0.99)
        let moreComponents = UIColorRGBComponents(red: 0.14, green: 0.42, blue: 0.77, alpha: 0.98)
        XCTAssertNotEqual(rgbComponents, moreComponents, "The components should not be considered equal")
    }

    func testRGBComponentsWithRGBColor() {
        rgbComponents = UIColorRGBComponents(red: 0.14, green: 0.42, blue: 0.77, alpha: 0.99)
        XCTAssertEqual(rgbColor.rgbComponents, rgbComponents, "The red, green, blue and alpha components of the color should be provided")
    }

    func testRGBComponentsWithHSBColor() {
        var redValue = CGFloat(0)
        var greenValue = CGFloat(0)
        var blueValue = CGFloat(0)
        var alphaValue = CGFloat(0)
        hsbColor.getRed(&redValue, green: &greenValue, blue: &blueValue, alpha: &alphaValue)
        rgbComponents = UIColorRGBComponents(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
        XCTAssertEqual(hsbColor.rgbComponents, rgbComponents, "The red, green, blue and alpha components of the color should be provided")
    }

    func testRGBComponentsWithMonochromeColor() {
        var redValue = CGFloat(0)
        var greenValue = CGFloat(0)
        var blueValue = CGFloat(0)
        var alphaValue = CGFloat(0)
        monochromeColor.getRed(&redValue, green: &greenValue, blue: &blueValue, alpha: &alphaValue)
        rgbComponents = UIColorRGBComponents(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
        XCTAssertEqual(monochromeColor.rgbComponents, rgbComponents, "The red, green, blue and alpha components of the color should be provided")
    }

    func testColorCreationWithRGBComponents() {
        rgbComponents = UIColorRGBComponents(red: 0.14, green: 0.42, blue: 0.77, alpha: 0.99)
        let color = rgbComponents.color()
        XCTAssertEqual(color.rgbComponents, rgbComponents, "The components should create an instance of UIColor using the same values")
    }

    func testRGBComponentsUIColorInitializer() {
        rgbComponents = UIColorRGBComponents(red: 0.14, green: 0.42, blue: 0.77, alpha: 0.99)
        let color = UIColor(components: rgbComponents)
        XCTAssertEqual(color.rgbComponents, rgbComponents, "The initializer should use the provided component values")
    }

    //  MARK: RGB and alpha component values

    func testRedComponentWithRGBColor() {
        XCTAssertEqual(rgbColor.red, rgbColor.rgbComponents.red, "The red component of the RGB color should be provided")
    }

    func testRedComponentWithHSBColor() {
        XCTAssertEqual(hsbColor.red, hsbColor.rgbComponents.red, "The red component of the HSB color should be provided")
    }

    func testRedComponentWithMonochromeColor() {
        XCTAssertEqual(monochromeColor.red, monochromeColor.rgbComponents.red, "The white component of the monochrome color should be provided")
    }

    func testGreenComponentWithRGBColor() {
        XCTAssertEqual(rgbColor.green, rgbColor.rgbComponents.green, "The green component of the RGB color should be provided")
    }

    func testGreenComponentWithHSBColor() {
        XCTAssertEqual(hsbColor.green, hsbColor.rgbComponents.green, "The green component of the HSB color should be provided")
    }

    func testGreenComponentWithMonochromeColor() {
        XCTAssertEqual(monochromeColor.green, monochromeColor.rgbComponents.green, "The white component of the monochrome color should be provided")
    }

    func testBlueComponentWithRGBColor() {
        XCTAssertEqual(rgbColor.blue, rgbColor.rgbComponents.blue, "The blue component of the RGB color should be provided")
    }

    func testBlueComponentWithHSBColor() {
        XCTAssertEqual(hsbColor.blue, hsbColor.rgbComponents.blue, "The blue component of the HSB color should be provided")
    }

    func testBlueComponentWithMonochromeColor() {
        XCTAssertEqual(monochromeColor.blue, monochromeColor.rgbComponents.blue, "The white component of the monochrome color should be provided")
    }

    func testAlphaComponentWithRGBColor() {
        XCTAssertEqual(rgbColor.alpha, rgbColor.rgbComponents.alpha, "The alpha component of the RGB color should be provided")
    }

    func testAlphaComponentWithHSBColor() {
        XCTAssertEqual(hsbColor.alpha, hsbColor.rgbComponents.alpha, "The alpha component of the HSB color should be provided")
    }

    func testAlphaComponentWithMonochromeColor() {
        XCTAssertEqual(monochromeColor.alpha, monochromeColor.rgbComponents.alpha, "The alpha component of the monochrome color should be provided")
    }

    //  MARK: UIColorHSBComponents

    func testHSBComponentStructureWithDefaultAlpha() {
        hsbComponents = UIColorHSBComponents(hue: 0.33, saturation: 0.55, brightness: 0.66)
        XCTAssertEqual(hsbComponents.hue, CGFloat(0.33), "The components should include a hue value")
        XCTAssertEqual(hsbComponents.saturation, CGFloat(0.55), "The components should include a saturation value")
        XCTAssertEqual(hsbComponents.brightness, CGFloat(0.66), "The components should include a brightness value")
        XCTAssertEqual(hsbComponents.alpha, CGFloat(1.0), "The components should use a default alpha value of 1.0")
    }

    func testHSBComponentStructure() {
        hsbComponents = UIColorHSBComponents(hue: 0.33, saturation: 0.55, brightness: 0.66, alpha: 0.11)
        XCTAssertEqual(hsbComponents.hue, CGFloat(0.33), "The components should include a hue value")
        XCTAssertEqual(hsbComponents.saturation, CGFloat(0.55), "The components should include a saturation value")
        XCTAssertEqual(hsbComponents.brightness, CGFloat(0.66), "The components should include a brightness value")
        XCTAssertEqual(hsbComponents.alpha, CGFloat(0.11), "The components should include an alpha value")
    }

    func testEqualityOfHSBComponentStructure() {
        hsbComponents = UIColorHSBComponents(hue: 0.33, saturation: 0.55, brightness: 0.66, alpha: 0.11)
        let moreComponents = UIColorHSBComponents(hue: 0.33, saturation: 0.55, brightness: 0.66, alpha: 0.11)
        XCTAssertEqual(hsbComponents, moreComponents, "The components should be considered equal")
    }

    func testInequalityOfHSBComponentsWithMismatchedHueValues() {
        hsbComponents = UIColorHSBComponents(hue: 0.33, saturation: 0.55, brightness: 0.66, alpha: 0.11)
        let moreComponents = UIColorHSBComponents(hue: 0.34, saturation: 0.55, brightness: 0.66, alpha: 0.11)
        XCTAssertNotEqual(hsbComponents, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfHSBComponentsWithMismatchedSaturationValues() {
        hsbComponents = UIColorHSBComponents(hue: 0.33, saturation: 0.55, brightness: 0.66, alpha: 0.11)
        let moreComponents = UIColorHSBComponents(hue: 0.33, saturation: 0.54, brightness: 0.66, alpha: 0.11)
        XCTAssertNotEqual(hsbComponents, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfHSBComponentsWithMismatchedBrightnessValues() {
        hsbComponents = UIColorHSBComponents(hue: 0.33, saturation: 0.55, brightness: 0.66, alpha: 0.11)
        let moreComponents = UIColorHSBComponents(hue: 0.33, saturation: 0.55, brightness: 0.67, alpha: 0.11)
        XCTAssertNotEqual(hsbComponents, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfHSBComponentsWithMismatchedAlphaValues() {
        hsbComponents = UIColorHSBComponents(hue: 0.33, saturation: 0.55, brightness: 0.66, alpha: 0.11)
        let moreComponents = UIColorHSBComponents(hue: 0.33, saturation: 0.55, brightness: 0.66, alpha: 0.10)
        XCTAssertNotEqual(hsbComponents, moreComponents, "The components should not be considered equal")
    }

    func testHSBComponentsWithRGBColor() {
        var hueValue = CGFloat(0)
        var saturationValue = CGFloat(0)
        var brightnessValue = CGFloat(0)
        var alphaValue = CGFloat(0)
        rgbColor.getHue(&hueValue, saturation: &saturationValue, brightness: &brightnessValue, alpha: &alphaValue)
        hsbComponents = UIColorHSBComponents(hue: hueValue, saturation: saturationValue, brightness: brightnessValue, alpha: alphaValue)
        XCTAssertEqual(rgbColor.hsbComponents, hsbComponents, "The hue, saturation, brightness and alpha components of the color should be provided")
    }

    func testHSBComponentsWithHSBColor() {
        hsbComponents = UIColorHSBComponents(hue: 0.33, saturation: 0.55, brightness: 0.66, alpha: 0.11)
        XCTAssertEqual(hsbColor.hsbComponents, hsbComponents, "The hue, saturation, brightness and alpha components of the color should be provided")
    }

    func testHSBComponentsWithMonochromeColor() {
        var hueValue = CGFloat(0)
        var saturationValue = CGFloat(0)
        var brightnessValue = CGFloat(0)
        var alphaValue = CGFloat(0)
        monochromeColor.getHue(&hueValue, saturation: &saturationValue, brightness: &brightnessValue, alpha: &alphaValue)
        hsbComponents = UIColorHSBComponents(hue: hueValue, saturation: saturationValue, brightness: brightnessValue, alpha: alphaValue)
        XCTAssertEqual(monochromeColor.hsbComponents, hsbComponents, "The hue, saturation, brightness and alpha components of the color should be provided")
    }

    func testColorCreationWithHSBComponents() {
        hsbComponents = UIColorHSBComponents(hue: 0.33, saturation: 0.55, brightness: 0.66)
        let color = hsbComponents.color()
        XCTAssertEqual(color.hsbComponents, hsbComponents, "The components should create an instance of UIColor using the same values")
    }

    func testHSBComponentsUIColorInitializer() {
        hsbComponents = UIColorHSBComponents(hue: 0.33, saturation: 0.55, brightness: 0.66, alpha: 0.11)
        let color = UIColor(components: hsbComponents)
        XCTAssertEqual(color.hsbComponents, hsbComponents, "The initializer should use the provided component values")
    }

    //  MARK: HSB component values

    func testHueComponentWithRGBColor() {
        XCTAssertEqual(rgbColor.hue, rgbColor.hsbComponents.hue, "The hue component of the RGB color should be provided")
    }

    func testHueComponentWithHSBColor() {
        XCTAssertEqual(hsbColor.hue, hsbColor.hsbComponents.hue, "The hue component of the HSB color should be provided")
    }

    func testHueComponentWithMonochromeColor() {
        XCTAssertEqual(monochromeColor.hue, monochromeColor.hsbComponents.hue, "The hue component of the monochrome color should be provided")
    }

    func testSaturationComponentWithRGBColor() {
        XCTAssertEqual(rgbColor.saturation, rgbColor.hsbComponents.saturation, "The saturation component of the RGB color should be provided")
    }

    func testSaturationComponentWithHSBColor() {
        XCTAssertEqual(hsbColor.saturation, hsbColor.hsbComponents.saturation, "The saturation component of the HSB color should be provided")
    }

    func testSaturationComponentWithMonochromeColor() {
        XCTAssertEqual(monochromeColor.saturation, monochromeColor.hsbComponents.saturation, "The saturation component of the monochrome color should be provided")
    }

    func testBrightnessComponentWithRGBColor() {
        XCTAssertEqual(rgbColor.brightness, rgbColor.hsbComponents.brightness, "The brightness component of the RGB color should be provided")
    }

    func testBrightnessComponentWithHSBColor() {
        XCTAssertEqual(hsbColor.brightness, hsbColor.hsbComponents.brightness, "The brightness component of the HSB color should be provided")
    }

    func testBrightnessComponentWithMonochromeColor() {
        XCTAssertEqual(monochromeColor.brightness, monochromeColor.hsbComponents.brightness, "The white component of the monochrome color should be provided")
    }

    //  MARK: UIColorGrayscaleComponents

    func testGrayscaleComponentStructureWithDefaultAlpha() {
        grayscaleComponents = UIColorGrayscaleComponents(white: 0.88)
        XCTAssertEqual(grayscaleComponents.white, CGFloat(0.88), "The components should include a white value")
        XCTAssertEqual(grayscaleComponents.alpha, CGFloat(1.0), "The components should use a default alpha value of 1.0")
    }

    func testGrayscaleComponentStructure() {
        grayscaleComponents = UIColorGrayscaleComponents(white: 0.88, alpha: 0.8)
        XCTAssertEqual(grayscaleComponents.white, CGFloat(0.88), "The components should include a white value")
        XCTAssertEqual(grayscaleComponents.alpha, CGFloat(0.8), "The components should include an alpha value")
    }

    func testEqualityOfGrayscaleComponentStructure() {
        grayscaleComponents = UIColorGrayscaleComponents(white: 0.88, alpha: 0.8)
        let moreComponents = UIColorGrayscaleComponents(white: 0.88, alpha: 0.8)
        XCTAssertEqual(grayscaleComponents, moreComponents, "The components should be considered equal")
    }

    func testInequalityOfGrayscaleComponentsWithMismatchedWhiteValues() {
        grayscaleComponents = UIColorGrayscaleComponents(white: 0.88, alpha: 0.8)
        let moreComponents = UIColorGrayscaleComponents(white: 0.89, alpha: 0.8)
        XCTAssertNotEqual(grayscaleComponents, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfGrayscaleComponentsWithMismatchedAlphaValues() {
        grayscaleComponents = UIColorGrayscaleComponents(white: 0.88, alpha: 0.8)
        let moreComponents = UIColorGrayscaleComponents(white: 0.88, alpha: 0.79)
        XCTAssertNotEqual(grayscaleComponents, moreComponents, "The components should not be considered equal")
    }

    func testGrayscaleComponentsWithRGBColor() {
        var whiteValue = CGFloat(0)
        var alphaValue = CGFloat(0)
        rgbColor.getWhite(&whiteValue, alpha: &alphaValue)
        grayscaleComponents = UIColorGrayscaleComponents(white: whiteValue, alpha: alphaValue)
        XCTAssertEqual(rgbColor.grayscaleComponents, grayscaleComponents, "The white and alpha components of the color should be provided")
    }

    func testGrayscaleComponentsWithHSBColor() {
        var whiteValue = CGFloat(0)
        var alphaValue = CGFloat(0)
        hsbColor.getWhite(&whiteValue, alpha: &alphaValue)
        grayscaleComponents = UIColorGrayscaleComponents(white: whiteValue, alpha: alphaValue)
        XCTAssertEqual(hsbColor.grayscaleComponents, grayscaleComponents, "The white and alpha components of the color should be provided")
    }

    func testGrayscaleComponentsWithMonochromeColor() {
        grayscaleComponents = UIColorGrayscaleComponents(white: 0.88, alpha: 0.8)
        XCTAssertEqual(monochromeColor.grayscaleComponents, grayscaleComponents, "The white and alpha components of the color should be provided")
    }

    func testColorCreationWithGrayscaleComponents() {
        grayscaleComponents = UIColorGrayscaleComponents(white: 0.88, alpha: 0.8)
        let color = grayscaleComponents.color()
        XCTAssertEqual(color.grayscaleComponents, grayscaleComponents, "The components should create an instance of UIColor using the same values")
    }

    func testGrayscaleComponentsUIColorInitializer() {
        grayscaleComponents = UIColorGrayscaleComponents(white: 0.88, alpha: 0.8)
        let color = UIColor(components: grayscaleComponents)
        XCTAssertEqual(color.grayscaleComponents, grayscaleComponents, "The initializer should use the provided component values")
    }

    //  MARK: Monochrome component values

    func testWhiteComponentWithRGBColor() {
        var whiteValue = CGFloat(0)
        var alphaValue = CGFloat(0)
        rgbColor.getWhite(&whiteValue, alpha: &alphaValue)
        grayscaleComponents = UIColorGrayscaleComponents(white: whiteValue, alpha: alphaValue)
        XCTAssertEqual(rgbColor.white, rgbColor.grayscaleComponents.white, "The white component of the RGB color should be provided")
    }

    func testWhiteComponentWithHSBColor() {
        XCTAssertEqual(hsbColor.white, hsbColor.grayscaleComponents.white, "The white component of the HSB color should be provided")
    }

    func testWhiteComponentWithMonochromeColor() {
        XCTAssertEqual(monochromeColor.white, CGFloat(0.88), "The white component of the monochrome color should be provided")
    }

    //  MARK: Compoment conversion

    func testRGBtoHSBConversion() {
        rgbComponents = rgbColor.rgbComponents
        hsbComponents = rgbComponents.asHSBComponents()
        XCTAssertEqual(rgbColor.hsbComponents, hsbComponents, "The RGB components should be correctly converted into their HSB component equivalents")
    }

    func testRGBtoGrayscaleConversion() {
        rgbComponents = rgbColor.rgbComponents
        grayscaleComponents = rgbComponents.asGrayscaleComponents()
        XCTAssertEqual(rgbColor.grayscaleComponents, grayscaleComponents, "The RGB components should be correctly converted into their grayscale component equivalents")
    }

    func testHSBtoRGBConversion() {
        hsbComponents = hsbColor.hsbComponents
        rgbComponents = hsbComponents.asRGBComponents()
        XCTAssertEqual(hsbColor.rgbComponents, rgbComponents, "The HSB components should be correctly converted into their RGB component equivalents")
    }

    func testHSBtoGrayscaleConversion() {
        hsbComponents = hsbColor.hsbComponents
        grayscaleComponents = hsbComponents.asGrayscaleComponents()
        XCTAssertEqual(hsbColor.grayscaleComponents, grayscaleComponents, "The HSB components should be correctly converted into their grayscale component equivalents")
    }

    func testGrayscaletoRGBConversion() {
        grayscaleComponents = monochromeColor.grayscaleComponents
        rgbComponents = grayscaleComponents.asRGBComponents()
        XCTAssertEqual(monochromeColor.rgbComponents, rgbComponents, "The grayscale components should be correctly converted into their RGB component equivalents")
    }

    func testGrayscaletoHSBConversion() {
        grayscaleComponents = monochromeColor.grayscaleComponents
        hsbComponents = grayscaleComponents.asHSBComponents()
        XCTAssertEqual(monochromeColor.hsbComponents, hsbComponents, "The grayscale components should be correctly converted into their HSB component equivalents")
    }
}
