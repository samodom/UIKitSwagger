//
//  GrayscaleComponents.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/// Convenience structure to hold the white and alpha component values of an instance of `UIColor`.
public struct GrayscaleComponents {
    public let white: CGFloat
    public let alpha: CGFloat

    public init(white w: CGFloat, alpha a: CGFloat = 1) {
        white = w
        alpha = a
    }

}

extension GrayscaleComponents: ColorComponents {

    /// Required method for creating colors based on this component scheme.
    public var uiColor: UIColor {
        return UIColor(white: white, alpha: alpha)
    }
}

/// Equatability of grayscale components.
extension GrayscaleComponents: Equatable {}

public func ==(lhs: GrayscaleComponents, rhs: GrayscaleComponents) -> Bool {
    return componentValuesEqualWithinTolerance(lhs.white, rhs.white) &&
        componentValuesEqualWithinTolerance(lhs.alpha, rhs.alpha)
}

public extension UIColor {

    /// Property that returns the grayscale components of the color in a structure.
    public var grayscaleComponents: GrayscaleComponents {
        var whiteValue: CGFloat = 0
        var alphaValue: CGFloat = 0

        getWhite(&whiteValue, alpha: &alphaValue)
        return GrayscaleComponents(white: whiteValue, alpha: alphaValue)
    }


}

public extension UIColor {

    /// Property to provide the white component value of the color.
    public var white: CGFloat {
        return grayscaleComponents.white
    }

}


//  MARK: Component conversion variables.

extension GrayscaleComponents: GrayscaleConvertible {

    /// Reflects the same grayscale components.
    public var grayscaleComponents: GrayscaleComponents {
        return self
    }

}

extension GrayscaleComponents: RGBConvertible {

    /// Converts grayscale components into RGB components.
    public var rgbComponents: RGBComponents {
        return uiColor.rgbComponents
    }

}

extension GrayscaleComponents: HSBConvertible {

    /// Converts grayscale components into HSB components.
    public var hsbComponents: HSBComponents {
        return uiColor.hsbComponents
    }

}

extension GrayscaleComponents: CMYKConvertible {

    /// Converts grayscale components into CMYK components.
    public var cmykComponents: CMYKComponents {
        return uiColor.cmykComponents
    }
    
}
