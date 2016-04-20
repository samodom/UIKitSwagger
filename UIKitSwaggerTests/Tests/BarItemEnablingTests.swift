//
//  BarItemEnablingTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/7/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class BarItemEnablingTests: XCTestCase {

    var enabledBarItem = UIBarButtonItem(
        title: "Sample",
        style: .Plain,
        target: nil,
        action: #selector(sampleAction)
    )
    var disabledBarItem = UITabBarItem(
        title: "Sample",
        image: nil,
        tag: 14
    )

    override func setUp() {
        super.setUp()

        enabledBarItem.enabled = true
        disabledBarItem.enabled = false
    }

    @objc
    private func sampleAction() { }

    func testEnablingDisabledBarItem() {
        disabledBarItem.enable()
        XCTAssertTrue(disabledBarItem.enabled, "The disabled bar item should be enabled")
    }

    func testNotDisablingEnabledBarItem() {
        enabledBarItem.enable()
        XCTAssertTrue(enabledBarItem.enabled, "The enabled bar item should not be disabled")
    }

    func testDisablingEnabledBarItem() {
        enabledBarItem.disable()
        XCTAssertFalse(enabledBarItem.enabled, "The enabled bar item should be disabled")
    }

    func testNotEnablingDisabledBarItem() {
        disabledBarItem.disable()
        XCTAssertFalse(disabledBarItem.enabled, "The disabled bar item should not be enabled")
    }

}
