//
//  AutoLayoutAttributable.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
 Interface for creating item/attribute pairs when using the constraint builder syntax.
*/
public protocol AutoLayoutAttributable {
    /// Represents the left edge of an attributable object
    var left: AutoLayoutAttributedItem { get }

    /// Represents the right edge of an attributable object
    var right: AutoLayoutAttributedItem { get }

    /// Represents the top edge of an attributable object
    var top: AutoLayoutAttributedItem { get }

    /// Represents the bottom edge of an attributable object
    var bottom: AutoLayoutAttributedItem { get }

    /// Represents the leading edge of an attributable object
    var leading: AutoLayoutAttributedItem { get }

    /// Represents the trailing edge of an attributable object
    var trailing: AutoLayoutAttributedItem { get }

    /// Represents the width of an attributable object
    var width: AutoLayoutAttributedItem { get }

    /// Represents the height of an attributable object
    var height: AutoLayoutAttributedItem { get }

    /// Represents the horizontal center of an attributable object
    var centerX: AutoLayoutAttributedItem { get }

    /// Represents the vertical center of an attributable object
    var centerY: AutoLayoutAttributedItem { get }

    /// Represents the baseline of an attributable object
    var baseline: AutoLayoutAttributedItem { get }

    /// Represents the first baseline of an attributable object
    var firstBaseline: AutoLayoutAttributedItem { get }

    /// Represents the left margin of an attributable object
    var leftMargin: AutoLayoutAttributedItem { get }

    /// Represents the right margin of an attributable object
    var rightMargin: AutoLayoutAttributedItem { get }

    /// Represents the top margin of an attributable object
    var topMargin: AutoLayoutAttributedItem { get }

    /// Represents the bottom margin of an attributable object
    var bottomMargin: AutoLayoutAttributedItem { get }

    /// Represents the leading margin of an attributable object
    var leadingMargin: AutoLayoutAttributedItem { get }

    /// Represents the trailing margin of an attributable object
    var trailingMargin: AutoLayoutAttributedItem { get }

    /// Represents the horizontal center within the margins of an attributable object
    var centerXInMargins: AutoLayoutAttributedItem { get }

    /// Represents the vertical center within the margins of an attributable object
    var centerYInMargins: AutoLayoutAttributedItem { get }

    /// Represents a non-attribute of an attributable object
    var nonAttribute: AutoLayoutAttributedItem { get }

    /**
     Provides the attributed item corresponding to the provided attribute.
     - Parameter attribute: The attribute corresponding to the attributed item requested.
     - Returns: Attributed item corresponding to the provided attribute.
     */
    func attributedItemForLayoutAttribute(attribute: NSLayoutAttribute) -> AutoLayoutAttributedItem
}
