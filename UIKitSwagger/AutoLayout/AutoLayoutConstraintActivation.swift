//
//  AutoLayoutConstraintActivation.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

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
