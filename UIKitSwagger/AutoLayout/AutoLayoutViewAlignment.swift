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
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       items Two or more items that are to be left-aligned.
  :returns:     The constraints that were applied.
*/
public func AlignLeft(items: AutoLayoutAttributable...) -> [Constraint] {
    return AlignLeft(items)
}

/**
  Convenience method for aligning an array of items by their left attribute.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       items Array of two or more items that are to be left-aligned.
  :returns:     The constraints that were applied.
*/
public func AlignLeft(items: [AutoLayoutAttributable]) -> [Constraint] {
    return AlignItems(items, .Left)
}

/**
  Convenience method for aligning two or more items by their leading attribute.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       items Two or more items that are to be leading-aligned.
  :returns:     The constraints that were applied.
*/
public func AlignLeading(items: AutoLayoutAttributable...) -> [Constraint] {
    return AlignLeading(items)
}

/**
  Convenience method for aligning an array of items by their leading attribute.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       items Array of two or more items that are to be leading-aligned.
  :returns:     The constraints that were applied.
*/
public func AlignLeading(items: [AutoLayoutAttributable]) -> [Constraint] {
    return AlignItems(items, .Leading)
}

/**
  Convenience method for aligning two or more items by their right attribute.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       items Two or more items that are to be right-aligned.
  :returns:     The constraints that were applied.
*/
public func AlignRight(items: AutoLayoutAttributable...) -> [Constraint] {
    return AlignRight(items)
}

/**
  Convenience method for aligning an array of items by their right attribute.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       items Array of two or more items that are to be right-aligned.
  :returns:     The constraints that were applied.
*/
public func AlignRight(items: [AutoLayoutAttributable]) -> [Constraint] {
    return AlignItems(items, .Right)
}

/**
  Convenience method for aligning two or more items by their trailing attribute.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       items Two or more items that are to be trailing-aligned.
  :returns:     The constraints that were applied.
*/
public func AlignTrailing(items: AutoLayoutAttributable...) -> [Constraint] {
    return AlignTrailing(items)
}

/**
  Convenience method for aligning an array of items by their trailing attribute.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       items Array of two or more items that are to be trailing-aligned.
  :returns:     The constraints that were applied.
*/
public func AlignTrailing(items: [AutoLayoutAttributable]) -> [Constraint] {
    return AlignItems(items, .Trailing)
}

/**
  Convenience method for aligning two or more items by their top attribute.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       items Two or more items that are to be top-aligned.
  :returns:     The constraints that were applied.
*/
public func AlignTop(items: AutoLayoutAttributable...) -> [Constraint] {
    return AlignTop(items)
}

/**
  Convenience method for aligning an array of items by their top attribute.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       items Array of two or more items that are to be top-aligned.
  :returns:     The constraints that were applied.
*/
public func AlignTop(items: [AutoLayoutAttributable]) -> [Constraint] {
    return AlignItems(items, .Top)
}

/**
  Convenience method for aligning two or more items by their bottom attribute.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       items Two or more items that are to be bottom-aligned.
  :returns:     The constraints that were applied.
*/
public func AlignBottom(items: AutoLayoutAttributable...) -> [Constraint] {
    return AlignBottom(items)
}

/**
  Convenience method for aligning an array of items by their bottom attribute.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       items Array of two or more items that are to be bottom-aligned.
  :returns:     The constraints that were applied.
*/
public func AlignBottom(items: [AutoLayoutAttributable]) -> [Constraint] {
    return AlignItems(items, .Bottom)
}

/**
  Convenience method for horizontally aligning two or more items.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       items Two or more items that are to be horizontally aligned.
  :returns:     The constraints that were applied.
*/
public func AlignHorizontally(items: AutoLayoutAttributable...) -> [Constraint] {
    return AlignHorizontally(items)
}

/**
  Convenience method for horizontally aligning an array of items.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       items Array of two or more items that are to be horizontally aligned.
  :returns:     The constraints that were applied.
*/
public func AlignHorizontally(items: [AutoLayoutAttributable]) -> [Constraint] {
    return AlignItems(items, .CenterX)
}

/**
  Convenience method for vertically aligning two or more items.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       items Two or more items that are to be vertically aligned.
  :returns:     The constraints that were applied.
*/
public func AlignVertically(items: AutoLayoutAttributable...) -> [Constraint] {
    return AlignVertically(items)
}

/**
  Convenience method for vertically aligning an array of items.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       items Array of two or more items that are to be vertically aligned.
  :returns:     The constraints that were applied.
*/
public func AlignVertically(items: [AutoLayoutAttributable]) -> [Constraint] {
    return AlignItems(items, .CenterY)
}

/**
  Convenience method for horizontally and vertically aligning two or more items.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       items Two or more items that are to be horizontally and vertically aligned.
  :returns:     The constraints that were applied.
*/
public func AlignCenters(items: AutoLayoutAttributable...) -> [Constraint] {
    return AlignCenters(items)
}

/**
  Convenience method for horizontally and vertically aligning an array of items.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       items Array of two or more items that are to be horizontally and vertically aligned.
  :returns:     The constraints that were applied.
*/
public func AlignCenters(items: [AutoLayoutAttributable]) -> [Constraint] {
    var constraints = AlignItems(items, .CenterX)
    constraints += AlignItems(items, .CenterY)
    return constraints
}

/**
  Convenience method for aligning two or more items by their baseline attribute.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       items Two or more items that are to be baseline-aligned.
  :returns:     The constraints that were applied.
*/
public func AlignBaselines(items: AutoLayoutAttributable...) -> [Constraint] {
    return AlignBaselines(items)
}

/**
  Convenience method for aligning an array of items by their baseline attribute.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       items Array of two or more items that are to be baseline-aligned.
  :returns:     The constraints that were applied.
*/
public func AlignBaselines(items: [AutoLayoutAttributable]) -> [Constraint] {
    return AlignItems(items, .Baseline)
}
