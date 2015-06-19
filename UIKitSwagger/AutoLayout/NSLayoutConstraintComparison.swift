//
//  NSLayoutConstraintComparison.swift
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


extension Constraint  {

    /**
      Constraints should be equatable beyond reference comparison and we match them in a property-by-property manner.
    */
    override public func isEqual(object: AnyObject?) -> Bool {
        guard self !== object else { return true }
        guard object is Constraint else { return false }

        let otherConstraint = object as! Constraint
        guard priority == otherConstraint.priority else { return false }

        if componentsMatch(otherConstraint) {
            return true
        }

        if let reverse = otherConstraint.reversed() {
            return componentsMatch(reverse)
        }
        
        return false
    }

    private func componentsMatch(otherConstraint: Constraint) -> Bool {
        guard firstItem === otherConstraint.firstItem else { return false }
        guard firstAttribute == otherConstraint.firstAttribute else { return false }
        guard secondItem === otherConstraint.secondItem else { return false }
        guard secondAttribute == otherConstraint.secondAttribute else { return false }
        guard relation == otherConstraint.relation else { return false }

        func valueWithinTolerance(value1: CGFloat, _ value2: CGFloat) -> Bool {
            return Double(abs(value1 - value2)) < 1e-5
        }

        guard valueWithinTolerance(multiplier, otherConstraint.multiplier) else { return false }
        guard valueWithinTolerance(constant, otherConstraint.constant) else { return false }

        return true
    }
    
}


/**
  Global-level definition of the constraint identity operator
*/
infix operator ==* { }

public func ==* (lhs: Constraint, rhs: Constraint) -> Bool {
    return
        lhs == rhs &&
        lhs.identifier == rhs.identifier
}
