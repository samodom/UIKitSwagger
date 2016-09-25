//
//  ColorComponentConversionTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 3/1/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest
@testable import UIKitSwagger

class ColorComponentConversionTests: XCTestCase {

    let rgbComponents = sampleRGBColor.rgbComponents
    let hsbComponents = sampleHSBColor.hsbComponents
    let grayscaleComponents = sampleMonochromeColor.grayscaleComponents
    let cmykComponents = sampleCMYKColor.cmykComponents

    //  MARK: RGB -> ...

    func testRGBtoRGBConversion() {
        XCTAssertEqual(rgbComponents, rgbComponents.rgbComponents, "The components should provide an identical set of components")
    }

    func testRGBtoHSBConversion() {
        XCTAssertEqual(sampleRGBColor.hsbComponents, rgbComponents.hsbComponents, "The RGB components should be correctly converted into their HSB component equivalents")
    }

    func testRGBtoGrayscaleConversion() {
        XCTAssertEqual(sampleRGBColor.grayscaleComponents, rgbComponents.grayscaleComponents, "The RGB components should be correctly converted into their grayscale component equivalents")
    }

    func testRGBtoCMYKConversion() {
        XCTAssertEqual(sampleRGBColor.cmykComponents, rgbComponents.cmykComponents, "The RGB components should be correctly converted into their CMYK component equivalents")
    }

    //  MARK: HSB -> ...

    func testHSBBtoHSBConversion() {
        XCTAssertEqual(hsbComponents, hsbComponents.hsbComponents, "The components should provide an identical set of components")
    }

    func testHSBtoRGBConversion() {
        XCTAssertEqual(sampleHSBColor.rgbComponents, hsbComponents.rgbComponents, "The HSB components should be correctly converted into their RGB component equivalents")
    }

    func testHSBtoGrayscaleConversion() {
        XCTAssertEqual(sampleHSBColor.grayscaleComponents, hsbComponents.grayscaleComponents, "The HSB components should be correctly converted into their grayscale component equivalents")
    }

    func testHSBtoCMYKConversion() {
        XCTAssertEqual(sampleHSBColor.cmykComponents, hsbComponents.cmykComponents, "The HSB components should be correctly converted into their CMYK component equivalents")
    }

    //  MARK: CMYK -> ...

    func testCMYKtoCMYKConversion() {
        XCTAssertEqual(cmykComponents, cmykComponents.cmykComponents, "The components should provide an identical set of components")
    }

    func testCMYKtoRGBConversion() {
        XCTAssertEqual(sampleCMYKColor.rgbComponents, cmykComponents.rgbComponents, "The CMYK components should be correctly converted into their RGB component equivalents")
    }

    func testCMYKtoHSBConversion() {
        XCTAssertEqual(sampleCMYKColor.hsbComponents, cmykComponents.hsbComponents, "The CMYK components should be correctly converted into their HSB component equivalents")
    }

    func testCMYKtoGrayscaleConversion() {
        XCTAssertEqual(sampleCMYKColor.grayscaleComponents, cmykComponents.grayscaleComponents, "The CMYK components should be correctly converted into their grayscale component equivalents")
    }

    //  MARK: Grayscale -> ...

    func testGrayscaleToGrayscaleConversion() {
        XCTAssertEqual(grayscaleComponents, grayscaleComponents.grayscaleComponents, "The components should provide an identical set of components")
    }

    func testGrayscaleToRGBConversion() {
        XCTAssertEqual(sampleMonochromeColor.rgbComponents, grayscaleComponents.rgbComponents, "The grayscale components should be correctly converted into their RGB component equivalents")
    }

    func testGrayscaleToHSBConversion() {
        XCTAssertEqual(sampleMonochromeColor.hsbComponents, grayscaleComponents.hsbComponents, "The grayscale components should be correctly converted into their HSB component equivalents")
    }

    func testGrayscaleToCMYKConversion() {
        XCTAssertEqual(sampleMonochromeColor.cmykComponents, grayscaleComponents.cmykComponents, "The grayscale components should be correctly converted into their CMYK component equivalents")
    }

}
