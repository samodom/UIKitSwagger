//
//  ViewAlignment.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/27/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
 Convenience method for aligning two or more items by their left attribute.
 - Parameter items: Two or more items that are to be left-aligned.
 - Returns: The constraints that were created and activated.
 - Note: The layout constraints created by this function are automatically activated.
 - Warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignLeft(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return AlignLeft(items)
}

/**
 Convenience method for aligning an array of items by their left attribute.
 - Parameter items: Array of two or more items that are to be left-aligned.
 - Returns: The constraints that were created and activated.
 - Note: The layout constraints created by this function are automatically activated.
 - Warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignLeft(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return AlignItems(items, attribute: .Left)
}

/**
 Convenience method for aligning two or more items by their leading attribute.
 - Parameter items: Two or more items that are to be leading-aligned.
 - Returns: The constraints that were created and activated.
 - Note: The layout constraints created by this function are automatically activated.
 - Warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignLeading(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return AlignLeading(items)
}

/**
 Convenience method for aligning an array of items by their leading attribute.
 - Parameter items: Array of two or more items that are to be leading-aligned.
 - Returns: The constraints that were created and activated.
 - Note: The layout constraints created by this function are automatically activated.
 - Warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignLeading(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return AlignItems(items, attribute: .Leading)
}

/**
 Convenience method for aligning two or more items by their right attribute.
 - Parameter items: Two or more items that are to be right-aligned.
 - Returns: The constraints that were created and activated.
 - Note: The layout constraints created by this function are automatically activated.
 - Warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignRight(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return AlignRight(items)
}

/**
 Convenience method for aligning an array of items by their right attribute.
 - Parameter items: Array of two or more items that are to be right-aligned.
 - Returns: The constraints that were created and activated.
 - Note: The layout constraints created by this function are automatically activated.
 - Warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignRight(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return AlignItems(items, attribute: .Right)
}

/**
 Convenience method for aligning two or more items by their trailing attribute.
 - Parameter items: Two or more items that are to be trailing-aligned.
 - Returns: The constraints that were created and activated.
 - Note: The layout constraints created by this function are automatically activated.
 - Warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignTrailing(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return AlignTrailing(items)
}

/**
 Convenience method for aligning an array of items by their trailing attribute.
 - Parameter items: Array of two or more items that are to be trailing-aligned.
 - Returns: The constraints that were created and activated.
 - Note: The layout constraints created by this function are automatically activated.
 - Warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignTrailing(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return AlignItems(items, attribute: .Trailing)
}

/**
 Convenience method for aligning two or more items by their top attribute.
 - Parameter items: Two or more items that are to be top-aligned.
 - Returns: The constraints that were created and activated.
 - Note: The layout constraints created by this function are automatically activated.
 - Warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignTop(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return AlignTop(items)
}

/**
 Convenience method for aligning an array of items by their top attribute.
 - Parameter items: Array of two or more items that are to be top-aligned.
 - Returns: The constraints that were created and activated.
 - Note: The layout constraints created by this function are automatically activated.
 - Warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignTop(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return AlignItems(items, attribute: .Top)
}

/**
 Convenience method for aligning two or more items by their bottom attribute.
 - Parameter items: Two or more items that are to be bottom-aligned.
 - Returns: The constraints that were created and activated.
 - Note: The layout constraints created by this function are automatically activated.
 - Warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignBottom(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return AlignBottom(items)
}

/**
 Convenience method for aligning an array of items by their bottom attribute.
 - Parameter items: Array of two or more items that are to be bottom-aligned.
 - Returns: The constraints that were created and activated.
 - Note: The layout constraints created by this function are automatically activated.
 - Warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignBottom(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return AlignItems(items, attribute: .Bottom)
}

/**
 Convenience method for horizontally aligning two or more items.
 - Parameter items: Two or more items that are to be horizontally aligned.
 - Returns: The constraints that were created and activated.
 - Note: The layout constraints created by this function are automatically activated.
 - Warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignHorizontally(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return AlignHorizontally(items)
}

/**
 Convenience method for horizontally aligning an array of items.
 - Parameter items: Array of two or more items that are to be horizontally aligned.
 - Returns: The constraints that were created and activated.
 - Note: The layout constraints created by this function are automatically activated.
 - Warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignHorizontally(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return AlignItems(items, attribute: .CenterX)
}

/**
 Convenience method for vertically aligning two or more items.
 - Parameter items: Two or more items that are to be vertically aligned.
 - Returns: The constraints that were created and activated.
 - Note: The layout constraints created by this function are automatically activated.
 - Warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignVertically(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return AlignVertically(items)
}

/**
 Convenience method for vertically aligning an array of items.
 - Parameter items: Array of two or more items that are to be vertically aligned.
 - Returns: The constraints that were created and activated.
 - Note: The layout constraints created by this function are automatically activated.
 - Warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignVertically(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return AlignItems(items, attribute: .CenterY)
}

/**
 Convenience method for horizontally and vertically aligning two or more items.
 - Parameter items: Two or more items that are to be horizontally and vertically aligned.
 - Returns: The constraints that were created and activated.
 - Note: The layout constraints created by this function are automatically activated.
 - Warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignCenters(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return AlignCenters(items)
}

/**
 Convenience method for horizontally and vertically aligning an array of items.
 - Parameter items: Array of two or more items that are to be horizontally and vertically aligned.
 - Returns: The constraints that were created and activated.
 - Note: The layout constraints created by this function are automatically activated.
 - Warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignCenters(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return AlignItems(items, attribute: .CenterX) + AlignItems(items, attribute: .CenterY)
}

/**
 Convenience method for aligning two or more items by their baseline attribute.
 - Parameter items: Two or more items that are to be baseline-aligned.
 - Returns: The constraints that were created and activated.
 - Note: The layout constraints created by this function are automatically activated.
 - Warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignBaselines(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return AlignBaselines(items)
}

/**
 Convenience method for aligning an array of items by their baseline attribute.
 - Parameter items: Array of two or more items that are to be baseline-aligned.
 - Returns: The constraints that were created and activated.
 - Note: The layout constraints created by this function are automatically activated.
 - Warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignBaselines(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return AlignItems(items, attribute: .Baseline)
}
