//
//  StepperRangeTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class StepperRangeTests: XCTestCase {

    let initialMinimum = Double(-1234.5678)
    let initialMaximum = Double(4321.9876)
    let newMinimum = Double(-14.42)
    let newMaximum = Double(14.42)

    let stepper = UIStepper()
    var range: ClosedRange<Double>!

    override func setUp() {
        super.setUp()

        stepper.minimumValue = initialMinimum
        stepper.maximumValue = initialMaximum
    }

    func testStepperHasRange() {
        range = stepper.range
        XCTAssertEqual(range.lowerBound, stepper.minimumValue, "The lower bound of the range should be the stepper's minimum value")
        XCTAssertEqual(range.upperBound, stepper.maximumValue, "The upper bound of the range should be the stepper's maximum value")
    }

    func testChangingRange() {
        stepper.range = newMinimum ... newMaximum
        XCTAssertEqual(stepper.minimumValue, newMinimum, "Changing the range should change the minimum value")
        XCTAssertEqual(stepper.maximumValue, newMaximum, "Changing the range should change the maximum value")
    }

    func testChangingMinimumValueChangesRange() {
        stepper.minimumValue = newMinimum
        XCTAssertEqual(stepper.range, newMinimum ... initialMaximum, "Changing the minimum value should change the range")
    }

    func testChangingMaximumValueChangesRange() {
        stepper.maximumValue = newMaximum
        XCTAssertEqual(stepper.range, initialMinimum ... newMaximum, "Changing the maximum value should change the range")
    }

}
