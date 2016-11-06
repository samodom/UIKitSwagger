//
//  ViewDistribution.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

//  MARK: Left-to-right distribution

/// Convenience method for horizontally distributing two or more items without any spacing.
/// - parameter items: Two or more items that are to be horizontally distributed.
/// - returns: The constraints that were created and activated.
/// - note: The constraints that are created use the left and right side attributes of the items.  The layout constraints created by this function are automatically activated.
/// - warning: If fewer than two items are provided, an error is thrown.
public func DistributeLeftToRight(items: UIView...)  -> [NSLayoutConstraint] {
    return DistributeLeftToRight(items: items)
}


/// Convenience method for horizontally distributing an array of items without any spacing.
/// - parameter items: An array of two or more items that are to be horizontally distributed.
/// - returns: The constraints that were created and activated.
/// - note: The constraints that are created use the left and right side attributes of the items.  The layout constraints created by this function are automatically activated.
/// - warning: If fewer than two items are provided, an error is thrown.
public func DistributeLeftToRight(items: [UIView])  -> [NSLayoutConstraint] {
    return DistributeLeftToRight(spacing: 0, items: items)
}


/// Convenience method for horizontally distributing two or more items with constant spacing.
/// - parameter items: Two or more items that are to be horizontally distributed.
/// - parameter spacing: Constant to use for spacing between the items.
/// - returns: The constraints that were created and activated.
/// - note: The constraints that are created use the left and right side attributes of the items.  The layout constraints created by this function are automatically activated.
/// - warning: If fewer than two items are provided, an error is thrown.
public func DistributeLeftToRight(spacing: CGFloat, items: UIView...)  -> [NSLayoutConstraint] {
    return DistributeLeftToRight(spacing: spacing, items: items)
}


/// Convenience method for horizontally distributing an array of items with constant spacing.
/// - parameter items: An array of two or more items that are to be horizontally distributed.
/// - parameter spacing: Constant to use for spacing between the items.
/// - returns: The constraints that were created and activated.
/// - note: The constraints that are created use the left and right side attributes of the items.  The layout constraints created by this function are automatically activated.
/// - warning: If fewer than two items are provided, an error is thrown.
public func DistributeLeftToRight(spacing: CGFloat, items: [UIView])  -> [NSLayoutConstraint] {
    return DistributeItems(items: items, spacing: spacing, direction: .leftToRight)
}


//  MARK: Leading-to-trailing distribution

/// Convenience method for horizontally distributing two or more items without any spacing.
/// - parameter items: Two or more items that are to be horizontally distributed.
/// - returns: The constraints that were created and activated.
/// - note: The constraints that are created use the leading and trailing attributes of the items.  The layout constraints created by this function are automatically activated.
/// - warning: If fewer than two items are provided, an error is thrown.
public func DistributeLeadingToTrailing(items: UIView...)  -> [NSLayoutConstraint] {
    return DistributeLeadingToTrailing(items: items)
}


/// Convenience method for horizontally distributing an array of items without any spacing.
/// - parameter items: An array of two or more items that are to be horizontally distributed.
/// - returns: The constraints that were created and activated.
/// - note: The constraints that are created use the leading and trailing attributes of the items.  The layout constraints created by this function are automatically activated.
/// - warning: If fewer than two items are provided, an error is thrown.
public func DistributeLeadingToTrailing(items: [UIView])  -> [NSLayoutConstraint] {
    return DistributeLeadingToTrailing(spacing: 0, items: items)
}


/// Convenience method for horizontally distributing two or more items with constant spacing.
/// - parameter items: Two or more items that are to be horizontally distributed.
/// - parameter spacing: Constant to use for spacing between the items.
/// - returns: The constraints that were created and activated.
/// - note: The constraints that are created use the leading and trailing attributes of the items.  The layout constraints created by this function are automatically activated.
/// - warning: If fewer than two items are provided, an error is thrown.
public func DistributeLeadingToTrailing(spacing: CGFloat, items: UIView...)  -> [NSLayoutConstraint] {
    return DistributeLeadingToTrailing(spacing: spacing, items: items)
}


/// Convenience method for horizontally distributing an array of items with constant spacing.
/// - parameter items: An array of two or more items that are to be horizontally distributed.
/// - parameter spacing: Constant to use for spacing between the items.
/// - returns: The constraints that were created and activated.
/// - note: The constraints that are created use the leading and trailing attributes of the items.  The layout constraints created by this function are automatically activated.
/// - warning: If fewer than two items are provided, an error is thrown.
public func DistributeLeadingToTrailing(spacing: CGFloat, items: [UIView])  -> [NSLayoutConstraint] {
    return DistributeItems(items: items, spacing: spacing, direction: .leadingToTrailing)
}


//  MARK: Top-to-bottom distribution

/// Convenience method for vertically distributing two or more items without any spacing.
/// - parameter items: Two or more items that are to be vertically distributed.
/// - returns: The constraints that were created and activated.
/// - note: The constraints that are created use the top and bottom side attributes of the items.  The layout constraints created by this function are automatically activated.
/// - warning: If fewer than two items are provided, an error is thrown.
public func DistributeTopToBottom(items: UIView...)  -> [NSLayoutConstraint] {
    return DistributeTopToBottom(items: items)
}


/// Convenience method for vertically distributing an array of items without any spacing.
/// - parameter items: An array of two or more items that are to be vertically distributed.
/// - returns: The constraints that were created and activated.
/// - note: The constraints that are created use the top and bottom side attributes of the items.  The layout constraints created by this function are automatically activated.
/// - warning: If fewer than two items are provided, an error is thrown.
public func DistributeTopToBottom(items: [UIView])  -> [NSLayoutConstraint] {
    return DistributeTopToBottom(spacing: 0, items: items)
}

/// Convenience method for vertically distributing two or more items with constant spacing.
/// - parameter items: Two or more items that are to be vertically distributed.
/// - parameter spacing: Constant to use for spacing between the items.
/// - returns: The constraints that were created and activated.
/// - note: The constraints that are created use the top and bottom side attributes of the items.  The layout constraints created by this function are automatically activated.
/// - warning: If fewer than two items are provided, an error is thrown.
public func DistributeTopToBottom(spacing: CGFloat, items: UIView...)  -> [NSLayoutConstraint] {
    return DistributeTopToBottom(spacing: spacing, items: items)
}


/// Convenience method for vertically distributing an array of items with constant spacing.
/// - parameter items: An array of two or more items that are to be vertically distributed.
/// - parameter spacing: Constant to use for spacing between the items.
/// - returns: The constraints that were created and activated.
/// - note: The constraints that are created use the top and bottom side attributes of the items.  The layout constraints created by this function are automatically activated.
/// - warning: If fewer than two items are provided, an error is thrown.
public func DistributeTopToBottom(spacing: CGFloat, items: [UIView])  -> [NSLayoutConstraint] {
    return DistributeItems(items: items, spacing: spacing, direction: .topToBottom)
}
