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
      @param        width Width to maintain on view.
      @return       The constraint that was applied to the view.
      @discussion   The layout constraint created by this function is applied to this view.
    */
    public func constrainWidth(width: CGFloat) -> Constraint {
        let constraint = self.width =* width
        constraint.apply()
        return constraint
    }

    /**
      Convenience method for constraining the width of a view to a range of value.
      @param        interval Range of width values to maintain on view.
      @return       The constraints that were applied to the view.
      @discussion   The layout constraints created by this function are applied to this view.
    */
    public func constrainWidth(interval: ClosedInterval<CGFloat>) -> [Constraint] {
        let constraints = [
            self.width >=* interval.start,
            self.width <=* interval.end
        ]
        ApplyConstraints(constraints)
        return constraints
    }

    /**
      Convenience method for constraining the height of a view to a constant value.
      @param        height Height to maintain on view.
      @return       The constraint that was applied to the view.
      @discussion   The layout constraint created by this function is applied to this view.
    */
    public func constrainHeight(height: CGFloat) -> Constraint {
        let constraint = self.height =* height
        constraint.apply()
        return constraint
    }

    /**
      Convenience method for constraining the height of a view to a range of value.
      @param        interval Range of height values to maintain on view.
      @return       The constraints that were applied to the view.
      @discussion   The layout constraints created by this function are applied to this view.
    */
    public func constrainHeight(interval: ClosedInterval<CGFloat>) -> [Constraint] {
        let constraints = [
            self.height >=* interval.start,
            self.height <=* interval.end
        ]
        ApplyConstraints(constraints)
        return constraints
    }

    /**
      Convenience method for setting the aspect ratio on a view with or without an offset.
      @param        aspectRatio Aspect ratio to maintain between the width and height before the offset.
      @param        offset Offset value to add to the height multiple to get the final width.
      @return       The constraint that was applied to the view.
      @discussion   The layout constraint created by this function is applied to this view.  Using an aspect ratio of zero throws an error.
    */
    public func constrainWidthToHeight(_ aspectRatio: CGFloat = 1, offset: CGFloat = 0) -> Constraint {
        assert(aspectRatio != 0)
        return constrainHeightToWidth(1 / aspectRatio, offset: -offset / aspectRatio)
    }

    /**
      Convenience method for setting the aspect ratio on a view with or without an offset.
      @param        aspectRatio Aspect ratio to maintain between the height and width before the offset.
      @param        offset Offset value to add to the width multiple to get the final height.
      @return       The constraint that was applied to the view.
      @discussion   The layout constraint created by this function is applied to this view.  Using an aspect ratio of zero throws an error.
    */
    public func constrainHeightToWidth(_ aspectRatio: CGFloat = 1, offset: CGFloat = 0) -> Constraint {
        assert(aspectRatio != 0)
        let constraint = self.height =* aspectRatio * self.width + offset
        constraint.apply()
        return constraint
    }

}
