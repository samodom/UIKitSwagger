//
//  GrayscaleComponents.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
Convenience structure to hold the white and alpha component values of an instance of `UIColor`.
*/
public struct GrayscaleComponents: ColorComponents {
    public let white: CGFloat
    public let alpha: CGFloat

    public init(white w: CGFloat, alpha a: CGFloat! = 1) {
        white = w
        alpha = a
    }

    /**
    Required method for creating colors based on this component scheme.
    */
    public func color() -> UIColor {
        return UIColor(white: white, alpha: alpha)
    }
}

/**
Equatability of grayscale components.
*/
extension GrayscaleComponents: Equatable {

}

public func ==(lhs: GrayscaleComponents, rhs: GrayscaleComponents) -> Bool {
    return componentValuesEqualWithinTolerance(lhs.white, rhs.white) &&
        componentValuesEqualWithinTolerance(lhs.alpha, rhs.alpha)
}

public extension UIColor {

    /**
    Property that returns the grayscale components of the color in a structure.
    */
    public var grayscaleComponents: GrayscaleComponents {
        var whiteValue = CGFloat(0)
        var alphaValue = CGFloat(0)

        getWhite(&whiteValue, alpha: &alphaValue)
        return GrayscaleComponents(white: whiteValue, alpha: alphaValue)
    }


}

public extension UIColor {

    /**
    Property to provide the white component value of the color.
    */
    public var white: CGFloat {
        return grayscaleComponents.white
    }
    
}

/**
Component conversion methods.
*/
public extension GrayscaleComponents {

    /**
    Converts grayscale components into RGB components.
    */
    public func asRGBComponents() -> RGBComponents {
        return color().rgbComponents
    }

    /**
    Converts grayscale components into HSB components.
    */
    public func asHSBComponents() -> HSBComponents {
        return color().hsbComponents
    }

    /**
    Converts grayscale components into CMYK components.
    */
    public func asCMYKComponents() -> CMYKComponents {
        return color().cmykComponents
    }
    
}
