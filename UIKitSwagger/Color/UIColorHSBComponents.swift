//
//  UIColorHSBComponents.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
  Convenience structure to hold the hue, saturation, brightness and alpha component values of an instance of `UIColor`.
*/
public struct UIColorHSBComponents: UIColorComponents {
    public let hue: CGFloat
    public let saturation: CGFloat
    public let brightness: CGFloat
    public let alpha: CGFloat

    /**
      Required method for creating colors based on this component scheme.
    */
    public func color() -> UIColor {
        return UIColor(components: self)
    }
}

/**
  Equatability of HSB components.
*/
extension UIColorHSBComponents: Equatable {

}

public func ==(lhs: UIColorHSBComponents, rhs: UIColorHSBComponents) -> Bool {
    return lhs.hue == rhs.hue &&
        lhs.saturation == rhs.saturation &&
        lhs.brightness == rhs.brightness &&
        lhs.alpha == rhs.alpha
}

public extension UIColor {

    /**
      Property that returns the HSB components of the color in a structure.
    */
    public var hsbComponents: UIColorHSBComponents {
        var hueValue = CGFloat(0)
        var saturationValue = CGFloat(0)
        var brightnessValue = CGFloat(0)
        var alphaValue = CGFloat(0)

        getHue(&hueValue, saturation: &saturationValue, brightness: &brightnessValue, alpha: &alphaValue)
        return UIColorHSBComponents(hue: hueValue, saturation: saturationValue, brightness: brightnessValue, alpha: alphaValue)
    }

}
