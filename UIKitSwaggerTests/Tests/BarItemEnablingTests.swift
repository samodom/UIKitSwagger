//
//  BarItemEnablingTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/7/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest

class BarItemEnablingTests: XCTestCase {

    var enabledBarItem = UIBarButtonItem(
        title: "Sample",
        style: .plain,
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

        enabledBarItem.isEnabled = true
        disabledBarItem.isEnabled = false
    }

    func sampleAction() { }

    func testEnablingDisabledBarItem() {
        disabledBarItem.enable()
        XCTAssertTrue(disabledBarItem.isEnabled, "The disabled bar item should be enabled")
    }

    func testNotDisablingEnabledBarItem() {
        enabledBarItem.enable()
        XCTAssertTrue(enabledBarItem.isEnabled, "The enabled bar item should not be disabled")
    }

    func testDisablingEnabledBarItem() {
        enabledBarItem.disable()
        XCTAssertFalse(enabledBarItem.isEnabled, "The enabled bar item should be disabled")
    }

    func testNotEnablingDisabledBarItem() {
        disabledBarItem.disable()
        XCTAssertFalse(disabledBarItem.isEnabled, "The disabled bar item should not be enabled")
    }

}
