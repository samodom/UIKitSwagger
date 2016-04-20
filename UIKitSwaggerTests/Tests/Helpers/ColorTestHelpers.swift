//
//  ColorTestHelpers.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 3/1/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import UIKit
@testable import UIKitSwagger

//  MARK: - Sample Color Values

//  MARK: Random component values

internal var randomAlphaValue = randomComponentValue()

internal var randomRedValue = randomComponentValue()
internal var randomGreenValue = randomComponentValue()
internal var randomBlueValue = randomComponentValue()

internal var randomHueValue = randomComponentValue()
internal var randomSaturationValue = randomComponentValue()
internal var randomBrightnessValue = randomComponentValue()

internal var randomWhiteValue = randomComponentValue()

internal var randomCyanValue = randomComponentValue()
internal var randomMagentaValue = randomComponentValue()
internal var randomYellowValue = randomComponentValue()
internal var randomKeyValue = randomComponentValue()


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

private var onceToken: dispatch_once_t = 0
internal func randomComponentValue() -> CGFloat {

    func createGenerator() {
        dispatch_once(&onceToken) {
            var now = time_t(0)
            time(&now)
            srand48(now);
        }
    }

    createGenerator()
    let randomValue = CGFloat(drand48())
    assert(floatingValueIsNormalized(randomValue))
    return randomValue
}

private func floatingValueIsNormalized<F: FloatingPointType>(value: F) -> Bool {
    return (F(0) ... F(1)).contains(value)
}

internal func nudgeComponentValue(value: CGFloat) -> CGFloat {
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
