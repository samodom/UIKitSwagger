//
//  RGBComponents.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/// Convenience structure to hold the red, green, blue and alpha component values of an instance of `UIColor`.
public struct RGBComponents {
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

}

extension RGBComponents: ColorComponents {

    /// Required variable for creating colors based on this component scheme.
    public var uiColor: UIColor {
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

}

/// Equatability of RGB components.
extension RGBComponents: Equatable {}

public func ==(lhs: RGBComponents, rhs: RGBComponents) -> Bool {
    return componentValuesEqualWithinTolerance(lhs.red, rhs.red) &&
        componentValuesEqualWithinTolerance(lhs.green, rhs.green) &&
        componentValuesEqualWithinTolerance(lhs.blue, rhs.blue) &&
        componentValuesEqualWithinTolerance(lhs.alpha, rhs.alpha)
}

public extension UIColor {

    /// Property that returns the RGB components of the color in a structure.
    public var rgbComponents: RGBComponents {
        var redValue: CGFloat = 0
        var greenValue: CGFloat = 0
        var blueValue: CGFloat = 0
        var alphaValue: CGFloat = 0

        getRed(&redValue,
               green: &greenValue,
               blue: &blueValue,
               alpha: &alphaValue
        )

        return RGBComponents(
            red: redValue,
            green: greenValue,
            blue: blueValue,
            alpha: alphaValue
        )
    }

}

public extension UIColor {

    /// Property to provide the red component value of the color.
    public var redValue: CGFloat {
        return rgbComponents.red
    }

    /// Property to provide the green component value of the color.
    public var greenValue: CGFloat {
        return rgbComponents.green
    }

    /// Property to provide the blue component value of the color.
    public var blueValue: CGFloat {
        return rgbComponents.blue
    }

    /// Property to provide the alpha component value of the color.
    public var alpha: CGFloat {
        return rgbComponents.alpha
    }

}


/// Component conversion variables.

extension RGBComponents: RGBConvertible {

    /// Reflects the same RGB components.
    public var rgbComponents: RGBComponents {
        return self
    }

}

extension RGBComponents: HSBConvertible {

    /// Converts RGB components into HSB components.
    public var hsbComponents: HSBComponents {
        return uiColor.hsbComponents
    }

}

extension RGBComponents: GrayscaleConvertible {

    /// Converts RGB components into grayscale components.
    public var grayscaleComponents: GrayscaleComponents {
        return uiColor.grayscaleComponents
    }

}

extension RGBComponents: CMYKConvertible {

    /// Converts RGB components into CMYK components.
    public var cmykComponents: CMYKComponents {
        return uiColor.cmykComponents
    }
    
}
