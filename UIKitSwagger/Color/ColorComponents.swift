//
//  ColorComponents.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
 Protocol that unifies the various types of component sets used to identify and compose a color.
 - note: Any user-defined component types will not enjoy the luxury of having the convenience initializer on `UIColor` produce component-based colors using their type.
 */
public protocol ColorComponents {
    var uiColor: UIColor { get }
}

public protocol RGBConvertible {
    var rgbComponents: RGBComponents { get }
}

public protocol HSBConvertible {
    var hsbComponents: HSBComponents { get }
}

public protocol CMYKConvertible {
    var cmykComponents: CMYKComponents { get }
}

public protocol GrayscaleConvertible {
    var grayscaleComponents: GrayscaleComponents { get }
}

//  MARK: - Internal

#if arch(x86_64) || arch(arm64)
    internal let ColorComponentValueTestAccuracy = CGFloat(2 * DBL_EPSILON)
#else
    internal let ColorComponentValueTestAccuracy = CGFloat(2 * FLT_EPSILON)
#endif

internal func componentValuesEqualWithinTolerance(_ value1: CGFloat, _ value2: CGFloat) -> Bool {
    return fabs(value1 - value2) < ColorComponentValueTestAccuracy
}
