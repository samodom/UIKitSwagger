//
//  GestureRecognizerEnablingTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/6/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class GestureRecognizerEnablingTests: XCTestCase {

    var enabledRecognizer = UITapGestureRecognizer()
    var disabledRecognizer = UIRotationGestureRecognizer()

    override func setUp() {
        super.setUp()

        enabledRecognizer.enabled = true
        disabledRecognizer.enabled = false
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testEnablingDisabledGestureRecognizer() {
        disabledRecognizer.enable()
        XCTAssertTrue(disabledRecognizer.enabled, "The disabled recognizer should be enabled")
    }

    func testNotDisablingEnabledGestureRecognizer() {
        enabledRecognizer.enable()
        XCTAssertTrue(enabledRecognizer.enabled, "The enabled recognizer should not be disabled")
    }

    func testDisablingEnabledGestureRecognizer() {
        enabledRecognizer.disable()
        XCTAssertFalse(enabledRecognizer.enabled, "The enabled recognizer should be disabled")
    }

    func testNotEnablingDisabledGestureRecognizer() {
        disabledRecognizer.disable()
        XCTAssertFalse(disabledRecognizer.enabled, "The disabled recognizer should not be enabled")
    }

}
