//
//  ConstraintInternal.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 4/30/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit

//  MARK: - Comparison

internal extension NSLayoutConstraint  {

    internal func componentsMatch(otherConstraint: NSLayoutConstraint) -> Bool {
        guard firstItem === otherConstraint.firstItem else { return false }
        guard firstAttribute == otherConstraint.firstAttribute else { return false }
        guard secondItem === otherConstraint.secondItem else { return false }
        guard secondAttribute == otherConstraint.secondAttribute else { return false }
        guard relation == otherConstraint.relation else { return false }

        func valueWithinTolerance(value1: CGFloat, _ value2: CGFloat) -> Bool {
            return Double(abs(value1 - value2)) < 1e-5
        }

        guard valueWithinTolerance(multiplier, otherConstraint.multiplier) else { return false }
        guard valueWithinTolerance(constant, otherConstraint.constant) else { return false }

        return true
    }
    
}

//  MARK: - Search

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

//  MARK: - Reversal

internal extension NSLayoutConstraint {

    internal func canBeReversed() -> Bool {
        return multiplier != 0.0 && secondItem != nil && secondAttribute != .NotAnAttribute
    }
    
}
