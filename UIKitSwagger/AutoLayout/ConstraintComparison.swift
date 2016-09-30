//
//  ConstraintComparison.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 6/21/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import UIKit

extension NSLayoutConstraint  {

    public func isEqualToLayoutConstraint(constraint: NSLayoutConstraint) -> Bool {
        return isEqual(constraint)
    }

    /**
     Constraints should be equatable beyond reference comparison and we match them in a property-by-property manner.
     - parameter object: Another constraint to compare to this constraint.
     */
    override open func isEqual(_ object: Any?) -> Bool {
        guard let constraint = object as? NSLayoutConstraint else { return false }
        guard self !== constraint else { return true }

        let otherConstraint = object as! NSLayoutConstraint
        guard priority == otherConstraint.priority else { return false }

        if componentsMatch(otherConstraint) {
            return true
        }

        if let reverse = otherConstraint.reversed {
            return componentsMatch(reverse)
        }

        return false
    }

    fileprivate func componentsMatch(_ otherConstraint: NSLayoutConstraint) -> Bool {
        guard firstItem === otherConstraint.firstItem else { return false }
        guard firstAttribute == otherConstraint.firstAttribute else { return false }
        guard secondItem === otherConstraint.secondItem else { return false }
        guard secondAttribute == otherConstraint.secondAttribute else { return false }
        guard relation == otherConstraint.relation else { return false }

        func valueWithinTolerance(_ value1: CGFloat, _ value2: CGFloat) -> Bool {
            return Double(abs(value1 - value2)) < 1e-5
        }

        guard valueWithinTolerance(multiplier, otherConstraint.multiplier) else { return false }
        guard valueWithinTolerance(constant, otherConstraint.constant) else { return false }

        return true
    }

}


/**
 Global-level definition of the constraint identity operator.
 */
infix operator ==*

public func ==* (lhs: NSLayoutConstraint, rhs: NSLayoutConstraint) -> Bool {
    return lhs == rhs && lhs.identifier == rhs.identifier
}
