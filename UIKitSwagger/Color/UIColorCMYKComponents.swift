//
//  UIColorCMYKComponents.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 2/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
  Convenience structure to hold the cyan, magenta, yellow and alpha component values of an instance of `UIColor`.
*/
public struct UIColorCMYKComponents: UIColorComponents {
    public let cyan: CGFloat
    public let magenta: CGFloat
    public let yellow: CGFloat
    public let key: CGFloat
    public let alpha: CGFloat

    public init(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, key: CGFloat, alpha: CGFloat! = 1) {
        self.cyan = cyan
        self.magenta = magenta
        self.yellow = yellow
        self.key = key
        self.alpha = alpha
    }

    /**
      Required method for creating colors based on this component scheme.
    */
    public func color() -> UIColor {
        let keyComplement = 1 - key
        let redValue = (1 - cyan) * keyComplement
        let greenValue = (1 - magenta) * keyComplement
        let blueValue = (1 - yellow)  * keyComplement
        return UIColor(
            red: redValue,
            green: greenValue,
            blue: blueValue,
            alpha: alpha
        )
    }

}

/**
  Equatability of CMYK components.
*/
extension UIColorCMYKComponents: Equatable {

}

public func ==(lhs: UIColorCMYKComponents, rhs: UIColorCMYKComponents) -> Bool {
    return componentValuesEqualWithinTolerance(lhs.cyan, rhs.cyan) &&
        componentValuesEqualWithinTolerance(lhs.magenta, rhs.magenta) &&
        componentValuesEqualWithinTolerance(lhs.yellow, rhs.yellow) &&
        componentValuesEqualWithinTolerance(lhs.key, rhs.key) &&
        componentValuesEqualWithinTolerance(lhs.alpha, rhs.alpha)
}

public extension UIColor {

    /**
      Property to provide the cyan component value of the color.
    */
    public var cyan: CGFloat {
        return cmykComponents.cyan
    }

    /**
      Property to provide the magenta component value of the color.
    */
    public var magenta: CGFloat {
        return cmykComponents.magenta
    }

    /**
      Property to provide the yellow component value of the color.
    */
    public var yellow: CGFloat {
        return cmykComponents.yellow
    }

    /**
      Property to provide the key component value of the color.
    */
    public var key: CGFloat {
        return cmykComponents.key
    }


    /**
      Convenience intitializer to match the system-provided component-wise intializers for other component types.
      @param            cyan The cyan value to use when initializing the color.
      @param            magenta The magneta value to use when initializing the color.
      @param            yellow The yellow value to use when initializing the color.
      @param            key The key value to use when initializing the color.
      @param            alpha The alpha value to use when initializing the color.
    */
    public convenience init(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, key: CGFloat, alpha: CGFloat) {
        let cmykComponents =
        UIColorCMYKComponents(
            cyan: cyan,
            magenta: magenta,
            yellow: yellow,
            key: key,
            alpha: alpha
        )
        let rgbComponents = cmykComponents.asRGBComponents()
        self.init(red: rgbComponents.red, green: rgbComponents.green, blue: rgbComponents.blue, alpha: alpha)
    }

    /**
      This method matches the system-provided messages for retrieving the various component values.
      @param          cyan The destination for the cyan value of this color.
      @param          magenta The destination for the magenta value of this color.
      @param          yellow The destination for the yellow value of this color.
      @param          key The destination for the key value of this color.
      @param          alpha The destination for the alpha value of this color.
      @discussion     This conversion may be lossy.
    */
    public func getCyan(inout cyanOut: CGFloat, inout magenta magentaOut: CGFloat, inout yellow yellowOut: CGFloat, inout key keyOut: CGFloat, inout alpha alphaOut: CGFloat) -> Bool {
        let components = cmykComponents
        cyanOut = components.cyan
        magentaOut = components.magenta
        yellowOut = components.yellow
        keyOut = components.key
        alphaOut = components.alpha
        return true
    }

    /**
      Property that returns the CMYK components of the color in a structure.
      @discussion       This conversion may be lossy.
    */
    public var cmykComponents: UIColorCMYKComponents {
        let components = rgbComponents
        let maximumRGBComponentValue = max(components.red, components.green, components.blue)
        if maximumRGBComponentValue > 0 {
            return UIColorCMYKComponents(
                cyan: 1 - (components.red / maximumRGBComponentValue),
                magenta: 1 - (components.green / maximumRGBComponentValue),
                yellow: 1 - (components.blue / maximumRGBComponentValue),
                key: 1 - maximumRGBComponentValue,
                alpha: rgbComponents.alpha
            )
        }
        else {
            return UIColorCMYKComponents(cyan: 0, magenta: 0, yellow: 0, key: 1, alpha: components.alpha)
        }
    }

}

/**
  Component conversion methods.
*/
public extension UIColorCMYKComponents {

    /**
      Converts CMYK components into RGB components.
    */
    public func asRGBComponents() -> UIColorRGBComponents {
        return color().rgbComponents
    }

    /**
      Converts CMYK components into HSB components.
    */
    public func asHSBComponents() -> UIColorHSBComponents {
        return color().hsbComponents
    }

    /**
      Converts CMYK components into grayscale components.
    */
    public func asGrayscaleComponents() -> UIColorGrayscaleComponents {
        return color().grayscaleComponents
    }

}
