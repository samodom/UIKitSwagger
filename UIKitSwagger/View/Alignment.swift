//
//  Alignment.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 10/10/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import UIKit

public extension UIView {

    /**
     Convenience method for creating, activating and returning constraints that will fill this view's superview.
     - Parameters:
       - inDirections: Set of layout directions in which to fill.  Only one horizontal idiom is allowed and the leading-to-trailing and top-to-bottom directions are used by default.
       - excludedEdges: Set of layout directions to exclude from filling.  Any edges provided must match the directions being used.
       - inMargins: Flag indicating whether or not filling should be performed with respect to the superview's layout margins.  By default, margins are not used.
     - Returns: All constraints created and activated for filling the view's superview.
     */
    public func fillSuperview(
        inDirections directions: Set<LayoutDirection> = DefaultFillDirections,
        excludeEdges edgesToExclude: Set<LayoutEdge> = [],
        inMargins respectMargins: Bool = false
        ) -> [NSLayoutConstraint] {

        guard superview != nil else {
            return []
        }

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

