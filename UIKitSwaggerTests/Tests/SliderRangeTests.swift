//
//  SliderRangeTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/12/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest

class SliderRangeTests: XCTestCase {

    let initialMinimum = Float(-1234.5678)
    let initialMaximum = Float(4321.9876)
    let newMinimum = Float(-14.42)
    let newMaximum = Float(14.42)

    let slider = UISlider()
    var range: ClosedRange<Float>!

    override func setUp() {
        super.setUp()

        slider.minimumValue = initialMinimum
        slider.maximumValue = initialMaximum
    }

    func testSliderHasRange() {
        range = slider.range
        XCTAssertEqual(range.lowerBound, slider.minimumValue, "The lower bound of the range should be the slider's minimum value")
        XCTAssertEqual(range.upperBound, slider.maximumValue, "The upper bound of the range should be the slider's maximum value")
    }

    func testChangingRange() {
        slider.range = newMinimum ... newMaximum
        XCTAssertEqual(slider.minimumValue, newMinimum, "Changing the range should change the minimum value")
        XCTAssertEqual(slider.maximumValue, newMaximum, "Changing the range should change the maximum value")
    }

    func testChangingMinimumValueChangesRange() {
        slider.minimumValue = newMinimum
        XCTAssertEqual(slider.range, newMinimum ... initialMaximum, "Changing the minimum value should change the range")
    }

    func testChangingMaximumValueChangesRange() {
        slider.maximumValue = newMaximum
        XCTAssertEqual(slider.range, initialMinimum ... newMaximum, "Changing the maximum value should change the range")
    }

}
