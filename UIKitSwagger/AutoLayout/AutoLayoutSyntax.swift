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

public func =*(lhs: AutoLayoutAttributedItem, rhs: CGFloat) -> Constraint {
    return BuildConstantRelationConstraint(lhs, rhs)
}

public func =*(lhs: AutoLayoutAttributedItem, rhs: AutoLayoutAttributedItem) -> Constraint {
    return lhs =* 1 * rhs
}

public func =*(lhs: AutoLayoutAttributedItem, rhs: AutoLayoutAttributedItemScalarMultiple) -> Constraint {
    return lhs =* rhs + 0.0
}

public func =*(lhs: AutoLayoutAttributedItem, rhs: AutoLayoutAttributedItemOffset) -> Constraint {
    return BuildConstraintFromOperands(lhs, rhs, relation: .Equal)
}


/**
  An operator used to create a layout constraint in the simple y >= mx + b format.
*/
infix operator >=* { }

public func >=*(lhs: AutoLayoutAttributedItem, rhs: CGFloat) -> Constraint {
    return BuildConstantRelationConstraint(lhs, rhs, relation: .GreaterThanOrEqual)
}

public func >=*(lhs: AutoLayoutAttributedItem, rhs: AutoLayoutAttributedItem) -> Constraint {
    return lhs >=* 1 * rhs
}

public func >=*(lhs: AutoLayoutAttributedItem, rhs: AutoLayoutAttributedItemScalarMultiple) -> Constraint {
    return lhs >=* rhs + 0.0
}

public func >=*(lhs: AutoLayoutAttributedItem, rhs: AutoLayoutAttributedItemOffset) -> Constraint {
    return BuildConstraintFromOperands(lhs, rhs, relation: .GreaterThanOrEqual)
}


/**
  An operator used to create a layout constraint in the simple y <= mx + b format.
*/
infix operator <=* { }

public func <=*(lhs: AutoLayoutAttributedItem, rhs: CGFloat) -> Constraint {
    return BuildConstantRelationConstraint(lhs, rhs, relation: .LessThanOrEqual)
}

public func <=*(lhs: AutoLayoutAttributedItem, rhs: AutoLayoutAttributedItem) -> Constraint {
    return lhs <=* 1 * rhs
}

public func <=*(lhs: AutoLayoutAttributedItem, rhs: AutoLayoutAttributedItemScalarMultiple) -> Constraint {
    return lhs <=* rhs + 0.0
}

public func <=*(lhs: AutoLayoutAttributedItem, rhs: AutoLayoutAttributedItemOffset) -> Constraint {
    return BuildConstraintFromOperands(lhs, rhs, relation: .LessThanOrEqual)
}


private func BuildConstantRelationConstraint(attributedItem: AutoLayoutAttributedItem, constant: CGFloat, relation: NSLayoutRelation = .Equal) -> Constraint {
    return Constraint(item: attributedItem.item, attribute: attributedItem.attribute, relatedBy: relation, toItem: nil, attribute: .NotAnAttribute, multiplier: 0.0, constant: constant)
}

private func BuildConstraintFromOperands(lhs: AutoLayoutAttributedItem, rhs: AutoLayoutAttributedItemOffset, relation: NSLayoutRelation = .Equal) -> Constraint {
    return Constraint(item: lhs.item, attribute: lhs.attribute, relatedBy: relation, toItem: rhs.attributedItem.attributedItem.item, attribute: rhs.attributedItem.attributedItem.attribute, multiplier: rhs.attributedItem.coefficient, constant: rhs.constant)
}

