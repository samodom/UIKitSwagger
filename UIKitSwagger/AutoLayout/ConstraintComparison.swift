//
//  ConstraintComparison.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 6/21/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import UIKit

extension NSLayoutConstraint  {

    public func isEqualToLayoutConstraint(_ constraint: NSLayoutConstraint) -> Bool {
        guard self !== constraint else { return true }

        if componentsMatch(constraint) {
            return true
        }

        if let swapped = constraint.swappedSubjectConstraint {
            return componentsMatch(swapped)
        }
        
        return false
    }

    /**
     Constraints should be equatable beyond reference comparison and we match them in a property-by-property manner.
     - parameter object: Another constraint to compare to this constraint.
     */
    override open func isEqual(_ object: Any?) -> Bool {
        guard let constraint = object as? NSLayoutConstraint else {
            return false
        }

        return isEqualToLayoutConstraint(constraint)
    }

    fileprivate func componentsMatch(_ constraint: NSLayoutConstraint) -> Bool {
        guard firstItem === constraint.firstItem else {
            return false
        }
        guard firstAttribute == constraint.firstAttribute else {
            return false
        }
        guard secondItem === constraint.secondItem else {
            return false
        }
        guard secondAttribute == constraint.secondAttribute else {
            return false
        }
        guard relation == constraint.relation else {
            return false
        }

        func valueWithinTolerance(_ value1: CGFloat, _ value2: CGFloat) -> Bool {
            return Double(abs(value1 - value2)) < 1e-5
        }

        guard valueWithinTolerance(multiplier, constraint.multiplier) else {
            return false
        }
        guard valueWithinTolerance(constant, constraint.constant) else {
            return false
        }

        return true
    }

}


/**
 Global-level definition of the constraint identity operator.
 */
infix operator ==*

public func ==* (lhs: NSLayoutConstraint, rhs: NSLayoutConstraint) -> Bool {
    guard lhs == rhs else {
        return false
    }

    return lhs.priority == rhs.priority && lhs.identifier == rhs.identifier
}
