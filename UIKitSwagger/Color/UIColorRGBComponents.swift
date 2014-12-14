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
public struct UIColorRGBComponents {
    public let red: CGFloat
    public let green: CGFloat
    public let blue: CGFloat
    public let alpha: CGFloat
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

/**
  Property that returns the RGB components of the color in a structure.
*/
public extension UIColor {
    public var rgbComponents: UIColorRGBComponents {
        var redValue = CGFloat(0)
        var greenValue = CGFloat(0)
        var blueValue = CGFloat(0)
        var alphaValue = CGFloat(0)

        getRed(&redValue, green: &greenValue, blue: &blueValue, alpha: &alphaValue)
        return UIColorRGBComponents(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
    }
}
