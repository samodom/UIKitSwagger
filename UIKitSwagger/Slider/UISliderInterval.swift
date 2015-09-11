//
//  UISliderInterval.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/12/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension UISlider {

    /**
    Property representing the closed interval `minimumValue ... maximumValue`.
    */
    public var interval: ClosedInterval<Float> {
        get {
            return minimumValue ... maximumValue
        }
        set {
            if newValue.start != minimumValue {
                minimumValue = newValue.start
            }
            if newValue.end != maximumValue {
                maximumValue = newValue.end
            }
        }
    }

}
