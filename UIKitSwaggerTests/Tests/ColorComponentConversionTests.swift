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

    var rgbComponents: RGBComponents!
    var hsbComponents: HSBComponents!
    var grayscaleComponents: GrayscaleComponents!
    var cmykComponents: CMYKComponents!

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    //  MARK: RGB -> ...

    func testRGBtoHSBConversion() {
        rgbComponents = sampleRGBColor.rgbComponents
        hsbComponents = rgbComponents.asHSBComponents()
        XCTAssertEqual(sampleRGBColor.hsbComponents, hsbComponents, "The RGB components should be correctly converted into their HSB component equivalents")
    }

    func testRGBtoGrayscaleConversion() {
        rgbComponents = sampleRGBColor.rgbComponents
        grayscaleComponents = rgbComponents.asGrayscaleComponents()
        XCTAssertEqual(sampleRGBColor.grayscaleComponents, grayscaleComponents, "The RGB components should be correctly converted into their grayscale component equivalents")
    }

    func testRGBtoCMYKConversion() {
        rgbComponents = sampleRGBColor.rgbComponents
        cmykComponents = rgbComponents.asCMYKComponents()
        XCTAssertEqual(sampleRGBColor.cmykComponents, cmykComponents, "The RGB components should be correctly converted into their CMYK component equivalents")
    }

    //  MARK: HSB -> ...

    func testHSBtoRGBConversion() {
        hsbComponents = sampleHSBColor.hsbComponents
        rgbComponents = hsbComponents.asRGBComponents()
        XCTAssertEqual(sampleHSBColor.rgbComponents, rgbComponents, "The HSB components should be correctly converted into their RGB component equivalents")
    }

    func testHSBtoGrayscaleConversion() {
        hsbComponents = sampleHSBColor.hsbComponents
        grayscaleComponents = hsbComponents.asGrayscaleComponents()
        XCTAssertEqual(sampleHSBColor.grayscaleComponents, grayscaleComponents, "The HSB components should be correctly converted into their grayscale component equivalents")
    }

    func testHSBtoCMYKConversion() {
        hsbComponents = sampleHSBColor.hsbComponents
        cmykComponents = hsbComponents.asCMYKComponents()
        XCTAssertEqual(sampleHSBColor.cmykComponents, cmykComponents, "The HSB components should be correctly converted into their CMYK component equivalents")
    }

    //  MARK: Grayscale -> ...

    func testGrayscaletoRGBConversion() {
        grayscaleComponents = sampleMonochromeColor.grayscaleComponents
        rgbComponents = grayscaleComponents.asRGBComponents()
        XCTAssertEqual(sampleMonochromeColor.rgbComponents, rgbComponents, "The grayscale components should be correctly converted into their RGB component equivalents")
    }

    func testGrayscaletoHSBConversion() {
        grayscaleComponents = sampleMonochromeColor.grayscaleComponents
        hsbComponents = grayscaleComponents.asHSBComponents()
        XCTAssertEqual(sampleMonochromeColor.hsbComponents, hsbComponents, "The grayscale components should be correctly converted into their HSB component equivalents")
    }

    func testGrayscaletoCMYKConversion() {
        grayscaleComponents = sampleMonochromeColor.grayscaleComponents
        cmykComponents = grayscaleComponents.asCMYKComponents()
        XCTAssertEqual(sampleMonochromeColor.cmykComponents, cmykComponents, "The grayscale components should be correctly converted into their CMYK component equivalents")
    }

    //  MARK: CMYK -> ...

    func testCMYKtoRGBConversion() {
        cmykComponents = sampleHSBColor.cmykComponents
        rgbComponents = cmykComponents.asRGBComponents()
        XCTAssertEqual(sampleHSBColor.rgbComponents, rgbComponents, "The CMYK components should be correctly converted into their RGB component equivalents")
    }

    func testCMYKtoHSBConversion() {
        cmykComponents = sampleRGBColor.cmykComponents
        hsbComponents = cmykComponents.asHSBComponents()
        XCTAssertEqual(sampleRGBColor.hsbComponents, hsbComponents, "The CMYK components should be correctly converted into their HSB component equivalents")
    }

    func testCMYKtoGrayscaleConversion() {
        cmykComponents = sampleRGBColor.cmykComponents
        grayscaleComponents = cmykComponents.asGrayscaleComponents()
        XCTAssertEqual(sampleRGBColor.grayscaleComponents, grayscaleComponents, "The CMYK components should be correctly converted into their grayscale component equivalents")
    }

}
