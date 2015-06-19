//
//  SwitchStateManagementTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/12/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class SwitchStateManagementTests: XCTestCase {

    private let toggle1 = TestSwitch()
    private let toggle2 = TestSwitch()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testOffIsNotOn() {
        toggle1.on = true
        XCTAssertFalse(toggle1.off, "The `off` property should represent the opposite of the `on` property")

        toggle2.on = false
        XCTAssertTrue(toggle2.off, "The `off` property should represent the opposite of the `on` property")
    }

    func testSettingOffSetsOn() {
        toggle1.on = true
        toggle1.off = true
        XCTAssertFalse(toggle1.on, "Setting the `off` property to true should set the `on` property to false")
        XCTAssertFalse(toggle1.toggleAnimated, "Setting the switch should not be animated")

        toggle2.on = false
        toggle2.off = false
        XCTAssertTrue(toggle2.on, "Setting the `off` property to false should set the `on` property to true")
        XCTAssertFalse(toggle2.toggleAnimated, "Setting the switch should not be animated")
    }

    func testSettingOffUnanimated() {
        toggle1.on = true
        toggle1.setOff(true, animated: false)
        XCTAssertFalse(toggle1.on, "The switch should now be off")
        XCTAssertFalse(toggle1.toggleAnimated, "Setting the switch should not be animated")

        toggle2.on = false
        toggle2.setOff(false, animated: false)
        XCTAssertTrue(toggle2.on, "The switch should now be on")
        XCTAssertFalse(toggle2.toggleAnimated, "Setting the switch should not be animated")
    }

    func testSettingOffAnimated() {
        toggle1.on = true
        toggle1.setOff(true, animated: true)
        XCTAssertFalse(toggle1.on, "The switch should now be off")
        XCTAssertTrue(toggle1.toggleAnimated, "Setting the switch should be animated")

        toggle2.on = false
        toggle2.setOff(false, animated: true)
        XCTAssertTrue(toggle2.on, "The switch should now be on")
        XCTAssertTrue(toggle2.toggleAnimated, "Setting the switch should be animated")
    }

    func testTurningOnSwitchSetsSwitchToOn() {
        toggle1.on = false
        toggle1.turnOn()
        XCTAssertTrue(toggle1.on, "The switch should be turned on")
        XCTAssertFalse(toggle1.toggleAnimated, "Setting the switch should not be animated")

        toggle2.on = false
        toggle2.animateOn()
        XCTAssertTrue(toggle2.on, "The switch should be turned on")
        XCTAssertTrue(toggle2.toggleAnimated, "Setting the switch should be animated")
    }

    func testTurningOnSwitchDoesNotSetSwitchToOff() {
        toggle1.on = true
        toggle1.turnOn()
        XCTAssertTrue(toggle1.on, "The switch should still be turned on")

        toggle2.on = true
        toggle2.animateOn()
        XCTAssertTrue(toggle2.on, "The switch should still be turned on")
    }

    func testTurningOffSwitchSetsSwitchToOff() {
        toggle1.on = true
        toggle1.turnOff()
        XCTAssertFalse(toggle1.on, "The switch should be turned off")
        XCTAssertFalse(toggle1.toggleAnimated, "Setting the switch should not be animated")

        toggle2.on = true
        toggle2.animateOff()
        XCTAssertFalse(toggle2.on, "The switch should be turned off")
        XCTAssertTrue(toggle2.toggleAnimated, "Setting the switch should be animated")
    }

    func testTurningOffSwitchDoesNotSetSwitchToOn() {
        toggle1.on = false
        toggle1.turnOff()
        XCTAssertFalse(toggle1.on, "The switch should still be turned off")

        toggle2.on = false
        toggle2.animateOff()
        XCTAssertFalse(toggle2.on, "The switch should still be turned off")
    }

    func testSwitchToggling() {
        toggle1.on = false
        toggle1.toggle()
        XCTAssertTrue(toggle1.on, "The switch should now be turned on")
        XCTAssertFalse(toggle1.toggleAnimated, "Toggling the switch should not be animated")

        toggle1.toggle()
        XCTAssertFalse(toggle1.on, "The switch should now be turned off")
        XCTAssertFalse(toggle1.toggleAnimated, "Toggling the switch should not be animated")
    }

    func testAnimatedSwitchToggling() {
        toggle2.on = false
        toggle2.animateToggle()
        XCTAssertTrue(toggle2.on, "The switch should now be turned on")
        XCTAssertTrue(toggle2.toggleAnimated, "Toggling the switch should be animated")

        toggle2.toggleAnimated = false
        toggle2.animateToggle()
        XCTAssertFalse(toggle2.on, "The switch should now be turned off")
        XCTAssertTrue(toggle2.toggleAnimated, "Toggling the switch should be animated")
    }

}

private class TestSwitch: UISwitch {
    var toggleAnimated = false

    override func setOn(on: Bool, animated: Bool) {
        super.setOn(on, animated: animated)
        toggleAnimated = animated
    }
}
