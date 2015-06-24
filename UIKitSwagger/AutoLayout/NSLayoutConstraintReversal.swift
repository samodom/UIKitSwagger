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

public extension NSLayoutConstraint {

    /**
      This method reverses a constraint from the form y R mx + b, where R is a layout relation, to the form x = (y - b) / m, where m != 0
    */
    public func reversed() -> NSLayoutConstraint? {
        guard canBeReversed() else { return nil }

        let newConstraint = NSLayoutConstraint(
            item: secondItem!,
            attribute: secondAttribute,
            relatedBy: multiplier < 0 ? relation : relation.reversed(),
            toItem: firstItem,
            attribute: firstAttribute,
            multiplier: 1 / multiplier,
            constant: -constant / multiplier
        )
        newConstraint.priority = priority

        return newConstraint
    }

    private func canBeReversed() -> Bool {
        return multiplier != 0.0 && secondItem != nil && secondAttribute != .NotAnAttribute
    }

    /**
      In order to work with positive constants, you may need to reverse a constraint.  In case you want to make sure you've always got a positive constant without checking yourself, this won't reverse your constraint if the constant is already non-negative.
    */
    public func makeConstantPositive() -> NSLayoutConstraint {
        guard constant < 0 else { return self }
        return reversed() ?? self
    }
    
}
