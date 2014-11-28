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
  @param        constraints One or more constraints that are to be activated.
*/
public func ActivateConstraints(constraints: Constraint...) {
    ActivateConstraints(constraints)
}

/**
  Convenience method for activating an array of layout constraints.
  @param        constraints Array of constraints that are to be activated.
*/
public func ActivateConstraints(constraints: [Constraint]) {
    for constraint in constraints {
        constraint.active = true
    }
}

/**
  Convenience method for deactivating one or more layout constraints.
  @param        constraints One or more constraints that are to be deactivated.
*/
public func DeactivateConstraints(constraints: Constraint...) {
    DeactivateConstraints(constraints)
}

/**
  Convenience method for deactivating an array of layout constraints.
  @param        constraints Array of constraints that are to be deactivated.
*/
public func DeactivateConstraints(constraints: [Constraint]) {
    for constraint in constraints {
        constraint.active = false
    }
}
