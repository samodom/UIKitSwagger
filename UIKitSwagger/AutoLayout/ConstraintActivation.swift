//
//  ConstraintActivation.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit


public extension NSLayoutConstraint {

    /// Convenience method to activate an auto layout constraint.
    public func activate() {
        isActive = true
    }

    /// Convenience method to deactivate an auto layout constraint.
    public func deactivate() {
        isActive = false
    }

}


public extension Sequence where Iterator.Element: NSLayoutConstraint {

    /// Convenience method to activate each auto layout constraint in a sequence.
    public func activate() {
        forEach { $0.activate() }
    }

    /// Convenience method to deactivate each auto layout constraint in a sequence.
    public func deactivate() {
        forEach { $0.deactivate() }
    }

}
