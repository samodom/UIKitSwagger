//
//  LayoutDirection.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 7/10/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import UIKit

internal enum LayoutDirection: Int {
    case LeftToRight = 1
    case RightToLeft = -1
    case LeadingToTrailing = 2
    case TrailingToLeading = -2
    case TopToBottom = 3
    case BottomToTop = -3

    internal var attributePair: DirectedAttributePair {
        let reversed = rawValue < 0
        let defaultDirection = LayoutDirection(rawValue: abs(rawValue))!
        let defaultPair = DirectedAttributePairMapping[defaultDirection]!
        return reversed ? reverseAttributePair(defaultPair) : defaultPair
    }

    internal var axis: UILayoutConstraintAxis {
        return abs(rawValue) == LayoutDirection.TopToBottom.rawValue ? .Vertical : .Horizontal
    }
}

internal prefix func -(direction: LayoutDirection) -> LayoutDirection {
    return LayoutDirection(rawValue: -direction.rawValue)!
}

internal typealias DirectedAttributePair = (NSLayoutAttribute, NSLayoutAttribute)

private let DirectedAttributePairMapping: [LayoutDirection:DirectedAttributePair] = [
    .LeftToRight: (.Left, .Right),
    .LeadingToTrailing: (.Leading, .Trailing),
    .TopToBottom: (.Top, .Bottom)
]

private func reverseAttributePair(attributePair: DirectedAttributePair) -> DirectedAttributePair {
    return (attributePair.1, attributePair.0)
}