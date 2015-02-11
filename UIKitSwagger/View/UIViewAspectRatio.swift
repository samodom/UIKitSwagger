//
//  UIViewAspectRatio.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension UIView {

    /**
      Convenience method for setting the aspect ratio on a view with or without an offset.
      @param        aspectRatio Aspect ratio to maintain between the width and height before the offset.
      @param        offset Offset value to add to the height multiple to get the final width.
      @return       The constraint that was applied to the view.
      @discussion   The layout constraints created by this function are applied to this view.  Using an aspect ratio of zero throws an error.
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
      @discussion   The layout constraints created by this function are applied to this view.  Using an aspect ratio of zero throws an error.
    */
    public func constrainHeightToWidth(_ aspectRatio: CGFloat = 1, offset: CGFloat = 0) -> Constraint {
        assert(aspectRatio != 0)
        let constraint = self.height =* aspectRatio * self.width + offset
        constraint.apply()
        return constraint
    }

}
