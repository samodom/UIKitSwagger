//
//  UIColorRGBComponents.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
Convenience structure to hold the red, green, blue and alpha component values of an instance of `UIColor`.
*/
public struct UIColorRGBComponents: UIColorComponents {
    public let red: CGFloat
    public let green: CGFloat
    public let blue: CGFloat
    public let alpha: CGFloat

    public init(red r: CGFloat, green g: CGFloat, blue b: CGFloat, alpha a: CGFloat! = 1) {
        red = r
        green = g
        blue = b
        alpha = a
    }

    /**
    Required method for creating colors based on this component scheme.
    */
    public func color() -> UIColor {
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

/**
Equatability of RGB components.
*/
extension UIColorRGBComponents: Equatable {

}

public func ==(lhs: UIColorRGBComponents, rhs: UIColorRGBComponents) -> Bool {
    return componentValuesEqualWithinTolerance(lhs.red, rhs.red) &&
        componentValuesEqualWithinTolerance(lhs.green, rhs.green) &&
        componentValuesEqualWithinTolerance(lhs.blue, rhs.blue) &&
        componentValuesEqualWithinTolerance(lhs.alpha, rhs.alpha)
}

public extension UIColor {

    /**
    Property that returns the RGB components of the color in a structure.
    */
    public var rgbComponents: UIColorRGBComponents {
        var redValue = CGFloat(0)
        var greenValue = CGFloat(0)
        var blueValue = CGFloat(0)
        var alphaValue = CGFloat(0)

        getRed(&redValue, green: &greenValue, blue: &blueValue, alpha: &alphaValue)
        return UIColorRGBComponents(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
    }

}

/**
Component conversion methods.
*/
public extension UIColorRGBComponents {

    /**
    Converts RGB components into HSB components.
    */
    public func asHSBComponents() -> UIColorHSBComponents {
        return color().hsbComponents
    }

    /**
    Converts RGB components into grayscale components.
    */
    public func asGrayscaleComponents() -> UIColorGrayscaleComponents {
        return color().grayscaleComponents
    }

    /**
    Converts RGB components into CMYK components.
    */
    public func asCMYKComponents() -> UIColorCMYKComponents {
        return color().cmykComponents
    }
    
}

/**
Reflection
*/
extension UIColorRGBComponents: Reflectable {
    public func getMirror() -> Any {
        return
    }
}
