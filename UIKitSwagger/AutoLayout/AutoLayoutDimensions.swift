//
//  AutoLayoutDimensions.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

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
