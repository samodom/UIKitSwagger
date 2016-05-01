//
//  ConstraintReversal.swift
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
     This method reverses a constraint from the form **`y R mx + b`**, where **`R`** is a layout relation, to the form **`x R' (y - b) / m`**, where **`R'`** is the appropriate relation for the reversal and **`m != 0`**.
     - Returns: The same constraint as this constraint in reverse form (if available).
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

    /**
     Puts a constraint in a non-negative constant form, if possible, or returns itself if it is already in non-negative constant.
     - Returns: This constraint or the reverse of the constraint.
     */
    public func makeConstantPositive() -> NSLayoutConstraint {
        guard constant < 0 else { return self }
        return reversed() ?? self
    }
    
}
