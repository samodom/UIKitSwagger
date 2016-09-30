//
//  LayoutDirection.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 7/10/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import UIKit

/**
 Enumerated integer type for layout directions in both possible orders.
 */
public enum LayoutDirection: Int {
    case leftToRight = 1
    case rightToLeft = -1
    case leadingToTrailing = 2
    case trailingToLeading = -2
    case topToBottom = 3
    case bottomToTop = -3

    internal var attributePair: DirectedAttributePair {
        let reversed = rawValue < 0
        let defaultDirection = LayoutDirection(rawValue: abs(rawValue))!
        let defaultPair = DirectedAttributePairMapping[defaultDirection]!
        return reversed ? reverseAttributePair(defaultPair) : defaultPair
    }

    internal var axis: UILayoutConstraintAxis {
        return abs(rawValue) == LayoutDirection.topToBottom.rawValue ? .vertical : .horizontal
    }

    internal var layoutEdges: Set<LayoutEdge> {
        switch self {
        case .leftToRight, .rightToLeft:
            return [.left, .right]

        case .leadingToTrailing, .trailingToLeading:
            return [.leading, .trailing]

        case .topToBottom, .bottomToTop:
            return [.top, .bottom]
        }
    }

}

internal prefix func -(direction: LayoutDirection) -> LayoutDirection {
    return LayoutDirection(rawValue: -direction.rawValue)!
}

internal typealias DirectedAttributePair = (NSLayoutAttribute, NSLayoutAttribute)

private let DirectedAttributePairMapping: [LayoutDirection:DirectedAttributePair] = [
    .leftToRight: (.left, .right),
    .leadingToTrailing: (.leading, .trailing),
    .topToBottom: (.top, .bottom)
]

private func reverseAttributePair(_ attributePair: DirectedAttributePair) -> DirectedAttributePair {
    return (attributePair.1, attributePair.0)
}
