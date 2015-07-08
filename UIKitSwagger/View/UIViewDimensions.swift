//
//  UIViewDimensions.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension UIView {

    /**
    Convenience method for constraining the width of a view to a constant value.
    - parameter width: Width to maintain on view.
    - returns: The constraint that was created and activated.
    - note: The layout constraint created by this method is automatically activated.
    */
    public func constrainWidth(width: CGFloat) -> NSLayoutConstraint {
        let constraint = self.width =* width
        constraint.activate()
        return constraint
    }

    /**
    Convenience method for constraining the width of a view to a range of value.
    - parameter interval: Range of width values to maintain on view.
    - returns: The constraints that were created and activated.
    - note: The layout constraints created by this method are automatically activated.
    */
    public func constrainWidth(interval: ClosedInterval<CGFloat>) -> [NSLayoutConstraint] {
        let constraints = [
            self.width >=* interval.start,
            self.width <=* interval.end
        ]
        ActivateConstraints(constraints)
        return constraints
    }

    /**
    Convenience method for constraining the height of a view to a constant value.
    - parameter height: Height to maintain on view.
    - returns: The constraint that was created and activated.
    - note: The layout constraint created by this method is automatically activated.
    */
    public func constrainHeight(height: CGFloat) -> NSLayoutConstraint {
        let constraint = self.height =* height
        constraint.activate()
        return constraint
    }

    /**
    Convenience method for constraining the height of a view to a range of value.
    - parameter interval: Range of height values to maintain on view.
    - returns: The constraints that were created and activated.
    - note: The layout constraints created by this method are automatically activated.
    */
    public func constrainHeight(interval: ClosedInterval<CGFloat>) -> [NSLayoutConstraint] {
        let constraints = [
            self.height >=* interval.start,
            self.height <=* interval.end
        ]
        ActivateConstraints(constraints)
        return constraints
    }

    /**
    Convenience method for setting the aspect ratio on a view with or without an offset.
    - parameter aspectRatio: Aspect ratio to maintain between the width and height before the offset.
    - parameter offset: Offset value to add to the height multiple to get the final width.
    - returns: The constraint that was created and activated.
    - note: The layout constraint created by this method is automatically activated.
    - warning: Using an aspect ratio of zero throws an error.
    */
    public func constrainWidthToHeight(aspectRatio: CGFloat = 1, offset: CGFloat = 0) -> NSLayoutConstraint {
        assert(aspectRatio != 0)
        return constrainHeightToWidth(1 / aspectRatio, offset: -offset / aspectRatio)
    }

    /**
    Convenience method for setting the aspect ratio on a view with or without an offset.
    - parameter aspectRatio: Aspect ratio to maintain between the height and width before the offset.
    - parameter offset: Offset value to add to the width multiple to get the final height.
    - returns: The constraint that was created and activated.
    - note: The layout constraint created by this method is automatically activated.
    - warning: Using an aspect ratio of zero throws an error.
    */
    public func constrainHeightToWidth(aspectRatio: CGFloat = 1, offset: CGFloat = 0) -> NSLayoutConstraint {
        assert(aspectRatio != 0)
        let constraint = self.height =* aspectRatio * self.width + offset
        constraint.activate()
        return constraint
    }

}
