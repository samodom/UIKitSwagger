//
//  AutoLayoutDimensions.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
  Convenience method for making the widths of two or more views equal.
  @param        views Two or more items that are to maintain the same width.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func ConstrainWidths(views: UIView...) {
    ConstrainWidths(views)
}

/**
  Convenience method for making the widths of an array of views equal.
  @param        views Array of two or more items that are to maintain the same width.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func ConstrainWidths(views: [UIView]) {
    ConstrainDimension(views, .Width)
}

/**
  Convenience method for making the heights of two or more views equal.
  @param        views Two or more items that are to maintain the same height.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func ConstrainHeights(views: UIView...) {
    ConstrainHeights(views)
}

/**
  Convenience method for making the heights of an array of views equal.
  @param        views Array of two or more items that are to maintain the same height.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func ConstrainHeights(views: [UIView]) {
    ConstrainDimension(views, .Height)
}

////////////////////////////////////////////////////////////////////////////////

private func ConstrainDimension(views: [UIView], dimension: NSLayoutAttribute) {
    AssertDimensionItemCount(views.count)

    let firstItem = views.first!.attributedItemForLayoutAttribute(dimension)
    for item in views {
        let attributedItem = item.attributedItemForLayoutAttribute(dimension)
        (attributedItem =* firstItem).apply()
    }
}

private func AssertDimensionItemCount(count: Int) {
    assert(count > 1, "Multiple views are required for constraining dimensions")
}
