//
//  UIColorComponents.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
  @protocol         Protocol that unifies the various types of component sets used to identify and compose a color.
  @discussion       Any user-defined component types will not enjoy the luxury of having the convenience initializer on `UIColor` produce component-based colors using their type.
*/
public protocol UIColorComponents {
    func color() -> UIColor
}

public extension UIColor {

    /**
      Convenience initializer for component-based color creation.
    */
    public convenience init(components: UIColorComponents) {

        switch components {
        case is UIColorRGBComponents:
            let rgbComponents = components as UIColorRGBComponents
            self.init(red: rgbComponents.red, green: rgbComponents.green, blue: rgbComponents.blue, alpha: rgbComponents.alpha)

        case is UIColorHSBComponents:
            let hsbComponents = components as UIColorHSBComponents
            self.init(hue: hsbComponents.hue, saturation: hsbComponents.saturation, brightness: hsbComponents.brightness, alpha: hsbComponents.alpha)

        case is UIColorGrayscaleComponents:
            let grayscaleComponents = components as UIColorGrayscaleComponents
            self.init(white: grayscaleComponents.white, alpha: grayscaleComponents.alpha)

        default:
            self.init(red: 0, green: 0, blue: 0, alpha: 0)
        }

    }

}

public extension UIColor {

    /**
      Property to provide the red component value of the color.
    */
    public var red: CGFloat {
        return rgbComponents.red
    }

    /**
      Property to provide the green component value of the color.
    */
    public var green: CGFloat {
        return rgbComponents.green
    }

    /**
      Property to provide the blue component value of the color.
    */
    public var blue: CGFloat {
        return rgbComponents.blue
    }

    /**
      Property to provide the alpha component value of the color.
    */
    public var alpha: CGFloat {
        return rgbComponents.alpha
    }

    /**
      Property to provide the hue component value of the color.
    */
    public var hue: CGFloat {
        return hsbComponents.hue
    }

    /**
      Property to provide the saturation component value of the color.
    */
    public var saturation: CGFloat {
        return hsbComponents.saturation
    }

    /**
      Property to provide the brightness component value of the color.
    */
    public var brightness: CGFloat {
        return hsbComponents.brightness
    }

    /**
      Property to provide the white component value of the color.
    */
    public var white: CGFloat {
        return grayscaleComponents.white
    }

}
