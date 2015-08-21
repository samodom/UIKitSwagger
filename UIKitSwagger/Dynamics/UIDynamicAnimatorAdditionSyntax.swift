//
//  UIDynamicAnimatorAdditionSyntax.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/14/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
Convenience operator for adding a dynamic behavior to an animator.
- parameter animator: Dynamic animator to which the behavior should be added.
- parameter behavior: Dynamic behavior to add to the animator.
*/
public func +=(animator: UIDynamicAnimator, behavior: UIDynamicBehavior) {
    animator.addBehavior(behavior)
}

/**
Convenience operator for adding an array of dynamic behaviors to an animator.
- parameter animator: Dynamic animator to which the behavior should be added.
- parameter behaviors: Array of dynamic behaviors to add to the animator.
*/
public func +=(animator: UIDynamicAnimator, behaviors: [UIDynamicBehavior]) {
    behaviors.forEach { animator += $0 }
}

/**
Convenience operator for removing a dynamic behavior from an animator.
- parameter animator: Dynamic animator from which the behavior should be removed.
- parameter behavior: Dynamic behavior to remove from the animator.
*/
public func -=(animator: UIDynamicAnimator, behavior: UIDynamicBehavior) {
    animator.removeBehavior(behavior)
}

/**
Convenience operator for removing an array of dynamic behaviors from an animator.
- parameter animator: Dynamic animator from which the behaviors should be removed.
- parameter behavior: Array of dynamic behaviors to remove from the animator.
*/
public func -=(animator: UIDynamicAnimator, behaviors: [UIDynamicBehavior]) {
    behaviors.forEach { animator -= $0 }
}
