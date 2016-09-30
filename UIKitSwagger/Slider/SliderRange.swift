//
//  SliderRange.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/12/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension UISlider {

    /**
     Property representing the closed range `minimumValue ... maximumValue`.
     */
    public var range: ClosedRange<Float> {
        get {
            return minimumValue ... maximumValue
        }
        set {
            if newValue.lowerBound != minimumValue {
                minimumValue = newValue.lowerBound
            }
            if newValue.upperBound != maximumValue {
                maximumValue = newValue.upperBound
            }
        }
    }
    
}
