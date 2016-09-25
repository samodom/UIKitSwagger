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

internal var randomAlphaValue = ComponentGenerator.generate()

internal var randomRedValue = ComponentGenerator.generate()
internal var randomGreenValue = ComponentGenerator.generate()
internal var randomBlueValue = ComponentGenerator.generate()

internal var randomHueValue = ComponentGenerator.generate()
internal var randomSaturationValue = ComponentGenerator.generate()
internal var randomBrightnessValue = ComponentGenerator.generate()

internal var randomWhiteValue = ComponentGenerator.generate()

internal var randomCyanValue = ComponentGenerator.generate()
internal var randomMagentaValue = ComponentGenerator.generate()
internal var randomYellowValue = ComponentGenerator.generate()
internal var randomKeyValue = ComponentGenerator.generate()


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

internal var sampleCMYKColor =
UIColor(
    cyan: randomCyanValue,
    magenta: randomMagentaValue,
    yellow: randomYellowValue,
    key: randomKeyValue,
    alpha: randomAlphaValue
)

internal var sampleMonochromeColor =
UIColor(
    white: randomWhiteValue,
    alpha: randomAlphaValue
)


//  MARK: Utilities

internal var ComponentGenerator = RandomComponentValueGenerator()

internal struct RandomComponentValueGenerator {

    internal init() {
        var now = time_t(0)
        time(&now)
        srand48(now)
        generate = {
            let randomValue = CGFloat(drand48())
            assert(floatingValueIsNormalized(randomValue))
            return randomValue
        }
    }

    internal let generate: () -> CGFloat
}

private func floatingValueIsNormalized<F: FloatingPoint>(_ value: F) -> Bool {
    return (F(0) ... F(1)).contains(value)
}

internal func nudgeComponentValue(_ value: CGFloat) -> CGFloat {
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
