//
//  ConstraintSearch.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 9/25/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import UIKit

public extension UIView {

    /**
     Provides all of this view's constraints where one of the items matches the item provided.
     - parameter item: Layout item for which to search among this view's constraints.
     - returns: One or more constraints where either item in the constraint matches the provided item, if found.
     */
    public func constraintsForItem(_ item: AnyObject) -> [NSLayoutConstraint] {
        return constraints.filter { $0.hasItem(item) }
    }

    /**
     Provides all of this view's constraints where one of the attributes matches the attribute provided.
     - parameter attribute: Layout attribute for which to search among this view's constraints.
     - returns: One or more constraints where either attribute in the constraint matches the provided attribute, if found.
     */
    public func constraintsForAttribute(_ attribute: NSLayoutAttribute) -> [NSLayoutConstraint] {
        return constraints.filter { $0.hasAttribute(attribute) }
    }

    /**
     Provides all of this view's constraints where one of the item/attribute pairs matches the item and attribute provided.
     - parameter item: Layout item for which to search among this view's constraints.
     - parameter attribute: Layout attribute of `item` for which to search among this view's constraints.
     - returns: One or more constraints where the item/attribute in the constraint match the provided item/attribute, if found.
     */
    public func constraintsForAttributedItem(_ attributedItem: AutoLayoutAttributedItem) -> [NSLayoutConstraint] {
        return constraints.filter { $0.hasAttributedItem(attributedItem) }
    }

    /**
     Provides all of this view's constraints the items of which match the two items provided.
     - parameter items: Pair of layout items for which to search among this view's constraints.
     - returns: One or more constraints where the items in the constraint match the provided item, if found.
     */
    public func constraintsForItems(_ itemOne: AnyObject, _ itemTwo: AnyObject) -> [NSLayoutConstraint] {
        return constraints.filter { $0.hasItems(itemOne, itemTwo) }
    }

    /**
     Provides all of this view's constraints the items and attributes of which match the two item/attribute pairs provided.
     - parameter attributedItems: Pair of layout item/attribute pairs for which to search among this view's constraints.
     - returns: One or more constraints where the item/attribute in the constraint match the provided item/attribute pairs, if found.
     */
    public func constraintsForAttributedItems(_ itemOne: AutoLayoutAttributedItem, _ itemTwo: AutoLayoutAttributedItem) -> [NSLayoutConstraint] {
        return constraints.filter { $0.hasAttributedItems(itemOne, itemTwo) }
    }

    /**
     Searches the view's auto layout constraints for one matching the specified constraint.
     - parameter constraint: Auto layout constraint to search for in the view's constraints.
     - note: This method will match the same instance of `NSLayoutConstraint` provided OR an equivalent constraint as defined by constraint equality in this framework.
     */
    public func hasConstraint(_ constraint: NSLayoutConstraint) -> Bool {
        return constraints.contains(constraint)
    }
    
}


internal extension NSLayoutConstraint {

    internal func hasItem(_ item: AnyObject) -> Bool {
        return firstItem.isEqual(item) || (secondItem != nil && secondItem!.isEqual(item))
    }

    internal func hasItems(_ itemOne: AnyObject, _ itemTwo: AnyObject) -> Bool {
        assert(itemOne !== itemTwo, "The items must be different")
        return secondItem != nil && itemsMatch(itemOne, itemTwo)
    }

    fileprivate func itemsMatch(_ itemOne: AnyObject, _ itemTwo: AnyObject) -> Bool {
        return firstItem.isEqual(itemOne) && secondItem!.isEqual(itemTwo) ||
            firstItem.isEqual(itemTwo) && secondItem!.isEqual(itemOne)
    }

    internal func hasAttribute(_ attribute: NSLayoutAttribute) -> Bool {
        return firstAttribute == attribute || secondAttribute == attribute
    }

    internal func hasAttributedItem(_ attributedItem: AutoLayoutAttributedItem) -> Bool {
        switch attributedItem.attribute {
        case firstAttribute:
            return firstItem.isEqual(attributedItem.item)

        case secondAttribute:
            return secondItem != nil && secondItem!.isEqual(attributedItem.item)

        default:
            return false
        }
    }

    internal func hasAttributedItems(_ itemOne: AutoLayoutAttributedItem, _ itemTwo: AutoLayoutAttributedItem) -> Bool {
        return hasAttributedItem(itemOne) && hasAttributedItem(itemTwo)
    }

}
