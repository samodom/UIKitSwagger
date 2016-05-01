//
//  ColorComponentsInternal.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 5/1/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit

#if arch(x86_64) || arch(arm64)
    internal let ColorComponentValueAccuracy = CGFloat(DBL_EPSILON)
#else
    internal let ColorComponentValueAccuracy = CGFloat(FLT_EPSILON)
#endif

internal func componentValuesEqualWithinTolerance(value1: CGFloat, _ value2: CGFloat) -> Bool {
    return fabs(value1 - value2) < ColorComponentValueAccuracy
}
