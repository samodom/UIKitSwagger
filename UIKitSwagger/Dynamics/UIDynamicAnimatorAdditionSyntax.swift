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
*/
public func +=(animator: UIDynamicAnimator, behavior: UIDynamicBehavior) {
    animator.addBehavior(behavior)
}

/**
  Convenience operator for adding an array of dynamic behaviors to an animator.
*/
public func +=(animator: UIDynamicAnimator, behaviors: [UIDynamicBehavior]) {
    for behavior in behaviors {
        animator += behavior
    }
}

/**
  Convenience operator for removing a dynamic behavior from an animator.
*/
public func -=(animator: UIDynamicAnimator, behavior: UIDynamicBehavior) {
    animator.removeBehavior(behavior)
}

/**
  Convenience operator for removing an array of dynamic behaviors from an animator.
*/
public func -=(animator: UIDynamicAnimator, behaviors: [UIDynamicBehavior]) {
    for behavior in behaviors {
        animator -= behavior
    }
}
