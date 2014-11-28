//
//  AutoLayoutViewAlignment.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/27/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
  Convenience method for aligning two or more items by their left attribute.
  @param        items Two or more items that are to be left-aligned.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignLeft(items: AutoLayoutAttributable...) -> [Constraint] {
    return AlignLeft(items)
}

/**
  Convenience method for aligning an array of items by their left attribute.
  @param        items Array of two or more items that are to be left-aligned.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignLeft(items: [AutoLayoutAttributable]) -> [Constraint] {
    return AlignItems(items, .Left)
}

/**
  Convenience method for aligning two or more items by their right attribute.
  @param        items Two or more items that are to be right-aligned.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignRight(items: AutoLayoutAttributable...) -> [Constraint] {
    return AlignRight(items)
}

/**
  Convenience method for aligning an array of items by their right attribute.
  @param        items Array of two or more items that are to be right-aligned.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignRight(items: [AutoLayoutAttributable]) -> [Constraint] {
    return AlignItems(items, .Right)
}

/**
  Convenience method for aligning two or more items by their top attribute.
  @param        items Two or more items that are to be top-aligned.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignTop(items: AutoLayoutAttributable...) -> [Constraint] {
    return AlignTop(items)
}

/**
  Convenience method for aligning an array of items by their top attribute.
  @param        items Array of two or more items that are to be top-aligned.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignTop(items: [AutoLayoutAttributable]) -> [Constraint] {
    return AlignItems(items, .Top)
}

/**
  Convenience method for aligning two or more items by their bottom attribute.
  @param        items Two or more items that are to be bottom-aligned.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignBottom(items: AutoLayoutAttributable...) -> [Constraint] {
    return AlignBottom(items)
}

/**
  Convenience method for aligning an array of items by their bottom attribute.
  @param        items Array of two or more items that are to be bottom-aligned.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignBottom(items: [AutoLayoutAttributable]) -> [Constraint] {
    return AlignItems(items, .Bottom)
}

/**
  Convenience method for horizontally aligning two or more items.
  @param        items Two or more items that are to be horizontally aligned.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignHorizontally(items: AutoLayoutAttributable...) -> [Constraint] {
    return AlignHorizontally(items)
}

/**
  Convenience method for horizontally aligning an array of items.
  @param        items Array of two or more items that are to be horizontally aligned.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignHorizontally(items: [AutoLayoutAttributable]) -> [Constraint] {
    return AlignItems(items, .CenterX)
}

/**
  Convenience method for vertically aligning two or more items.
  @param        items Two or more items that are to be vertically aligned.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignVertically(items: AutoLayoutAttributable...) -> [Constraint] {
    return AlignVertically(items)
}

/**
  Convenience method for vertically aligning an array of items.
  @param        items Array of two or more items that are to be vertically aligned.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignVertically(items: [AutoLayoutAttributable]) -> [Constraint] {
    return AlignItems(items, .CenterY)
}

/**
  Convenience method for horizontally and vertically aligning two or more items.
  @param        items Two or more items that are to be horizontally and vertically aligned.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignCenters(items: AutoLayoutAttributable...) -> [Constraint] {
    return AlignCenters(items)
}

/**
  Convenience method for horizontally and vertically aligning an array of items.
  @param        items Array of two or more items that are to be horizontally and vertically aligned.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignCenters(items: [AutoLayoutAttributable]) -> [Constraint] {
    var constraints = AlignItems(items, .CenterX)
    constraints += AlignItems(items, .CenterY)
    return constraints
}

/**
  Convenience method for aligning two or more items by their baseline attribute.
  @param        items Two or more items that are to be baseline-aligned.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignBaselines(items: AutoLayoutAttributable...) -> [Constraint] {
    return AlignBaselines(items)
}

/**
  Convenience method for aligning an array of items by their baseline attribute.
  @param        items Array of two or more items that are to be baseline-aligned.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignBaselines(items: [AutoLayoutAttributable]) -> [Constraint] {
    return AlignItems(items, .Baseline)
}
