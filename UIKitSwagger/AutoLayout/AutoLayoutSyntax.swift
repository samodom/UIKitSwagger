//
//  AutoLayoutSyntax.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
 Pair representing an Auto Layout attributable item (view or layout guide) and an NSLayoutAttribute.
 */
public typealias AutoLayoutAttributedItem = (item: AnyObject, attribute: NSLayoutAttribute)

/**
 Pair representing an Auto Layout attribute for an item with a coefficient for producing a scalar multiple of the layout value.
 */
public typealias AutoLayoutAttributedItemScalarMultiple = (coefficient: CGFloat, attributedItem: AutoLayoutAttributedItem)

/**
 Implementation of multiplication operator to create a pair representing the scalar multiple of an Auto Layout value.
 - Parameter multiplier: Scalar multiple to use with the provided layout value.
 - Parameter attributedItem: Layout item/attribute pair with value to multiple.
 - Returns: Pair with coefficient and attributed item.
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
 - Parameter attributedItem: Layout item/attribute pair with value to add to.
 - Parameter constant: Constant to use with the provided layout value.
 - Returns: Pair with attributed item and offset.
 */
public func +(attributedItem: AutoLayoutAttributedItem, constant: CGFloat) -> AutoLayoutAttributedItemOffset {
    return ((1, attributedItem), constant)
}

/**
 Implementation of subtraction operator to create a pair representing a value that is offset by a constant amount from an Auto Layout value.
 - Parameter attributedItem: Layout item/attribute pair with value to subtract from.
 - Parameter constant: Constant to use with the provided layout value.
 - Returns: Pair with attributed item and constant.
 */
public func -(attributedItem: AutoLayoutAttributedItem, constant: CGFloat) -> AutoLayoutAttributedItemOffset {
    return ((1, attributedItem), -constant)
}

/**
 Implementation of addition operator to create a pair representing a value that is offset by a constant amount from a scalar multiple of an Auto Layout value.
 - Parameter multiple: Multiple pair with value to add to.
 - Parameter constant: Constant to use with the provided layout value.
 - Returns: Pair with multiple and constant.
 */
public func +(multiple: AutoLayoutAttributedItemScalarMultiple, constant: CGFloat) -> AutoLayoutAttributedItemOffset {
    return (multiple, constant)
}

/**
 Implementation of subtraction operator to create a pair representing a value that is offset by a constant amount from a scalar multiple of an Auto Layout value.
 - Parameter multiple: Multiple pair with value to subtract from.
 - Parameter constant: Constant to use with the provided layout value.
 - Returns: Pair with multiple and constant.
 */
public func -(multiple: AutoLayoutAttributedItemScalarMultiple, constant: CGFloat) -> AutoLayoutAttributedItemOffset {
    return (multiple, -constant)
}


/**
An operator used to create a layout constraint in the simple `y = mx + b` format.
 */
infix operator =* { }

/**
 Equal constraint relation operator for creating constraints.
 - Parameter attributedItem: Dependendent layout value.
 - Parameter constant: Constant value to constrain to.
 - Returns: Constraint created from relationship expressed in parameters.
 */
public func =*(attributedItem: AutoLayoutAttributedItem, constant: CGFloat) -> NSLayoutConstraint {
    return BuildConstantRelationConstraint(item: attributedItem, constant: constant)
}

/**
 Equal constraint relation operator for creating constraints.
 - Parameter attributedItem1: Dependendent layout value.
 - Parameter attributedItem2: Independendent layout value.
 - Returns: Constraint created from relationship expressed in parameters.
 */
public func =*(attributedItem1: AutoLayoutAttributedItem, attributedItem2: AutoLayoutAttributedItem) -> NSLayoutConstraint {
    return attributedItem1 =* 1 * attributedItem2
}

/**
 Equal constraint relation operator for creating constraints.
 - Parameter attributedItem: Dependendent layout value.
 - Parameter multiple: Independendent scalar multiple layout value.
 - Returns: Constraint created from relationship expressed in parameters.
 */
public func =*(attributedItem: AutoLayoutAttributedItem, multiple: AutoLayoutAttributedItemScalarMultiple) -> NSLayoutConstraint {
    return attributedItem =* multiple + 0.0
}

/**
 Equal constraint relation operator for creating constraints.
 - Parameter attributedItem: Dependendent layout value.
 - Parameter offset: Independendent offset layout value.
 - Returns: Constraint created from relationship expressed in parameters.
 */
public func =*(attributedItem: AutoLayoutAttributedItem, offset: AutoLayoutAttributedItemOffset) -> NSLayoutConstraint {
    return BuildConstraintFromOperands(attributedItem, offset: offset)
}


/**
 An operator used to create a layout constraint in the simple `y >= mx + b` format.
 */
infix operator >=* { }

/**
 Greater-than-or-equal constraint relation operator for creating constraints.
 - Parameter attributedItem: Dependendent layout value.
 - Parameter constant: Constant value to constrain to.
 - Returns: Constraint created from relationship expressed in parameters.
 */
public func >=*(attributedItem: AutoLayoutAttributedItem, constant: CGFloat) -> NSLayoutConstraint {
    return BuildConstantRelationConstraint(item: attributedItem, constant: constant, relation: .GreaterThanOrEqual)
}

/**
 Greater-than-or-equal constraint relation operator for creating constraints.
 - Parameter attributedItem1: Dependendent layout value.
 - Parameter attributedItem2: Independendent layout value.
 - Returns: Constraint created from relationship expressed in parameters.
 */
public func >=*(attributedItem1: AutoLayoutAttributedItem, attributedItem2: AutoLayoutAttributedItem) -> NSLayoutConstraint {
    return attributedItem1 >=* 1 * attributedItem2
}

/**
 Greater-than-or-equal constraint relation operator for creating constraints.
 - Parameter attributedItem: Dependendent layout value.
 - Parameter multiple: Independendent scalar multiple layout value.
 - Returns: Constraint created from relationship expressed in parameters.
 */
public func >=*(attributedItem: AutoLayoutAttributedItem, multiple: AutoLayoutAttributedItemScalarMultiple) -> NSLayoutConstraint {
    return attributedItem >=* multiple + 0.0
}

/**
 Greater-than-or-equal constraint relation operator for creating constraints.
 - Parameter attributedItem: Dependendent layout value.
 - Parameter offset: Independendent offset layout value.
 - Returns: Constraint created from relationship expressed in parameters.
 */
public func >=*(attributedItem: AutoLayoutAttributedItem, offset: AutoLayoutAttributedItemOffset) -> NSLayoutConstraint {
    return BuildConstraintFromOperands(attributedItem, offset: offset, relation: .GreaterThanOrEqual)
}


/**
 An operator used to create a layout constraint in the simple `y <= mx + b` format.
 */
infix operator <=* { }

/**
 Less-than-or-equal constraint relation operator for creating constraints.
 - Parameter attributedItem: Dependendent layout value.
 - Parameter constant: Constant value to constrain to.
 - Returns: Constraint created from relationship expressed in parameters.
 */
public func <=*(attributedItem: AutoLayoutAttributedItem, constant: CGFloat) -> NSLayoutConstraint {
    return BuildConstantRelationConstraint(item: attributedItem, constant: constant, relation: .LessThanOrEqual)
}

/**
 Less-than-or-equal constraint relation operator for creating constraints.
 - Parameter attributedItem1: Dependendent layout value.
 - Parameter attributedItem2: Independendent layout value.
 - Returns: Constraint created from relationship expressed in parameters.
 */
public func <=*(attributedItem1: AutoLayoutAttributedItem, attributedItem2: AutoLayoutAttributedItem) -> NSLayoutConstraint {
    return attributedItem1 <=* 1 * attributedItem2
}

/**
 Less-than-or-equal constraint relation operator for creating constraints.
 - Parameter attributedItem: Dependendent layout value.
 - Parameter multiple: Independendent scalar multiple layout value.
 - Returns: Constraint created from relationship expressed in parameters.
 */
public func <=*(attributedItem: AutoLayoutAttributedItem, multiple: AutoLayoutAttributedItemScalarMultiple) -> NSLayoutConstraint {
    return attributedItem <=* multiple + 0.0
}

/**
 Less-than-or-equal constraint relation operator for creating constraints.
 - Parameter attributedItem: Dependendent layout value.
 - Parameter offset: Independendent offset layout value.
 - Returns: Constraint created from relationship expressed in parameters.
 */
public func <=*(attributedItem: AutoLayoutAttributedItem, offset: AutoLayoutAttributedItemOffset) -> NSLayoutConstraint {
    return BuildConstraintFromOperands(attributedItem, offset: offset, relation: .LessThanOrEqual)
}


/**
 An operator used to set the priority or identifier on a constraint.
 */
infix operator ~ { }

/**
 Sets the priority of a layout constraint.
 - Parameter constraint: Layout constraint with priority to change.
 - Parameter priority: New priority value for constraint.
 */
public func ~(constraint: NSLayoutConstraint, priority: UILayoutPriority) {
    constraint.priority = priority
}

/**
 Sets the identifier of a layout constraint.
 - Parameter constraint: Layout constraint with priority to change.
 - Parameter identifier: New identifier value for constraint.
 */
public func ~(constraint: NSLayoutConstraint, identifier: String?) {
    constraint.identifier = identifier
}
