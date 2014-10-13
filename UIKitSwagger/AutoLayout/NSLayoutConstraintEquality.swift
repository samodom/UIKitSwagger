//
//  NSLayoutConstraintEquality.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 6/21/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import UIKit

//  We need a more concise way to refer to layout constraints and this is it!
public typealias Constraint = NSLayoutConstraint

//  Constraints should be equatable and we match them in a property-by-property manner
//  The priority and identifier are not considered in the comparison
extension Constraint: Equatable  {

    private func componentsMatch(other: Constraint) -> Bool {
        //  Check the layout attributes first -- quick integer comparisons
        if (firstAttribute != other.firstAttribute || secondAttribute != other.secondAttribute || relation != other.relation) {
            return false
        }

        //  Then we'll check to make sure that the coefficients are close enough for government work
        let doubleAccuracy = 0.00001
        if Double(abs(multiplier - other.multiplier)) > doubleAccuracy || Double(abs(constant - other.constant)) > doubleAccuracy {
            return false
        }

        //  Finally, if needed, we'll do an item check in case that's more expensive
        return firstItem === other.firstItem && secondItem === other.secondItem
    }
}

//  Global level definition of the equality overload
public func == (lhs: Constraint, rhs: Constraint) -> Bool {

    //  Constriants are equivalent if each property matches
    if lhs.componentsMatch(rhs) {
        return true
    }

    //  The reverse constraint should also be considered equivalent
    if let reverse = rhs.reversed() {
        return lhs.componentsMatch(reverse)
    }

    return false
}

//  Reversal of constraint relation
private extension NSLayoutRelation {
    //  This produces >= from <= and vice versa, = is still =
    private func reversed() -> NSLayoutRelation {
        return NSLayoutRelation(rawValue: -rawValue)!
    }
}

public extension Constraint {

    //  This method reverses a constraint from the form y R mx + b, where R is a layout relation,
    //  to the form x = (y - b) / m, where m != 0
    public func reversed() -> Constraint? {

        //  You cannot reverse a constraint that has no second item (single variable) or has a
        //  zero multiplier (divide by zero)
        if isIrreversible() {
            return nil
        }

        //  Reverse the relation, invert the multiplier and convert the constant
        let newRelation = multiplier < 0 ? relation : relation.reversed()
        let newMultiplier = 1 / multiplier
        let newConstant = -constant / multiplier

        return Constraint(item: secondItem!, attribute: secondAttribute, relatedBy: newRelation, toItem: firstItem, attribute: firstAttribute, multiplier: newMultiplier, constant: newConstant)
    }

    private func isIrreversible() -> Bool {
        return (multiplier == 0.0) || (secondItem == nil) || (secondAttribute == .NotAnAttribute)
    }

    //  In order to work with positive constants, you may need to reverse a constraint
    //  In case you want to make sure you've always got a positive constant without checking
    //  yourself, this won't reverse your constraint if the constant is already positive
    public func makeConstantPositive() -> Constraint? {
        return constant < 0 ? reversed() : self
    }

}
