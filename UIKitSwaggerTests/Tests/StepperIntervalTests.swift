//
//  StepperIntervalTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class StepperIntervalTests: XCTestCase {

    let initialMinimum = Double(-1234.5678)
    let initialMaximum = Double(4321.9876)
    let newMinimum = Double(-14.42)
    let newMaximum = Double(14.42)

    let stepper = UIStepper()
    var interval: ClosedInterval<Double>!

    override func setUp() {
        super.setUp()

        stepper.minimumValue = initialMinimum
        stepper.maximumValue = initialMaximum
    }

    func testStepperHasInterval() {
        interval = stepper.interval
        XCTAssertEqual(interval.start, stepper.minimumValue, "The start of the interval should be the stepper's minimum value")
        XCTAssertEqual(interval.end, stepper.maximumValue, "The end of the interval should be the stepper's maximum value")
    }

    func testChangingInterval() {
        stepper.interval = newMinimum ... newMaximum
        XCTAssertEqual(stepper.minimumValue, newMinimum, "Changing the interval should change the minimum value")
        XCTAssertEqual(stepper.maximumValue, newMaximum, "Changing the interval should change the maximum value")
    }

    func testChangingMinimumValueChangesInterval() {
        stepper.minimumValue = newMinimum
        XCTAssertEqual(stepper.interval, newMinimum ... initialMaximum, "Changing the minimum value should change the interval")
    }

    func testChangingMaximumValueChangesInterval() {
        stepper.maximumValue = newMaximum
        XCTAssertEqual(stepper.interval, initialMinimum ... newMaximum, "Changing the maximum value should change the interval")
    }

}
