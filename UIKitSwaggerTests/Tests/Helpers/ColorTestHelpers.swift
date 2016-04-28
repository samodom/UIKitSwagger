//
//  ColorTestHelpers.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 3/1/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import UIKit
import UIKitSwagger

//  MARK: - Sample Color Values

//  MARK: Random component values

internal var randomAlphaValue = RandomComponentValue()

internal var randomRedValue = RandomComponentValue()
internal var randomGreenValue = RandomComponentValue()
internal var randomBlueValue = RandomComponentValue()

internal var randomHueValue = RandomComponentValue()
internal var randomSaturationValue = RandomComponentValue()
internal var randomBrightnessValue = RandomComponentValue()

internal var randomWhiteValue = RandomComponentValue()

internal var randomCyanValue = RandomComponentValue()
internal var randomMagentaValue = RandomComponentValue()
internal var randomYellowValue = RandomComponentValue()
internal var randomKeyValue = RandomComponentValue()


//  MARK: Colors

internal var sampleRGBColor =
UIColor(
    red: randomRedValue,
    green: randomGreenValue,
    blue: randomBlueValue,
    alpha: randomAlphaValue
)

internal var sampleHSBColor =
UIColor(
    hue: randomHueValue,
    saturation: randomSaturationValue,
    brightness: randomBrightnessValue,
    alpha: randomAlphaValue
)

internal var sampleMonochromeColor =
UIColor(
    white: randomWhiteValue,
    alpha: randomAlphaValue
)


//  MARK: Utilities

private var RandomValueGeneratorOnceToken: dispatch_once_t = 0
internal func RandomComponentValue() -> CGFloat {

    func createGenerator() {
        dispatch_once(&RandomValueGeneratorOnceToken) {
            var now = time_t(0)
            time(&now)
            srand48(now);
        }
    }

    createGenerator()
    let randomValue = CGFloat(drand48())
    assert(FloatingValueIsNormalized(randomValue))
    return randomValue
}

private func FloatingValueIsNormalized<F: FloatingPointType>(value: F) -> Bool {
    return (F(0) ... F(1)).contains(value)
}

internal func NudgeComponentValue(value: CGFloat) -> CGFloat {
    var useNegative: Bool
    if value < 0 + ColorComponentValueTestAccuracy {
        useNegative = false
    }
    else if value > 1 - ColorComponentValueTestAccuracy {
        useNegative = true
    }
    else {
        useNegative = arc4random() % 2 == 0
    }

    let nudgeValue = useNegative ? -ColorComponentValueTestAccuracy : ColorComponentValueTestAccuracy
    return value + nudgeValue
}

#if arch(x86_64) || arch(arm64)
    internal let ColorComponentValueTestAccuracy = CGFloat(DBL_EPSILON)
#else
    internal let ColorComponentValueTestAccuracy = CGFloat(FLT_EPSILON)
#endif

internal func ComponentValuesEqualWithinTestTolerance(value1: CGFloat, _ value2: CGFloat) -> Bool {
    return fabs(value1 - value2) < ColorComponentValueTestAccuracy
}
