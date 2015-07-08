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
    var left: AutoLayoutAttributedItem { get }
    var right: AutoLayoutAttributedItem { get }
    var top: AutoLayoutAttributedItem { get }
    var bottom: AutoLayoutAttributedItem { get }
    var leading: AutoLayoutAttributedItem { get }
    var trailing: AutoLayoutAttributedItem { get }
    var width: AutoLayoutAttributedItem { get }
    var height: AutoLayoutAttributedItem { get }
    var centerX: AutoLayoutAttributedItem { get }
    var centerY: AutoLayoutAttributedItem { get }
    var baseline: AutoLayoutAttributedItem { get }
    var firstBaseline: AutoLayoutAttributedItem { get }
    var leftMargin: AutoLayoutAttributedItem { get }
    var rightMargin: AutoLayoutAttributedItem { get }
    var topMargin: AutoLayoutAttributedItem { get }
    var bottomMargin: AutoLayoutAttributedItem { get }
    var leadingMargin: AutoLayoutAttributedItem { get }
    var trailingMargin: AutoLayoutAttributedItem { get }
    var centerXInMargins: AutoLayoutAttributedItem { get }
    var centerYInMargins: AutoLayoutAttributedItem { get }
    var nonAttribute: AutoLayoutAttributedItem { get }

    func attributedItemForLayoutAttribute(attribute: NSLayoutAttribute) -> AutoLayoutAttributedItem
}
