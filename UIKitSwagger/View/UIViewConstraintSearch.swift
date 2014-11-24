//
//  UIViewConstraintSearch.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 9/25/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import UIKit

public extension UIView {

    /**
      Provides all of this view's constraints where one of the items matches the item provided.
      @param        item Layout item for which to search among this view's constraints.
      @return       One or more constraints where either item in the constraint matches the provided item, if found.
    */
    public func constraintsForItem(item: AnyObject) -> [Constraint]? {
        return filteredConstraints({ $0.hasItem(item) })
    }

    /**
      Provides all of this view's constraints where one of the attributes matches the attribute provided.
      @param        attribute Layout attribute for which to search among this view's constraints.
      @return       One or more constraints where either attribute in the constraint matches the provided attribute, if found.
    */
    public func constraintsForAttribute(attribute: NSLayoutAttribute) -> [Constraint]? {
        return filteredConstraints({ $0.hasAttribute(attribute) })
    }

    /**
      Provides all of this view's constraints where one of the item/attribute pairs matches the item and attribute provided.
      @param        item Layout item for which to search among this view's constraints.
      @param        attribute Layout attribute of `item` for which to search among this view's constraints.
      @return       One or more constraints where the item/attribute in the constraint match the provided item/attribute, if found.
    */
    public func constraintsForAttributedItem(attributedItem: AutoLayoutAttributedItem) -> [Constraint]? {
        return filteredConstraints({ $0.hasAttributedItem(attributedItem) })
    }

    /**
    Provides all of this view's constraints the items of which match the two items provided.
      @param        items Pair of layout items for which to search among this view's constraints.
      @return       One or more constraints where the items in the constraint match the provided item, if found.
    */
    public func constraintsForItems(itemOne: AnyObject, _ itemTwo: AnyObject) -> [Constraint]? {
        return filteredConstraints({ $0.hasItems(itemOne, itemTwo) })
    }

    /**
    Provides all of this view's constraints the items and attributes of which match the two item/attribute pairs provided
      @param        attributedItems Pair of layout item/attribute pairs for which to search among this view's constraints.
      @return       One or more constraints where the item/attribute in the constraint match the provided item/attribute pairs, if found.
    */
    public func constraintsForAttributedItems(itemOne: AutoLayoutAttributedItem, _ itemTwo: AutoLayoutAttributedItem) -> [Constraint]? {
        return filteredConstraints({ $0.hasAttributedItems(itemOne, itemTwo) })
    }

    private typealias ConstraintFilter = Constraint -> Bool

    private func filteredConstraints(filter: ConstraintFilter) -> [Constraint]? {
        let allConstraints = constraints() as [Constraint]
        let filteredConstraints = allConstraints.filter(filter)
        if filteredConstraints.count == 0 {
            return nil
        }
        else {
            return filteredConstraints
        }
    }
}
