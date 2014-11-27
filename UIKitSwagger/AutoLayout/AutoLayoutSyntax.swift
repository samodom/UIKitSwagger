//
//  AutoLayoutSyntax.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
  Pair representing an Auto Layout attribute for an item with a coefficient for producing a scalar multiple of the layout value.
*/
public typealias AutoLayoutAttributedItemScalarMultiple = (coefficient: CGFloat, attributedItem: AutoLayoutAttributedItem)

/**
  Implementation of multiplication operator to create a pair representing the scalar multiple of an Auto Layout value.
*/
public func *(multiplier: CGFloat, attributedItem: AutoLayoutAttributedItem) -> AutoLayoutAttributedItemScalarMultiple {
    return (multiplier, attributedItem)
}


/**
  Pair representing a scalar multiple of an Auto Layout attribute for an item with a constant for producing a value offset from the original.
*/
public typealias AutoLayoutAttributedItemOffset = (attributedItem: AutoLayoutAttributedItemScalarMultiple, constant: CGFloat)

/**
  Implementation of addition operator to create a pair representing a value that is offset by a constant amount from an Auto Layout value.
*/
public func +(attributedItem: AutoLayoutAttributedItem, constant: CGFloat) -> AutoLayoutAttributedItemOffset {
    return ((1, attributedItem), constant)
}

/**
  Implementation of subtraction operator to create a pair representing a value that is offset by a constant amount from an Auto Layout value.
*/
public func -(attributedItem: AutoLayoutAttributedItem, constant: CGFloat) -> AutoLayoutAttributedItemOffset {
    return ((1, attributedItem), -constant)
}

/**
  Implementation of addition operator to create a pair representing a value that is offset by a constant amount from a scalar multiple of an Auto Layout value.
*/
public func +(multiple: AutoLayoutAttributedItemScalarMultiple, constant: CGFloat) -> AutoLayoutAttributedItemOffset {
    return (multiple, constant)
}

/**
  Implementation of subtraction operator to create a pair representing a value that is offset by a constant amount from a scalar multiple of an Auto Layout value.
*/
public func -(multiple: AutoLayoutAttributedItemScalarMultiple, constant: CGFloat) -> AutoLayoutAttributedItemOffset {
    return (multiple, -constant)
}


/**
  An operator used to create a layout constraint in the simple y = mx + b format.
*/
infix operator =* { }

public func =*(attributedItem: AutoLayoutAttributedItem, constant: CGFloat) -> Constraint {
    return BuildConstantRelationConstraint(attributedItem, constant)
}

public func =*(attributedItem1: AutoLayoutAttributedItem, attributedItem2: AutoLayoutAttributedItem) -> Constraint {
    return attributedItem1 =* 1 * attributedItem2
}

public func =*(attributedItem: AutoLayoutAttributedItem, multiple: AutoLayoutAttributedItemScalarMultiple) -> Constraint {
    return attributedItem =* multiple + 0.0
}

public func =*(attributedItem: AutoLayoutAttributedItem, offset: AutoLayoutAttributedItemOffset) -> Constraint {
    return BuildConstraintFromOperands(attributedItem, offset)
}


/**
  An operator used to create a layout constraint in the simple y >= mx + b format.
*/
infix operator >=* { }

public func >=*(attributedItem: AutoLayoutAttributedItem, constant: CGFloat) -> Constraint {
    return BuildConstantRelationConstraint(attributedItem, constant, relation: .GreaterThanOrEqual)
}

public func >=*(attributedItem1: AutoLayoutAttributedItem, attributedItem2: AutoLayoutAttributedItem) -> Constraint {
    return attributedItem1 >=* 1 * attributedItem2
}

public func >=*(attributedItem: AutoLayoutAttributedItem, multiple: AutoLayoutAttributedItemScalarMultiple) -> Constraint {
    return attributedItem >=* multiple + 0.0
}

public func >=*(attributedItem: AutoLayoutAttributedItem, offset: AutoLayoutAttributedItemOffset) -> Constraint {
    return BuildConstraintFromOperands(attributedItem, offset, relation: .GreaterThanOrEqual)
}


/**
  An operator used to create a layout constraint in the simple y <= mx + b format.
*/
infix operator <=* { }

public func <=*(attributedItem: AutoLayoutAttributedItem, constant: CGFloat) -> Constraint {
    return BuildConstantRelationConstraint(attributedItem, constant, relation: .LessThanOrEqual)
}

public func <=*(attributedItem1: AutoLayoutAttributedItem, attributedItem2: AutoLayoutAttributedItem) -> Constraint {
    return attributedItem1 <=* 1 * attributedItem2
}

public func <=*(attributedItem: AutoLayoutAttributedItem, multiple: AutoLayoutAttributedItemScalarMultiple) -> Constraint {
    return attributedItem <=* multiple + 0.0
}

public func <=*(attributedItem: AutoLayoutAttributedItem, offset: AutoLayoutAttributedItemOffset) -> Constraint {
    return BuildConstraintFromOperands(attributedItem, offset, relation: .LessThanOrEqual)
}


private func BuildConstantRelationConstraint(attributedItem: AutoLayoutAttributedItem, constant: CGFloat, relation: NSLayoutRelation = .Equal) -> Constraint {
    return Constraint(item: attributedItem.item, attribute: attributedItem.attribute, relatedBy: relation, toItem: nil, attribute: .NotAnAttribute, multiplier: 0.0, constant: constant)
}

private func BuildConstraintFromOperands(attributedItem: AutoLayoutAttributedItem, offset: AutoLayoutAttributedItemOffset, relation: NSLayoutRelation = .Equal) -> Constraint {
    return Constraint(item: attributedItem.item, attribute: attributedItem.attribute, relatedBy: relation, toItem: offset.attributedItem.attributedItem.item, attribute: offset.attributedItem.attributedItem.attribute, multiplier: offset.attributedItem.coefficient, constant: offset.constant)
}


/**
  An operator used to set the priority or identifier on a constraint.
*/
infix operator ~ { }

public func ~(constraint: Constraint, priority: UILayoutPriority) {
    constraint.priority = priority
}

public func ~(constraint: Constraint, identifier: String?) {
    constraint.identifier = identifier
}

