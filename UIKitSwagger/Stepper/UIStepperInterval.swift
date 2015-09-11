//
//  UIStepperInterval.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension UIStepper {

    /**
    Property representing the closed interval `minimumValue ... maximumValue`.
    */
    public var interval: ClosedInterval<Double> {
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
