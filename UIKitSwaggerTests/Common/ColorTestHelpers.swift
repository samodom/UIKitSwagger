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

var randomAlphaValue = ComponentGenerator.generate()

var randomRedValue = ComponentGenerator.generate()
var randomGreenValue = ComponentGenerator.generate()
var randomBlueValue = ComponentGenerator.generate()

var randomHueValue = ComponentGenerator.generate()
var randomSaturationValue = ComponentGenerator.generate()
var randomBrightnessValue = ComponentGenerator.generate()

var randomWhiteValue = ComponentGenerator.generate()

var randomCyanValue = ComponentGenerator.generate()
var randomMagentaValue = ComponentGenerator.generate()
var randomYellowValue = ComponentGenerator.generate()
var randomKeyValue = ComponentGenerator.generate()


//  MARK: Colors

var sampleRGBColor = UIColor(
    red: randomRedValue,
    green: randomGreenValue,
    blue: randomBlueValue,
    alpha: randomAlphaValue
)

var sampleHSBColor = UIColor(
    hue: randomHueValue,
    saturation: randomSaturationValue,
    brightness: randomBrightnessValue,
    alpha: randomAlphaValue
)

var sampleCMYKColor = UIColor(
    cyan: randomCyanValue,
    magenta: randomMagentaValue,
    yellow: randomYellowValue,
    key: randomKeyValue,
    alpha: randomAlphaValue
)

var sampleMonochromeColor = UIColor(
    white: randomWhiteValue,
    alpha: randomAlphaValue
)


//  MARK: Utilities

fileprivate let ComponentGenerator = RandomComponentValueGenerator()

fileprivate struct RandomComponentValueGenerator {

    init() {
        var now = time_t(0)
        time(&now)
        srand48(now)
        generate = {
            let randomValue = CGFloat(drand48())
            assert(floatingValueIsNormalized(randomValue))
            return randomValue
        }
    }

    let generate: () -> CGFloat
}

fileprivate func floatingValueIsNormalized<F: FloatingPoint>(_ value: F) -> Bool {
    return (F(0) ... F(1)).contains(value)
}

func nudgeComponentValue(_ value: CGFloat) -> CGFloat {
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
