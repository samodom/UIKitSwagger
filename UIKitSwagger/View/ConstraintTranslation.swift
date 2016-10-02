//
//  ConstraintTranslation.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 9/30/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import Foundation

public extension UIView {

    /**
     Convenience property that always represents the boolean negation of the `setTranslatesAutoresizingMaskIntoConstraints` property.
     */
    public var usesAutoLayout: Bool {
        get {
            return !translatesAutoresizingMaskIntoConstraints
        }
        set {
            translatesAutoresizingMaskIntoConstraints = !newValue
        }
    }

}


public extension Sequence where Iterator.Element: UIView {

    /**
     Convenience method to turn on auto layout usage for each view in a sequence.
     */
    public func useAutoLayout() {
        forEach { $0.usesAutoLayout = true }
    }

}
