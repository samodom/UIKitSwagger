//
//  UIColorGrayscaleComponents.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
  Convenience structure to hold the white and alpha component values of an instance of `UIColor`.
*/
public struct UIColorGrayscaleComponents {
    public let white: CGFloat
    public let alpha: CGFloat
}

/**
  Equatability of grayscale components.
*/
extension UIColorGrayscaleComponents: Equatable {

}

public func ==(lhs: UIColorGrayscaleComponents, rhs: UIColorGrayscaleComponents) -> Bool {
    return lhs.white == rhs.white && lhs.alpha == rhs.alpha
}

/**
  Property that returns the grayscale components of the color in a structure.
*/
public extension UIColor {
    public var grayscaleComponents: UIColorGrayscaleComponents {
        var whiteValue = CGFloat(0)
        var alphaValue = CGFloat(0)

        getWhite(&whiteValue, alpha: &alphaValue)
        return UIColorGrayscaleComponents(white: whiteValue, alpha: alphaValue)
    }
}