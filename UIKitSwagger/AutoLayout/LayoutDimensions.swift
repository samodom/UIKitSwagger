//
//  LayoutDimensions.swift
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


//  MARK: Widths

/**
 Convenience method for making the widths of two or more items equal.
 - parameter items: Two or more items that are to maintain the same width.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func MatchWidths(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return MatchWidths(items)
}

/**
 Convenience method for making the widths of an array of items equal.
 - parameter items: Array of two or more items that are to maintain the same width.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func MatchWidths(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return MatchDimension(items, dimension: .Width)
}

/**
 Convenience method for constraint the widths of one or more items to a constant.
 - parameter width: Constant width for items to maintain.
 - parameter items: One or more items that are to maintain the constant width.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 */
public func ConstrainWidths(width: CGFloat, items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return ConstrainWidths(width, items: items)
}

/**
 Convenience method for constraint the widths of an array of items to a constant.
 - parameter width: Constant width for items to maintain.
 - parameter items: Array of items that are to maintain the constant width.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 */
public func ConstrainWidths(width: CGFloat, items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return ConstrainDimension(items, dimension: .Width, value: width)
}

/**
 Convenience method for constraining the widths of one or more items to an interval.
 - parameter interval: A closed interval representing the minimum and maximum widths for this view.
 - parameter items: One or more items that are to maintain a width in the specified interval.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 */
public func ConstrainWidths(interval: ClosedInterval<CGFloat>, items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return ConstrainWidths(interval, items: items)
}

/**
 Convenience method for constraining the widths of an array of items to an interval.
 - parameter interval: A closed interval representing the minimum and maximum widths for this view.
 - parameter items: Array of items that are to maintain a width in the specified interval.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 */
public func ConstrainWidths(interval: ClosedInterval<CGFloat>, items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return ConstrainDimension(items, dimension: .Width, interval: interval)
}


//  MARK: Heights

/**
 Convenience method for making the heights of two or more items equal.
 - parameter items: Two or more items that are to maintain the same height.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func MatchHeights(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return MatchHeights(items)
}

/**
 Convenience method for making the heights of an array of items equal.
 - parameter items: Array of two or more items that are to maintain the same height.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func MatchHeights(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return MatchDimension(items, dimension: .Height)
}

/**
 Convenience method for constraint the heights of one or more items to a constant.
 - parameter height: Constant height for items to maintain.
 - parameter items: One or more items that are to maintain the constant height.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 */
public func ConstrainHeights(height: CGFloat, items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return ConstrainHeights(height, items: items)
}

/**
 Convenience method for constraint the heights of an array of items to a constant.
 - parameter height: Constant height for items to maintain.
 - parameter items: Array of more items that are to maintain the constant height.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 */
public func ConstrainHeights(height: CGFloat, items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return ConstrainDimension(items, dimension: .Height, value: height)
}

/**
 Convenience method for constraining the heights of one or more items to an interval.
 - parameter interval: A closed interval representing the minimum and maximum widths for this view.
 - parameter items: One or more items that are to maintain a height in the specified interval.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 */
public func ConstrainHeights(interval: ClosedInterval<CGFloat>, items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return ConstrainHeights(interval, items: items)
}

/**
 Convenience method for constraining the heights of an array of items to an interval.
 - parameter interval: A closed interval representing the minimum and maximum widths for this view.
 - parameter items: Array of items that are to maintain a height in the specified interval.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 */
public func ConstrainHeights(interval: ClosedInterval<CGFloat>, items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return ConstrainDimension(items, dimension: .Height, interval: interval)
}


//  MARK: Heights

/**
 Convenience method for making the sizes of two or more items equal.
 - parameter items: Two or more items that are to maintain the same size.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func MatchSizes(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return MatchSizes(items)
}

/**
 Convenience method for making the sizes of an array of items equal.
 - parameter items: Array of two or more items that are to maintain the same size.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func MatchSizes(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return MatchWidths(items) + MatchHeights(items)
}
