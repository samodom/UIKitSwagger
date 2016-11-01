//
//  SwitchStateManagementTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/12/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest

class SwitchStateManagementTests: XCTestCase {

    let toggle1 = TestSwitch()
    let toggle2 = TestSwitch()

    func testOffIsNotOn() {
        toggle1.isOn = true
        XCTAssertFalse(toggle1.isOff, "The `isOff` property should represent the opposite of the `isOn` property")

        toggle2.isOn = false
        XCTAssertTrue(toggle2.isOff, "The `isOff` property should represent the opposite of the `isOn` property")
    }

    func testSettingOffSetsOn() {
        toggle1.isOn = true
        toggle1.isOff = true
        XCTAssertFalse(toggle1.isOn, "Setting the `isOff` property to true should set the `isOn` property to false")
        XCTAssertFalse(toggle1.toggleWasAnimated, "Setting the switch should not be animated")

        toggle2.isOn = false
        toggle2.isOff = false
        XCTAssertTrue(toggle2.isOn, "Setting the `isOff` property to false should set the `isOn` property to true")
        XCTAssertFalse(toggle2.toggleWasAnimated, "Setting the switch should not be animated")
    }

    func testSettingOffUnanimated() {
        toggle1.isOn = true
        toggle1.setOff(true, animated: false)
        XCTAssertFalse(toggle1.isOn, "The switch should now be off")
        XCTAssertFalse(toggle1.toggleWasAnimated, "Setting the switch should not be animated")

        toggle2.isOn = false
        toggle2.setOff(false, animated: false)
        XCTAssertTrue(toggle2.isOn, "The switch should now be on")
        XCTAssertFalse(toggle2.toggleWasAnimated, "Setting the switch should not be animated")
    }

    func testSettingOffAnimated() {
        toggle1.isOn = true
        toggle1.setOff(true, animated: true)
        XCTAssertFalse(toggle1.isOn, "The switch should now be off")
        XCTAssertTrue(toggle1.toggleWasAnimated, "Setting the switch should be animated")

        toggle2.isOn = false
        toggle2.setOff(false, animated: true)
        XCTAssertTrue(toggle2.isOn, "The switch should now be on")
        XCTAssertTrue(toggle2.toggleWasAnimated, "Setting the switch should be animated")
    }

    func testTurningOnSwitchSetsSwitchToOn() {
        toggle1.isOn = false
        toggle1.turnOn()
        XCTAssertTrue(toggle1.isOn, "The switch should be turned on")
        XCTAssertFalse(toggle1.toggleWasAnimated, "Setting the switch should not be animated")

        toggle2.isOn = false
        toggle2.animateOn()
        XCTAssertTrue(toggle2.isOn, "The switch should be turned on")
        XCTAssertTrue(toggle2.toggleWasAnimated, "Setting the switch should be animated")
    }

    func testTurningOnSwitchDoesNotSetSwitchToOff() {
        toggle1.isOn = true
        toggle1.turnOn()
        XCTAssertTrue(toggle1.isOn, "The switch should still be turned on")

        toggle2.isOn = true
        toggle2.animateOn()
        XCTAssertTrue(toggle2.isOn, "The switch should still be turned on")
    }

    func testTurningOffSwitchSetsSwitchToOff() {
        toggle1.isOn = true
        toggle1.turnOff()
        XCTAssertFalse(toggle1.isOn, "The switch should be turned off")
        XCTAssertFalse(toggle1.toggleWasAnimated, "Setting the switch should not be animated")

        toggle2.isOn = true
        toggle2.animateOff()
        XCTAssertFalse(toggle2.isOn, "The switch should be turned off")
        XCTAssertTrue(toggle2.toggleWasAnimated, "Setting the switch should be animated")
    }

    func testTurningOffSwitchDoesNotSetSwitchToOn() {
        toggle1.isOn = false
        toggle1.turnOff()
        XCTAssertFalse(toggle1.isOn, "The switch should still be turned off")

        toggle2.isOn = false
        toggle2.animateOff()
        XCTAssertFalse(toggle2.isOn, "The switch should still be turned off")
    }

    func testSwitchToggling() {
        toggle1.isOn = false
        toggle1.toggle()
        XCTAssertTrue(toggle1.isOn, "The switch should now be turned on")
        XCTAssertFalse(toggle1.toggleWasAnimated, "Toggling the switch should not be animated")

        toggle1.toggle()
        XCTAssertFalse(toggle1.isOn, "The switch should now be turned off")
        XCTAssertFalse(toggle1.toggleWasAnimated, "Toggling the switch should not be animated")
    }

    func testAnimatedSwitchToggling() {
        toggle2.isOn = false
        toggle2.toggleAnimated()
        XCTAssertTrue(toggle2.isOn, "The switch should now be turned on")
        XCTAssertTrue(toggle2.toggleWasAnimated, "Toggling the switch should be animated")

        toggle2.toggleWasAnimated = false
        toggle2.toggleAnimated()
        XCTAssertFalse(toggle2.isOn, "The switch should now be turned off")
        XCTAssertTrue(toggle2.toggleWasAnimated, "Toggling the switch should be animated")
    }

}

class TestSwitch: UISwitch {
    var toggleWasAnimated = false

    override func setOn(_ on: Bool, animated: Bool) {
        super.setOn(on, animated: animated)
        toggleWasAnimated = animated
    }
}
