//
//  UIViewConstraintSearch.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 9/25/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import UIKit

public extension UIView {

    public func constraintsForItem(item: AnyObject) -> [Constraint] {
        return filteredConstraints({ $0.hasItem(item) })
    }

    public func constraintsForAttribute(attribute: NSLayoutAttribute) -> [Constraint] {
        return filteredConstraints({ $0.hasAttribute(attribute) })
    }

    public func constraintsForItem(item: AnyObject, attribute: NSLayoutAttribute) -> [Constraint] {
        return filteredConstraints({ $0.hasAttributedItem((item, attribute)) })
    }

    public func constraintsForItems(items: ItemPair) -> [Constraint] {
        return filteredConstraints({ $0.hasItems(items) })
    }

    public func constraintsForItems(attributedItems: (AttributedItem, AttributedItem)) -> [Constraint] {
        return filteredConstraints({ $0.hasAttributedItems(attributedItems) })
    }

    private typealias ConstraintFilter = Constraint -> Bool

    private func filteredConstraints(filter: ConstraintFilter) -> [Constraint] {
        let allConstraints = constraints() as [Constraint]
        return allConstraints.filter(filter)
    }
}
