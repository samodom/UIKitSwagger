//
//  HSBComponents.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/// Convenience structure to hold the hue, saturation, brightness and alpha component values of an instance of `UIColor`.
public struct HSBComponents {
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

}

extension HSBComponents: ColorComponents {

    /// Required variable for creating colors based on this component scheme.
    public var uiColor: UIColor {
        return UIColor(
            hue: hue,
            saturation: saturation,
            brightness: brightness,
            alpha: alpha
        )
    }

}

public extension UIColor {

    /// Property to provide the hue component value of the color.
    public var hue: CGFloat {
        return hsbComponents.hue
    }

    /// Property to provide the saturation component value of the color.
    public var saturation: CGFloat {
        return hsbComponents.saturation
    }

    /// Property to provide the brightness component value of the color.
    public var brightness: CGFloat {
        return hsbComponents.brightness
    }

}


/// Equatability of HSB components.
extension HSBComponents: Equatable {}

public func ==(lhs: HSBComponents, rhs: HSBComponents) -> Bool {
    return componentValuesEqualWithinTolerance(lhs.hue, rhs.hue) &&
        componentValuesEqualWithinTolerance(lhs.saturation, rhs.saturation) &&
        componentValuesEqualWithinTolerance(lhs.brightness, rhs.brightness) &&
        componentValuesEqualWithinTolerance(lhs.alpha, rhs.alpha)
}

public extension UIColor {

    /// Property that returns the HSB components of the color in a structure.
    public var hsbComponents: HSBComponents {
        var hueValue: CGFloat = 0
        var saturationValue: CGFloat = 0
        var brightnessValue: CGFloat = 0
        var alphaValue: CGFloat = 0

        getHue(&hueValue,
               saturation: &saturationValue,
               brightness: &brightnessValue,
               alpha: &alphaValue
        )

        return HSBComponents(
            hue: hueValue,
            saturation: saturationValue,
            brightness: brightnessValue,
            alpha: alphaValue
        )
    }

}


/// Component conversion variables.

extension HSBComponents: HSBConvertible {

    /// Reflects the same HSB components.
    public var hsbComponents: HSBComponents {
        return self
    }

}

extension HSBComponents: RGBConvertible {

    /// Converts HSB components into RGB components.
    public var rgbComponents: RGBComponents {
        return uiColor.rgbComponents
    }

}

extension HSBComponents: GrayscaleConvertible {

    /// Converts HSB components into grayscale components.
    public var grayscaleComponents: GrayscaleComponents {
        return uiColor.grayscaleComponents
    }

}

extension HSBComponents: CMYKConvertible {

    /// Converts HSB components into CNYK components.
    public var cmykComponents: CMYKComponents {
        return uiColor.cmykComponents
    }
    
}
