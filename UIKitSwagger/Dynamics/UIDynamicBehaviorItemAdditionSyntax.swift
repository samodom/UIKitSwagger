//
//  UIDynamicBehaviorItemAdditionSyntax.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/14/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public protocol UIDynamicBehaviorItemAdditive {
    func addItem(item: UIDynamicItem)
    func removeItem(item: UIDynamicItem)
}

extension UIDynamicItemBehavior: UIDynamicBehaviorItemAdditive { }
extension UIGravityBehavior: UIDynamicBehaviorItemAdditive { }
extension UICollisionBehavior: UIDynamicBehaviorItemAdditive { }
extension UIPushBehavior: UIDynamicBehaviorItemAdditive { }

/**
Convenience operator for adding a dynamic item to a dynamic behavior.
- parameter behavior: Dynamic behavior to which the item should be added.
- parameter item: Dynamic item to add to the behavior.
*/
public func +=(behavior: UIDynamicBehaviorItemAdditive, item: UIDynamicItem) {
    behavior.addItem(item)
}

/**
Convenience operator for adding an array of dynamic items to a dynamic behavior.
- parameter behavior: Dynamic behavior to which the items should be added.
- parameter items: Dynamic items to add to the behavior.
*/
public func +=(behavior: UIDynamicBehaviorItemAdditive, items: [UIDynamicItem]) {
    items.forEach { behavior += $0 }
}

/**
Convenience operator for removing a dynamic item from a dynamic behavior.
- parameter behavior: Dynamic behavior from which the item should be removed.
- parameter item: Dynamic item to remove from the behavior.
*/
public func -=(behavior: UIDynamicBehaviorItemAdditive, item: UIDynamicItem) {
    behavior.removeItem(item)
}

/**
Convenience operator for removing an array of dynamic items from a dynamic behavior.
- parameter behavior: Dynamic behavior from which the items should be removed.
- parameter items: Dynamic item to remove from the behavior.
*/
public func -=(behavior: UIDynamicBehaviorItemAdditive, items: [UIDynamicItem]) {
    items.forEach { behavior -= $0 }
}
