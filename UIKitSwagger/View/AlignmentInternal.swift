//
//  AlignmentInternal.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 5/1/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit

private let DefaultHorizontalFillDirection = LayoutDirection.LeadingToTrailing

internal let DefaultFillDirections: Set<LayoutDirection> = [.LeadingToTrailing, .TopToBottom]

internal typealias FillingAttributePair = (
    subviewAttribute: NSLayoutAttribute,
    superviewAttribute: NSLayoutAttribute
)

internal func attributePairsForFillingInDirections(
    directions: Set<LayoutDirection>,
    excludingEdges edgesToExclude: Set<LayoutEdge>,
    respectingMargins useMargins: Bool
    ) -> [FillingAttributePair] {

    let targetEdges = Array(directions.flatMap { $0.layoutEdges }.filter { !edgesToExclude.contains($0) })

    return Array(
        zip(
            targetEdges.map { $0.getLayoutAttribute(usingMargins: false) },
            targetEdges.map { $0.getLayoutAttribute(usingMargins: useMargins) }
        )
    )
}

private func AssertDirectionsAreValid(directions: Set<LayoutDirection>) {

    precondition(directions.count <= 2)

    var usingLeftToRight = false
    var usingLeadingToTrailing = false

    directions.forEach {
        switch $0 {
        case .LeadingToTrailing, .TrailingToLeading:
            usingLeadingToTrailing = true

        case .LeftToRight, .RightToLeft:
            usingLeftToRight = true

        case .TopToBottom, .BottomToTop:
            break
        }

        assert(
            !(usingLeadingToTrailing && usingLeftToRight),
            "Leading/trailing and left/right directions may not be used together"
        )
    }
}

private func AssertEdgesAreValid(edges: Set<LayoutEdge>) {

    var usingLeftToRight = false
    var usingLeadingToTrailing = false

    edges.forEach {
        switch $0 {
        case .Leading, .Trailing:
            usingLeadingToTrailing = true

        case .Left, .Right:
            usingLeftToRight = true

        case .Top, .Bottom:
            break
        }

        assert(
            !(usingLeadingToTrailing && usingLeftToRight),
            "Leading/trailing and left/right edges may not be used together"
        )
    }
}

internal func AssertCompatibleEdges(edges: Set<LayoutEdge>, withDirections directions: Set<LayoutDirection>) {
    AssertDirectionsAreValid(directions)
    AssertEdgesAreValid(edges)

    var usingLeftToRight = false
    var usingLeadingToTrailing = false

    directions.forEach {
        switch $0 {
        case .LeadingToTrailing, .TrailingToLeading:
            usingLeadingToTrailing = true

        case .LeftToRight, .RightToLeft:
            usingLeftToRight = true

        case .TopToBottom, .BottomToTop:
            break
        }
    }

    edges.forEach {
        switch $0 {
        case .Leading, .Trailing:
            assert(!usingLeftToRight,
                "Left/right edges may not be used with leading/trailing directions")

        case .Left, .Right:
            assert(!usingLeadingToTrailing,
                "Leading/trailing edges may not be used with left/right directions")
            
        case .Top, .Bottom:
            break
        }
    }
}

