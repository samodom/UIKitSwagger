//
//  ConstraintActivation.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit


public extension NSLayoutConstraint {

    /**
     Convenience method to activate an auto layout constraint.
     */
    public func activate() {
        active = true
    }

    /**
     Convenience method to deactivate an auto layout constraint.
     */
    public func deactivate() {
        active = false
    }

}


public extension Array where Element: NSLayoutConstraint {

    /**
     Convenience method to activate each auto layout constraint in an array.
     */
    public func activate() {
        forEach { $0.activate() }
    }

    /**
     Convenience method to deactivate each auto layout constraint in an array.
     */
    public func deactivate() {
        forEach { $0.deactivate() }
    }

}


/**
 Convenience method for activating one or more layout constraints.
 - parameter constraints: One or more constraints that are to be activated.
 */
public func ActivateConstraints(constraints: NSLayoutConstraint...) {
    ActivateConstraints(constraints)
}

/**
 Convenience method for activating an array of layout constraints.
 - parameter constraints: Array of constraints that are to be activated.
 */
public func ActivateConstraints(constraints: [NSLayoutConstraint]) {
    constraints.forEach { $0.active = true }
}

/**
 Convenience method for deactivating one or more layout constraints.
 - parameter constraints: One or more constraints that are to be deactivated.
 */
public func DeactivateConstraints(constraints: NSLayoutConstraint...) {
    DeactivateConstraints(constraints)
}

/**
 Convenience method for deactivating an array of layout constraints.
 - parameter constraints: Array of constraints that are to be deactivated.
 */
public func DeactivateConstraints(constraints: [NSLayoutConstraint]) {
    constraints.forEach { $0.active = false }
}
