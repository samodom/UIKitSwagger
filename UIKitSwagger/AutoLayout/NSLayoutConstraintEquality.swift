//
//  NSLayoutConstraintEquality.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 6/21/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import UIKit

/**
  We need a more concise way to refer to layout constraints instead of `NSLayoutConstraint` and this is it!
*/
public typealias Constraint = NSLayoutConstraint

/**
  Constraints should be equatable and we match them in a property-by-property manner.  The priority and identifier are not considered in the comparison.
*/
extension Constraint: Equatable  {

    private func componentsMatch(other: Constraint) -> Bool {
        if (firstAttribute != other.firstAttribute || secondAttribute != other.secondAttribute || relation != other.relation) {
            return false
        }

        let doubleAccuracy = 0.00001
        if Double(abs(multiplier - other.multiplier)) > doubleAccuracy || Double(abs(constant - other.constant)) > doubleAccuracy {
            return false
        }

        return firstItem === other.firstItem && secondItem === other.secondItem
    }

}

/**
  Global-level definition of the constraint equality operator overload
*/
public func == (lhs: Constraint, rhs: Constraint) -> Bool {

    if lhs.componentsMatch(rhs) {
        return true
    }

    if let reverse = rhs.reversed() {
        return lhs.componentsMatch(reverse)
    }

    return false
}

private extension NSLayoutRelation {
    private func reversed() -> NSLayoutRelation {
        return NSLayoutRelation(rawValue: -rawValue)!
    }
}

public extension Constraint {

    /**
      This method reverses a constraint from the form y R mx + b, where R is a layout relation, to the form x = (y - b) / m, where m != 0
    */
    public func reversed() -> Constraint? {
        if isIrreversible() {
            return nil
        }

        let newRelation = multiplier < 0 ? relation : relation.reversed()
        let newMultiplier = 1 / multiplier
        let newConstant = -constant / multiplier

        return Constraint(item: secondItem!, attribute: secondAttribute, relatedBy: newRelation, toItem: firstItem, attribute: firstAttribute, multiplier: newMultiplier, constant: newConstant)
    }

    private func isIrreversible() -> Bool {
        return (multiplier == 0.0) || (secondItem == nil) || (secondAttribute == .NotAnAttribute)
    }

    /**
      In order to work with positive constants, you may need to reverse a constraint.  In case you want to make sure you've always got a positive constant without checking yourself, this won't reverse your constraint if the constant is already non-negative.
    */
    public func makeConstantPositive() -> Constraint? {
        return constant < 0 ? reversed() : self
    }

}
