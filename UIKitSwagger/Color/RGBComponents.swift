//
//  RGBComponents.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
 Convenience structure to hold the red, green, blue and alpha component values of an instance of `UIColor`.
 */
public struct RGBComponents: ColorComponents {

    public let red: CGFloat
    public let green: CGFloat
    public let blue: CGFloat
    public let alpha: CGFloat

    public init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }

    /**
     Required method for creating colors based on this component scheme.
     */
    public func color() -> UIColor {
        return UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: alpha
        )
    }
}

/**
 Equatability of RGB components.
 */
extension RGBComponents: Equatable {}

public func ==(lhs: RGBComponents, rhs: RGBComponents) -> Bool {
    return componentValuesEqualWithinTolerance(lhs.red, rhs.red) &&
        componentValuesEqualWithinTolerance(lhs.green, rhs.green) &&
        componentValuesEqualWithinTolerance(lhs.blue, rhs.blue) &&
        componentValuesEqualWithinTolerance(lhs.alpha, rhs.alpha)
}

public extension UIColor {

    /**
     Property that returns the RGB components of the color in a structure.
     */
    public var rgbComponents: RGBComponents {

        var redValue = CGFloat(0)
        var greenValue = CGFloat(0)
        var blueValue = CGFloat(0)
        var alphaValue = CGFloat(0)


        getRed(&redValue, green: &greenValue, blue: &blueValue, alpha: &alphaValue)

        return RGBComponents(
            red: redValue,
            green: greenValue,
            blue: blueValue,
            alpha: alphaValue
        )
    }

}

public extension UIColor {

    /**
     Property representing the red component value of the color.
     */
    public var red: CGFloat {
        return rgbComponents.red
    }

    /**
     Property representing the green component value of the color.
     */
    public var green: CGFloat {
        return rgbComponents.green
    }

    /**
     Property representing the blue component value of the color.
     */
    public var blue: CGFloat {
        return rgbComponents.blue
    }

    /**
     Property representing the alpha component value of the color.
     */
    public var alpha: CGFloat {
        return rgbComponents.alpha
    }

}

/**
 Component conversion methods.
 */
public extension RGBComponents {

    /**
     Converts RGB components into HSB components.
     */
    public func asHSBComponents() -> HSBComponents {
        return color().hsbComponents
    }

    /**
     Converts RGB components into grayscale components.
     */
    public func asGrayscaleComponents() -> GrayscaleComponents {
        return color().grayscaleComponents
    }

    /**
     Converts RGB components into CMYK components.
     */
    public func asCMYKComponents() -> CMYKComponents {
        return color().cmykComponents
    }
    
}
