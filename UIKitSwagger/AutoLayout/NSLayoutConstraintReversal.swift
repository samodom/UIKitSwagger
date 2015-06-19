//
//  NSLayoutConstraintReversal.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 6/19/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import UIKit

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
        guard canBeReversed() else { return nil }

        let newRelation = multiplier < 0 ? relation : relation.reversed()
        let newMultiplier = 1 / multiplier
        let newConstant = -constant / multiplier

        let newConstraint = Constraint(
            item: secondItem!,
            attribute: secondAttribute,
            relatedBy: newRelation,
            toItem: firstItem,
            attribute: firstAttribute,
            multiplier: newMultiplier,
            constant: newConstant
        )
        newConstraint.identifier = identifier
        newConstraint.priority = priority

        return newConstraint
    }

    private func canBeReversed() -> Bool {
        guard multiplier != 0.0 else { return false }
        guard secondItem != nil else { return false }
        guard secondAttribute != .NotAnAttribute else { return false }

        return true
    }

    /**
      In order to work with positive constants, you may need to reverse a constraint.  In case you want to make sure you've always got a positive constant without checking yourself, this won't reverse your constraint if the constant is already non-negative.
    */
    public func makeConstantPositive() -> Constraint? {
        return constant < 0 ? reversed() : self
    }
    
}
