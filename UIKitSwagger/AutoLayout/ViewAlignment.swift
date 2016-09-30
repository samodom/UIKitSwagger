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
 - parameter items: Two or more items that are to be left-aligned.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignLeft(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return AlignLeft(items: items)
}

/**
 Convenience method for aligning an array of items by their left attribute.
 - parameter items: Array of two or more items that are to be left-aligned.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignLeft(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return AlignItems(items: items, attribute: .left)
}

/**
 Convenience method for aligning two or more items by their leading attribute.
 - parameter items: Two or more items that are to be leading-aligned.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignLeading(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return AlignLeading(items: items)
}

/**
 Convenience method for aligning an array of items by their leading attribute.
 - parameter items: Array of two or more items that are to be leading-aligned.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignLeading(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return AlignItems(items: items, attribute: .leading)
}

/**
 Convenience method for aligning two or more items by their right attribute.
 - parameter items: Two or more items that are to be right-aligned.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignRight(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return AlignRight(items: items)
}

/**
 Convenience method for aligning an array of items by their right attribute.
 - parameter items: Array of two or more items that are to be right-aligned.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignRight(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return AlignItems(items: items, attribute: .right)
}

/**
 Convenience method for aligning two or more items by their trailing attribute.
 - parameter items: Two or more items that are to be trailing-aligned.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignTrailing(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return AlignTrailing(items: items)
}

/**
 Convenience method for aligning an array of items by their trailing attribute.
 - parameter items: Array of two or more items that are to be trailing-aligned.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignTrailing(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return AlignItems(items: items, attribute: .trailing)
}

/**
 Convenience method for aligning two or more items by their top attribute.
 - parameter items: Two or more items that are to be top-aligned.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignTop(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return AlignTop(items: items)
}

/**
 Convenience method for aligning an array of items by their top attribute.
 - parameter items: Array of two or more items that are to be top-aligned.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignTop(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return AlignItems(items: items, attribute: .top)
}

/**
 Convenience method for aligning two or more items by their bottom attribute.
 - parameter items: Two or more items that are to be bottom-aligned.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignBottom(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return AlignBottom(items: items)
}

/**
 Convenience method for aligning an array of items by their bottom attribute.
 - parameter items: Array of two or more items that are to be bottom-aligned.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignBottom(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return AlignItems(items: items, attribute: .bottom)
}

/**
 Convenience method for horizontally aligning two or more items.
 - parameter items: Two or more items that are to be horizontally aligned.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignHorizontally(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return AlignHorizontally(items: items)
}

/**
 Convenience method for horizontally aligning an array of items.
 - parameter items: Array of two or more items that are to be horizontally aligned.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignHorizontally(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return AlignItems(items: items, attribute: .centerX)
}

/**
 Convenience method for vertically aligning two or more items.
 - parameter items: Two or more items that are to be vertically aligned.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignVertically(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return AlignVertically(items: items)
}

/**
 Convenience method for vertically aligning an array of items.
 - parameter items: Array of two or more items that are to be vertically aligned.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignVertically(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return AlignItems(items: items, attribute: .centerY)
}

/**
 Convenience method for horizontally and vertically aligning two or more items.
 - parameter items: Two or more items that are to be horizontally and vertically aligned.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignCenters(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return AlignCenters(items: items)
}

/**
 Convenience method for horizontally and vertically aligning an array of items.
 - parameter items: Array of two or more items that are to be horizontally and vertically aligned.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignCenters(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return AlignItems(items: items, attribute: .centerX) + AlignItems(items: items, attribute: .centerY)
}

/**
 Convenience method for aligning two or more items by their baseline attribute.
 - parameter items: Two or more items that are to be baseline-aligned.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignBaselines(items: AutoLayoutAttributable...) -> [NSLayoutConstraint] {
    return AlignBaselines(items: items)
}

/**
 Convenience method for aligning an array of items by their baseline attribute.
 - parameter items: Array of two or more items that are to be baseline-aligned.
 - returns: The constraints that were created and activated.
 - note: The layout constraints created by this function are automatically activated.
 - warning: If fewer than two items are provided, an error is thrown.
 */
public func AlignBaselines(items: [AutoLayoutAttributable]) -> [NSLayoutConstraint] {
    return AlignItems(items: items, attribute: .lastBaseline)
}
