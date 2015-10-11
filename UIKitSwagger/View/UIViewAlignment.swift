//
//  UIViewAlignment.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 10/10/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import UIKit

private let DefaultHorizontalFillDirection = LayoutDirection.LeadingToTrailing
private let DefaultFillDirections: Set<LayoutDirection> = [.LeadingToTrailing, .TopToBottom]

public extension UIView {

    /**
     Convenience method for creating, activating and returning constraints that will fill this view's superview.
     - parameter inDirections: Set of layout directions in which to fill.  Only one horizontal idiom is allowed and the leading-to-trailing and top-to-bottom directions are used by default.
     - parameter excludedEdges: Set of layout directions to exclude from filling.  Any edges provided must match the directions being used.
     - parameter inMargins: Flag indicating whether or not filling should be performed with respect to the superview's layout margins.  By default, margins are not used.
     - returns: All constraints created and activated for filling the view's superview.
     */
    public func fillSuperview(
        inDirections directions: Set<LayoutDirection> = DefaultFillDirections,
        excludeEdges edgesToExclude: Set<LayoutEdge> = [],
        inMargins respectMargins: Bool = false) -> [NSLayoutConstraint] {

            guard superview != nil else { return [] }
            AssertCompatibleEdges(edgesToExclude, withDirections: directions)

            let attributePairs = attributePairsForFillingInDirections(
                directions,
                excludingEdges: edgesToExclude,
                respectingMargins: respectMargins
            )

            let constraints = attributePairs.map {
                (self, $0.subviewAttribute) =* (superview!, $0.superviewAttribute)
            }
            ActivateConstraints(constraints)

            return constraints
    }

}

private typealias FillingAttributePair = (subviewAttribute: NSLayoutAttribute, superviewAttribute: NSLayoutAttribute)

private func attributePairsForFillingInDirections(
    directions: Set<LayoutDirection>,
    excludingEdges edgesToExclude: Set<LayoutEdge>,
    respectingMargins useMargins: Bool) -> [FillingAttributePair] {

        let targetEdges = Array(directions.flatMap { $0.layoutEdges }.filter { !edgesToExclude.contains($0) })
        return Array(zip(
            targetEdges.map { $0.getLayoutAttribute(usingMargins: false) },
            targetEdges.map { $0.getLayoutAttribute(usingMargins: useMargins) }
            ))
}

private func AssertDirectionsAreValid(directions: Set<LayoutDirection>) {
    assert(directions.count <= 2)
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

        assert(!(usingLeadingToTrailing && usingLeftToRight),
            "Leading/trailing and left/right directions may not be used together")
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

        assert(!(usingLeadingToTrailing && usingLeftToRight),
            "Leading/trailing and left/right edges may not be used together")
    }
}

private func AssertCompatibleEdges(edges: Set<LayoutEdge>, withDirections directions: Set<LayoutDirection>) {
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
            assert(!usingLeftToRight, "Left/right edges may not be used with leading/trailing directions")

        case .Left, .Right:
            assert(!usingLeadingToTrailing, "Leading/trailing edges may not be used with left/right directions")
            
        case .Top, .Bottom:
            break
        }
    }
}

