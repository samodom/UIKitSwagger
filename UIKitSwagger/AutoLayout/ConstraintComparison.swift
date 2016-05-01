//
//  ConstraintComparison.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 6/21/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import UIKit

extension NSLayoutConstraint  {

    /**
     Constraints should be equatable beyond reference comparison and we match them in a property-by-property manner.
     - Parameter object: Another constraint to compare to this constraint.
     */
    override public func isEqual(object: AnyObject?) -> Bool {
        guard object is NSLayoutConstraint else { return false }
        guard self !== object else { return true }

        let otherConstraint = object as! NSLayoutConstraint
        guard priority == otherConstraint.priority else { return false }

        if componentsMatch(otherConstraint) {
            return true
        }

        if let reverse = otherConstraint.reversed() {
            return componentsMatch(reverse)
        }

        return false
    }

}


/**
 Global-level definition of the constraint identity operator.
 */
infix operator ==* { }

public func ==* (lhs: NSLayoutConstraint, rhs: NSLayoutConstraint) -> Bool {
    return lhs == rhs &&
        lhs.identifier == rhs.identifier
}
