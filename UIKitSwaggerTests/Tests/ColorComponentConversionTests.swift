//
//  ColorComponentConversionTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 3/1/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class ColorComponentConversionTests: XCTestCase {

    var rgbComponents: UIColorRGBComponents!
    var hsbComponents: UIColorHSBComponents!
    var grayscaleComponents: UIColorGrayscaleComponents!

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

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
}
