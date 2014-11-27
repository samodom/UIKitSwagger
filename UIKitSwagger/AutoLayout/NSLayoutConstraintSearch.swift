//
//  NSLayoutConstraintSearch.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 9/25/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import UIKit

internal extension Constraint {
    internal func hasItem(item: AnyObject) -> Bool {
        if firstItem.isEqual(item) {
            return true
        }
        else if secondItem == nil {
            return false
        }
        else if secondItem!.isEqual(item) {
            return true
        }

        return false
    }

    internal func hasItems(itemOne: AnyObject, _ itemTwo: AnyObject) -> Bool {
        assert(itemOne !== itemTwo, "The items must be different")
        if secondItem == nil {
            return false
        }

        if firstItem.isEqual(itemOne) && secondItem!.isEqual(itemTwo) {
            return true
        }
        else if firstItem.isEqual(itemTwo) && secondItem!.isEqual(itemOne) {
            return true
        }

        return false
    }

    internal func hasAttribute(attribute: NSLayoutAttribute) -> Bool {
        return firstAttribute == attribute || secondAttribute == attribute
    }

    internal func hasAttributedItem(attributedItem: AutoLayoutAttributedItem) -> Bool {
        if firstAttribute == attributedItem.attribute && firstItem.isEqual(attributedItem.item) {
            return true
        }
        else if secondItem == nil {
            return false
        }
        else if secondAttribute == attributedItem.attribute && secondItem!.isEqual(attributedItem.item) {
            return true
        }

        return false
    }

    internal func hasAttributedItems(itemOne: AutoLayoutAttributedItem, _ itemTwo: AutoLayoutAttributedItem) -> Bool {
        return hasAttributedItem(itemOne) && hasAttributedItem(itemTwo)
    }
}
