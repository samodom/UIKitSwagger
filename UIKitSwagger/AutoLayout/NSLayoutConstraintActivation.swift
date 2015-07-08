//
//  NSLayoutConstraintActivation.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/7/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension NSLayoutConstraint {

    /**
    Convenience method to activate an auto layout constraint.
    */
    public func activate() {
        active = true
    }

    /**
    Convenience method to deactivate an auto layout constraint.
    */
    public func deactivate() {
        active = false
    }
}
