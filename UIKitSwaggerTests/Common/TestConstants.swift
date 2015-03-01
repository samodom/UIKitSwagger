//
//  TestConstants.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

internal let MinimumTestExpectationWaitTime = 0.05 as NSTimeInterval
internal let MaximumTestExpectationWaitTime = 0.1 as NSTimeInterval

#if arch(x86_64) || arch(arm64)
    internal let ColorComponentValueTestAccuracy = CGFloat(DBL_EPSILON)
    #else
    internal let ColorComponentValueTestAccuracy = CGFloat(FLT_EPSILON)
#endif
