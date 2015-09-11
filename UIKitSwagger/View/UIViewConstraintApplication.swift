//
//  UIViewConstraintApplication.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/16/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension UIView {

    /**
    Convenience method for clearing all of the view's constraints.
    */
    public func clearConstraints() {
        DeactivateConstraints(constraints)
    }

}
