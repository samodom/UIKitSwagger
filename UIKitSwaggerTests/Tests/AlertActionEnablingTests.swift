//
//  AlertActionEnablingTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/6/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class AlertActionEnablingTests: XCTestCase {

    var enabledAction = UIAlertAction()
    var disabledAction = UIAlertAction()

    override func setUp() {
        super.setUp()

        enabledAction.enabled = true
        disabledAction.enabled = false
    }

    func testEnablingDisabledAlertAction() {
        disabledAction.enable()
        XCTAssertTrue(disabledAction.enabled, "The disabled action should be enabled")
    }

    func testNotDisablingEnabledAlertAction() {
        enabledAction.enable()
        XCTAssertTrue(enabledAction.enabled, "The enabled action should not be disabled")
    }

    func testDisablingEnabledAlertAction() {
        enabledAction.disable()
        XCTAssertFalse(enabledAction.enabled, "The enabled action should be disabled")
    }

    func testNotEnablingDisabledAlertAction() {
        disabledAction.disable()
        XCTAssertFalse(disabledAction.enabled, "The disabled action should not be enabled")
    }

}
