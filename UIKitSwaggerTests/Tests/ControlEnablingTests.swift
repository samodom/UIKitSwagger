//
//  ControlEnablingTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/6/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class ControlEnablingTests: XCTestCase {

    var enabledControl = UIButton()
    var disabledControl = UISlider()

    override func setUp() {
        super.setUp()

        enabledControl.enabled = true
        disabledControl.enabled = false
    }

    func testEnablingDisabledControl() {
        disabledControl.enable()
        XCTAssertTrue(disabledControl.enabled, "The disabled control should be enabled")
    }

    func testNotDisablingEnabledControl() {
        enabledControl.enable()
        XCTAssertTrue(enabledControl.enabled, "The enabled control should not be disabled")
    }

    func testDisablingEnabledControl() {
        enabledControl.disable()
        XCTAssertFalse(enabledControl.enabled, "The enabled control should be disabled")
    }

    func testNotEnablingDisabledControl() {
        disabledControl.disable()
        XCTAssertFalse(disabledControl.enabled, "The disabled control should not be enabled")
    }

}
