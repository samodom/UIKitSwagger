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
*/
public func +=(parentBehavior: UIDynamicBehavior, behavior: UIDynamicBehavior) {
    parentBehavior.addChildBehavior(behavior)
}

/**
  Convenience operator for adding an array of dynamic behaviors to a parent behavior.
*/
public func +=(parentBehavior: UIDynamicBehavior, behaviors: [UIDynamicBehavior]) {
    for behavior in behaviors {
        parentBehavior += behavior
    }
}

/**
  Convenience operator for removing a dynamic behavior from a parent behavior.
*/
public func -=(parentBehavior: UIDynamicBehavior, behavior: UIDynamicBehavior) {
    parentBehavior.removeChildBehavior(behavior)
}

/**
  Convenience operator for removing an array of dynamic behaviors from a parent behavior.
*/
public func -=(parentBehavior: UIDynamicBehavior, behaviors: [UIDynamicBehavior]) {
    for behavior in behaviors {
        parentBehavior -= behavior
    }
}
