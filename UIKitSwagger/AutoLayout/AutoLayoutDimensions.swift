//
//  AutoLayoutDimensions.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
  Convenience method for making the widths of two or more items equal.
  @param        items Two or more items that are to maintain the same width.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func ConstrainWidths(items: AutoLayoutAttributable...) -> [Constraint] {
    return ConstrainWidths(items)
}

/**
  Convenience method for making the widths of an array of items equal.
  @param        items Array of two or more items that are to maintain the same width.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func ConstrainWidths(items: [AutoLayoutAttributable]) -> [Constraint] {
    return ConstrainDimension(items, .Width)
}

/**
  Convenience method for making the heights of two or more items equal.
  @param        items Two or more items that are to maintain the same height.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func ConstrainHeights(items: AutoLayoutAttributable...) -> [Constraint] {
    return ConstrainHeights(items)
}

/**
  Convenience method for making the heights of an array of items equal.
  @param        items Array of two or more items that are to maintain the same height.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func ConstrainHeights(items: [AutoLayoutAttributable]) -> [Constraint] {
    return ConstrainDimension(items, .Height)
}
