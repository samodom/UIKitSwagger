//
//  AutoLayoutSyntaxInternal.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 4/30/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit

internal func BuildConstantRelationConstraint(item attributedItem: AutoLayoutAttributedItem, constant: CGFloat, relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
    return NSLayoutConstraint(
        item: attributedItem.item,
        attribute: attributedItem.attribute,
        relatedBy: relation,
        toItem: nil,
        attribute: .NotAnAttribute,
        multiplier: 0.0,
        constant: constant
    )
}

internal func BuildConstraintFromOperands(attributedItem: AutoLayoutAttributedItem, offset: AutoLayoutAttributedItemOffset, relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
    return NSLayoutConstraint(
        item: attributedItem.item,
        attribute: attributedItem.attribute,
        relatedBy: relation,
        toItem: offset.attributedItem.attributedItem.item,
        attribute: offset.attributedItem.attributedItem.attribute,
        multiplier: offset.attributedItem.coefficient,
        constant: offset.constant
    )
}

