//
//  StateManagement.swift
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
    public var isOff: Bool {
        get { return !isOn }
        set { isOn = !newValue }
    }

    /**
     Convenience method to set the `off` property with or without animation to match the similar method for the `on` property.
     - parameter off: Boolean value representing whether or not the switch should be off or not.
     - parameter animated: Boolean value indicating whether or not the changing of the boolean value should be animated.
     */
    public func setOff(_ off: Bool, animated: Bool) {
        setOn(!off, animated: animated)
    }

    /**
     Method to explicitly turn the switch on without animation.
     */
    public func turnOn() {
        isOn = true
    }

    /**
     Method to explicitly turn the switch on with animation.
     */
    public func animateOn() {
        setOn(true, animated: true)
    }

    /**
     Method to explicitly turn the switch off without animation.
     */
    public func turnOff() {
        isOff = true
    }

    /**
     Method to explicitly turn the switch off with animation.
     */
    public func animateOff() {
        setOff(true, animated: true)
    }

    /**
     Method to explicitly toggle the switch without animation.
     */
    public func toggle() {
        isOn = !isOn
    }

    /**
     Method to explicitly toggle the switch with animation.
     */
    public func toggleAnimated() {
        setOn(!isOn, animated: true)
    }
    
}
