//
//  CMYKComponents.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 2/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/// Convenience structure to hold the cyan, magenta, yellow and alpha component values of an instance of `UIColor`.
public struct CMYKComponents {
    public let cyan: CGFloat
    public let magenta: CGFloat
    public let yellow: CGFloat
    public let key: CGFloat
    public let alpha: CGFloat

    public init(cyan c: CGFloat, magenta m: CGFloat, yellow y: CGFloat, key k: CGFloat, alpha a: CGFloat! = 1) {
        cyan = c
        magenta = m
        yellow = y
        key = k
        alpha = a
    }

}

extension CMYKComponents: ColorComponents {

    /// Required variable for providing colors based on this component scheme.
    public var uiColor: UIColor {
        return UIColor(
            cyan: cyan,
            magenta: magenta,
            yellow: yellow,
            key: key,
            alpha: alpha
        )
    }

}

/// Equatability of CMYK components.
extension CMYKComponents: Equatable {}

public func ==(lhs: CMYKComponents, rhs: CMYKComponents) -> Bool {
    return componentValuesEqualWithinTolerance(lhs.cyan, rhs.cyan) &&
        componentValuesEqualWithinTolerance(lhs.magenta, rhs.magenta) &&
        componentValuesEqualWithinTolerance(lhs.yellow, rhs.yellow) &&
        componentValuesEqualWithinTolerance(lhs.key, rhs.key) &&
        componentValuesEqualWithinTolerance(lhs.alpha, rhs.alpha)
}

public extension UIColor {

    /// Property to provide the cyan component value of the color.
    public var cyanValue: CGFloat {
        return cmykComponents.cyan
    }

    /// Property to provide the magenta component value of the color.
    public var magentaValue: CGFloat {
        return cmykComponents.magenta
    }

    /// Property to provide the yellow component value of the color.
    public var yellowValue: CGFloat {
        return cmykComponents.yellow
    }

    /// Property to provide the key component value of the color.
    public var keyValue: CGFloat {
        return cmykComponents.key
    }


    /// Convenience intitializer to match the system-provided component-wise intializers for other component types.
    /// - parameter cyan: The cyan value to use when initializing the color.
    /// - parameter magenta: The magneta value to use when initializing the color.
    /// - parameter yellow: The yellow value to use when initializing the color.
    /// - parameter key: The key value to use when initializing the color.
    /// - parameter alpha: The alpha value to use when initializing the color.
    public convenience init(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, key: CGFloat, alpha: CGFloat) {
        let cmykValues =
        CMYKComponents(
            cyan: cyan,
            magenta: magenta,
            yellow: yellow,
            key: key,
            alpha: alpha
        )
        let rgbValues = cmykValues.rgbComponents

        self.init(red: rgbValues.red, green: rgbValues.green, blue: rgbValues.blue, alpha: alpha)
    }


    /// This method matches the system-provided messages for retrieving the various component values.
    /// - parameter cyan: The destination for the cyan value of this color.
    /// - parameter magenta: The destination for the magenta value of this color.
    /// - parameter yellow: The destination for the yellow value of this color.
    /// - parameter key: The destination for the key value of this color.
    /// - parameter alpha: The destination for the alpha value of this color.
    /// - note: This conversion may be lossy.
    public func getCyan(_ cyan: inout CGFloat, magenta: inout CGFloat, yellow: inout CGFloat, key: inout CGFloat, alpha: inout CGFloat) -> Bool {
        let components = cmykComponents
        cyan = components.cyan
        magenta = components.magenta
        yellow = components.yellow
        key = components.key
        alpha = components.alpha
        return true
    }


    /// Property that returns the CMYK components of the color in a structure.
    /// - note: This conversion may be lossy.
    public var cmykComponents: CMYKComponents {
        let components = rgbComponents
        let maximumRGBComponentValue = max(components.red, components.green, components.blue)
        if maximumRGBComponentValue > 0 {
            return CMYKComponents(
                cyan: 1 - (components.red / maximumRGBComponentValue),
                magenta: 1 - (components.green / maximumRGBComponentValue),
                yellow: 1 - (components.blue / maximumRGBComponentValue),
                key: 1 - maximumRGBComponentValue,
                alpha: rgbComponents.alpha
            )
        }
        else {
            return CMYKComponents(cyan: 0, magenta: 0, yellow: 0, key: 1, alpha: components.alpha)
        }
    }

}


//  MARK: Component conversion variables.

extension CMYKComponents: CMYKConvertible {

    /// Reflects the same CMYK components.
    public var cmykComponents: CMYKComponents {
        return self
    }

}

extension CMYKComponents: RGBConvertible {

    /// Converts CMYK components into RGB components.
    public var rgbComponents: RGBComponents {
        let keyComplement = 1 - key
        let redValue = (1 - cyan) * keyComplement
        let greenValue = (1 - magenta) * keyComplement
        let blueValue = (1 - yellow)  * keyComplement

        return RGBComponents(red: redValue, green: greenValue, blue: blueValue, alpha: alpha)
    }

}

extension CMYKComponents: HSBConvertible {

    /// Converts CMYK components into HSB components.
    public var hsbComponents: HSBComponents {
        return uiColor.hsbComponents
    }

}

extension CMYKComponents: GrayscaleConvertible {

    /// Converts CMYK components into grayscale components.
    public var grayscaleComponents: GrayscaleComponents {
        return uiColor.grayscaleComponents
    }
    
}
