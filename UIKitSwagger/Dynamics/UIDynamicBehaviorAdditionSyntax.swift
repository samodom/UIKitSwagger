//
//  UIDynamicBehaviorAdditionSyntax.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/14/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
Convenience operator for adding a dynamic behavior to a parent behavior.
- parameter parentBehavior: Dynamic behavior to which the child behavior should be added.
- parameter behavior: Child dynamic behavior to add to the parent behavior.
*/
public func +=(parentBehavior: UIDynamicBehavior, behavior: UIDynamicBehavior) {
    parentBehavior.addChildBehavior(behavior)
}

/**
Convenience operator for adding an array of dynamic behaviors to a parent behavior.
- parameter parentBehavior: Dynamic behavior to which the child behaviors should be added.
- parameter behaviors: Array of child dynamic behaviors to add to the parent behavior.
*/
public func +=(parentBehavior: UIDynamicBehavior, behaviors: [UIDynamicBehavior]) {
    behaviors.forEach { parentBehavior += $0 }
}

/**
Convenience operator for removing a dynamic behavior from a parent behavior.
- parameter parentBehavior: Dynamic behavior from which the child behavior should be removed.
- parameter behavior: Child dynamic behavior to remove from the parent behavior.
*/
public func -=(parentBehavior: UIDynamicBehavior, behavior: UIDynamicBehavior) {
    parentBehavior.removeChildBehavior(behavior)
}

/**
Convenience operator for removing an array of dynamic behaviors from a parent behavior.
- parameter parentBehavior: Dynamic behavior from which the child behaviors should be removed.
- parameter behaviors: Array of child dynamic behaviors to remove from the parent behavior.
*/
public func -=(parentBehavior: UIDynamicBehavior, behaviors: [UIDynamicBehavior]) {
    behaviors.forEach { parentBehavior -= $0 }
}
