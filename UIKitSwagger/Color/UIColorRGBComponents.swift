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

    public init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat! = 1) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }

    /**
      Required method for creating colors based on this component scheme.
    */
    public func color() -> UIColor {
        return UIColor(components: self)
    }
}

/**
  Equatability of RGB components.
*/
extension UIColorRGBComponents: Equatable {

}

public func ==(lhs: UIColorRGBComponents, rhs: UIColorRGBComponents) -> Bool {
    return lhs.red == rhs.red &&
        lhs.green == rhs.green &&
        lhs.blue == rhs.blue &&
        lhs.alpha == rhs.alpha
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

}
