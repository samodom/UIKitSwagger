//
//  LabelEnablingTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/6/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class LabelEnablingTests: XCTestCase {

    var enabledLabel = UILabel()
    var disabledLabel = UILabel()

    override func setUp() {
        super.setUp()

        enabledLabel.enabled = true
        disabledLabel.enabled = false
    }

    func testEnablingDisabledLabel() {
        disabledLabel.enable()
        XCTAssertTrue(disabledLabel.enabled, "The disabled label should be enabled")
    }

    func testNotDisablingEnabledLabel() {
        enabledLabel.enable()
        XCTAssertTrue(enabledLabel.enabled, "The enabled label should not be disabled")
    }

    func testDisablingEnabledLabel() {
        enabledLabel.disable()
        XCTAssertFalse(enabledLabel.enabled, "The enabled label should be disabled")
    }

    func testNotEnablingDisabledLabel() {
        disabledLabel.disable()
        XCTAssertFalse(disabledLabel.enabled, "The disabled label should not be enabled")
    }

}
