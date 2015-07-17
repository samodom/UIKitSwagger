//
//  SliderIntervalTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/12/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class SliderIntervalTests: XCTestCase {

    let initialMinimum = Float(-1234.5678)
    let initialMaximum = Float(4321.9876)
    let newMinimum = Float(-14.42)
    let newMaximum = Float(14.42)

    let slider = UISlider()
    var interval: ClosedInterval<Float>!

    override func setUp() {
        super.setUp()

        slider.minimumValue = initialMinimum
        slider.maximumValue = initialMaximum
    }

    func testSliderHasInterval() {
        interval = slider.interval
        XCTAssertEqual(interval.start, slider.minimumValue, "The start of the interval should be the slider's minimum value")
        XCTAssertEqual(interval.end, slider.maximumValue, "The end of the interval should be the slider's maximum value")
    }

    func testChangingInterval() {
        slider.interval = newMinimum ... newMaximum
        XCTAssertEqual(slider.minimumValue, newMinimum, "Changing the interval should change the minimum value")
        XCTAssertEqual(slider.maximumValue, newMaximum, "Changing the interval should change the maximum value")
    }

    func testChangingMinimumValueChangesInterval() {
        slider.minimumValue = newMinimum
        XCTAssertEqual(slider.interval, newMinimum ... initialMaximum, "Changing the minimum value should change the interval")
    }

    func testChangingMaximumValueChangesInterval() {
        slider.maximumValue = newMaximum
        XCTAssertEqual(slider.interval, initialMinimum ... newMaximum, "Changing the maximum value should change the interval")
    }

}
