//
//  NSLayoutConstraintSearch.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 9/25/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import UIKit

internal extension NSLayoutConstraint {

    internal func hasItem(item: AnyObject) -> Bool {
        return firstItem.isEqual(item) || (secondItem != nil && secondItem!.isEqual(item))
    }

    internal func hasItems(itemOne: AnyObject, _ itemTwo: AnyObject) -> Bool {
        assert(itemOne !== itemTwo, "The items must be different")
        return secondItem != nil && itemsMatch(itemOne, itemTwo)
    }

    private func itemsMatch(itemOne: AnyObject, _ itemTwo: AnyObject) -> Bool {
        return firstItem.isEqual(itemOne) && secondItem!.isEqual(itemTwo) ||
            firstItem.isEqual(itemTwo) && secondItem!.isEqual(itemOne)
    }

    internal func hasAttribute(attribute: NSLayoutAttribute) -> Bool {
        return firstAttribute == attribute || secondAttribute == attribute
    }

    internal func hasAttributedItem(attributedItem: AutoLayoutAttributedItem) -> Bool {
        switch attributedItem.attribute {
        case firstAttribute:
            return firstItem.isEqual(attributedItem.item)

        case secondAttribute:
            return secondItem != nil && secondItem!.isEqual(attributedItem.item)

        default:
            return false
        }
    }

    internal func hasAttributedItems(itemOne: AutoLayoutAttributedItem, _ itemTwo: AutoLayoutAttributedItem) -> Bool {
        return hasAttributedItem(itemOne) && hasAttributedItem(itemTwo)
    }

}
