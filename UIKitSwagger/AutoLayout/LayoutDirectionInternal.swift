//
//  LayoutDirectionInternal.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 4/30/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit

internal extension LayoutDirection {

    internal var attributePair: DirectedAttributePair {
        let reversed = rawValue < 0
        let defaultDirection = LayoutDirection(rawValue: abs(rawValue))!
        let defaultPair = DirectedAttributePairMapping[defaultDirection]!
        return reversed ? reverseAttributePair(defaultPair) : defaultPair
    }

    internal var axis: UILayoutConstraintAxis {
        return abs(rawValue) == LayoutDirection.TopToBottom.rawValue ? .Vertical : .Horizontal
    }

    internal var layoutEdges: Set<LayoutEdge> {
        switch self {
        case .LeftToRight, .RightToLeft:
            return [.Left, .Right]

        case .LeadingToTrailing, .TrailingToLeading:
            return [.Leading, .Trailing]

        case .TopToBottom, .BottomToTop:
            return [.Top, .Bottom]
        }
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
