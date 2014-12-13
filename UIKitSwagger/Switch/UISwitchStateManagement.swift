//
//  UISwitchStateManagement.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/12/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension UISwitch {

    /**
      Convenience property that always represents the boolean negation of the `on` property.
    */
    public var off: Bool { return !on }

    /**
      Method to explicitly turn the switch on without animation.
    */
    public func turnOn() {
        if !on {
            toggle()
        }
    }

    /**
      Method to explicitly turn the switch on with animation.
    */
    public func animateOn() {
        if !on {
            animateToggle()
        }
    }

    /**
      Method to explicitly turn the switch off without animation.
    */
    public func turnOff() {
        if on {
            toggle()
        }
    }

    /**
      Method to explicitly turn the switch off with animation.
    */
    public func animateOff() {
        if on {
            animateToggle()
        }
    }

    /**
      Method to explicitly toggle the switch without animation.
    */
    public func toggle() {
        on = !on
    }

    /**
      Method to explicitly toggle the switch with animation.
    */
    public func animateToggle() {
        setOn(!on, animated: true)
    }

}
