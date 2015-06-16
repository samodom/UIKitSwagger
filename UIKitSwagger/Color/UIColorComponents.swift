//
//  UIColorComponents.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
  Protocol that unifies the various types of component sets used to identify and compose a color.
  Any user-defined component types will not enjoy the luxury of having the convenience initializer on `UIColor` produce component-based colors using their type.
*/
public protocol UIColorComponents {
    func color() -> UIColor
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

//  MARK: - Internal

#if arch(x86_64) || arch(arm64)
    internal let ColorComponentValueTestAccuracy = CGFloat(DBL_EPSILON)
    #else
    internal let ColorComponentValueTestAccuracy = CGFloat(FLT_EPSILON)
#endif

internal func componentValuesEqualWithinTolerance(value1: CGFloat, _ value2: CGFloat) -> Bool {
    return fabs(value1 - value2) < ColorComponentValueTestAccuracy
}
