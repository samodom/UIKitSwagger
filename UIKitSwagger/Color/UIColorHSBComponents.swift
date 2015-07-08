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

    public init(hue h: CGFloat, saturation s: CGFloat, brightness b: CGFloat, alpha a: CGFloat! = 1) {
        hue = h
        saturation = s
        brightness = b
        alpha = a
    }

    /**
    Required method for creating colors based on this component scheme.
    */
    public func color() -> UIColor {
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
}

/**
Equatability of HSB components.
*/
extension UIColorHSBComponents: Equatable {

}

public func ==(lhs: UIColorHSBComponents, rhs: UIColorHSBComponents) -> Bool {
    return componentValuesEqualWithinTolerance(lhs.hue, rhs.hue) &&
        componentValuesEqualWithinTolerance(lhs.saturation, rhs.saturation) &&
        componentValuesEqualWithinTolerance(lhs.brightness, rhs.brightness) &&
        componentValuesEqualWithinTolerance(lhs.alpha, rhs.alpha)
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

/**
Component conversion methods.
*/
public extension UIColorHSBComponents {

    /**
    Converts HSB components into RGB components.
    */
    public func asRGBComponents() -> UIColorRGBComponents {
        return color().rgbComponents
    }

    /**
    Converts HSB components into grayscale components.
    */
    public func asGrayscaleComponents() -> UIColorGrayscaleComponents {
        return color().grayscaleComponents
    }

    /**
    Converts HSB components into CNYK components.
    */
    public func asCMYKComponents() -> UIColorCMYKComponents {
        return color().cmykComponents
    }
    
}
