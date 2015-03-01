//
//  ColorTestHelpers.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 3/1/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import UIKit

//  MARK: - Non-component structure

internal struct NonComponents: UIColorComponents {
    internal func color() -> UIColor {
        return UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    }
}

//  MARK: - Sample Color Values

//  MARK: Random component values

internal let randomRedValue = randomComponentValue()
internal let randomGreenValue = randomComponentValue()
internal let randomBlueValue = randomComponentValue()
internal let randomAlphaValue = randomComponentValue()
internal let randomHueValue = randomComponentValue()
internal let randomSaturationValue = randomComponentValue()
internal let randomBrightnessValue = randomComponentValue()
internal let randomWhiteValue = randomComponentValue()


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
        dispatch_once(&onceToken, { () -> Void in
            var now: time_t = 0
            time(&now)
            srand48(now);
        })
    }

    createGenerator()
    return CGFloat(drand48())
}

private let absoluteNudgeValue = CGFloat(1e-6)
internal func nudgeComponentValue(value: CGFloat) -> CGFloat {
    var useNegative: Bool
    if value < 0 + absoluteNudgeValue {
        useNegative = false
    }
    else if value > 1 - absoluteNudgeValue {
        useNegative = true
    }
    else {
        useNegative = arc4random() % 2 == 0
    }

    let nudgeValue = useNegative ? -absoluteNudgeValue : absoluteNudgeValue
    return value + nudgeValue
}
