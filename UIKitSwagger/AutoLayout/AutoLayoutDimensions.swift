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
  @param        items Two or more items that are to maintain the same width.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func MatchWidths(items: AutoLayoutAttributable...) -> [Constraint] {
    return MatchWidths(items)
}

/**
  Convenience method for making the widths of an array of items equal.
  @param        items Array of two or more items that are to maintain the same width.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func MatchWidths(items: [AutoLayoutAttributable]) -> [Constraint] {
    return MatchDimension(items, .Width)
}

/**
  Convenience method for constraint the widths of one or more items to a constant.
  @param        items One or more items that are to maintain a constant width.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.
*/
public func ConstrainWidths(width: CGFloat, items: AutoLayoutAttributable...) -> [Constraint] {
    return ConstrainWidths(width, items)
}

/**
  Convenience method for constraint the widths of an array of items to a constant.
  @param        items Array of items that are to maintain a constant width.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.
*/
public func ConstrainWidths(width: CGFloat, items: [AutoLayoutAttributable]) -> [Constraint] {
    return ConstrainDimension(items, .Width, width)
}

/**
  Convenience method for constraining the widths of one or more items to an interval.
  @param        items One or more items that are to maintain a width in the specified interval.
  @param        interval A closed interval representing the minimum and maximum widths for this view.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.
*/
public func ConstrainWidths(interval: ClosedInterval<CGFloat>, items: AutoLayoutAttributable...) -> [Constraint] {
    return ConstrainWidths(interval, items)
}

/**
  Convenience method for constraining the widths of an array of items to an interval.
  @param        items Array of items that are to maintain a width in the specified interval.
  @param        interval A closed interval representing the minimum and maximum widths for this view.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.
*/
public func ConstrainWidths(interval: ClosedInterval<CGFloat>, items: [AutoLayoutAttributable]) -> [Constraint] {
    return ConstrainDimension(items, .Width, interval)
}


//  MARK: Heights

/**
  Convenience method for making the heights of two or more items equal.
  @param        items Two or more items that are to maintain the same height.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func MatchHeights(items: AutoLayoutAttributable...) -> [Constraint] {
    return MatchHeights(items)
}

/**
  Convenience method for making the heights of an array of items equal.
  @param        items Array of two or more items that are to maintain the same height.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func MatchHeights(items: [AutoLayoutAttributable]) -> [Constraint] {
    return MatchDimension(items, .Height)
}

/**
  Convenience method for constraint the heights of one or more items to a constant.
  @param        items One or more items that are to maintain a constant height.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.
*/
public func ConstrainHeights(height: CGFloat, items: AutoLayoutAttributable...) -> [Constraint] {
    return ConstrainHeights(height, items)
}

/**
  Convenience method for constraint the heights of an array of items to a constant.
  @param        items Array of more items that are to maintain a constant height.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.
*/
public func ConstrainHeights(height: CGFloat, items: [AutoLayoutAttributable]) -> [Constraint] {
    return ConstrainDimension(items, .Height, height)
}

/**
  Convenience method for constraining the heights of one or more items to an interval.
  @param        items One or more items that are to maintain a height in the specified interval.
  @param        interval A closed interval representing the minimum and maximum widths for this view.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.
*/
public func ConstrainHeights(interval: ClosedInterval<CGFloat>, items: AutoLayoutAttributable...) -> [Constraint] {
    return ConstrainHeights(interval, items)
}

/**
  Convenience method for constraining the heights of an array of items to an interval.
  @param        items Array of items that are to maintain a height in the specified interval.
  @param        interval A closed interval representing the minimum and maximum widths for this view.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.
*/
public func ConstrainHeights(interval: ClosedInterval<CGFloat>, items: [AutoLayoutAttributable]) -> [Constraint] {
    return ConstrainDimension(items, .Height, interval)
}


//  MARK: Heights

/**
  Convenience method for making the sizes of two or more items equal.
  @param        items Two or more items that are to maintain the same size.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func MatchSizes(items: AutoLayoutAttributable...) -> [Constraint] {
    return MatchSizes(items)
}

/**
  Convenience method for making the sizes of an array of items equal.
  @param        items Array of two or more items that are to maintain the same size.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func MatchSizes(items: [AutoLayoutAttributable]) -> [Constraint] {
    return MatchWidths(items) + MatchHeights(items)
}
