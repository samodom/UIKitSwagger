//
//  ViewLayoutAttributes.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

extension UIView: AutoLayoutAttributable {

    public var left: AutoLayoutAttributedItem {
        return (self, .left)
    }

    public var leftMargin: AutoLayoutAttributedItem {
        return (self, .leftMargin)
    }

    public var right: AutoLayoutAttributedItem {
        return (self, .right)
    }

    public var rightMargin: AutoLayoutAttributedItem {
        return (self, .rightMargin)
    }

    public var top: AutoLayoutAttributedItem {
        return (self, .top)
    }

    public var topMargin: AutoLayoutAttributedItem {
        return (self, .topMargin)
    }

    public var bottom: AutoLayoutAttributedItem {
        return (self, .bottom)
    }

    public var bottomMargin: AutoLayoutAttributedItem {
        return (self, .bottomMargin)
    }

    public var leading: AutoLayoutAttributedItem {
        return (self, .leading)
    }

    public var leadingMargin: AutoLayoutAttributedItem {
        return (self, .leadingMargin)
    }

    public var trailing: AutoLayoutAttributedItem {
        return (self, .trailing)
    }

    public var trailingMargin: AutoLayoutAttributedItem {
        return (self, .trailingMargin)
    }

    public var width: AutoLayoutAttributedItem {
        return (self, .width)
    }

    public var height: AutoLayoutAttributedItem {
        return (self, .height)
    }

    public var centerX: AutoLayoutAttributedItem {
        return (self, .centerX)
    }

    public var centerXInMargins: AutoLayoutAttributedItem {
        return (self, .centerXWithinMargins)
    }

    public var centerY: AutoLayoutAttributedItem {
        return (self, .centerY)
    }

    public var centerYInMargins: AutoLayoutAttributedItem {
        return (self, .centerYWithinMargins)
    }

    public var baseline: AutoLayoutAttributedItem {
        return (self, .lastBaseline)
    }

    public var firstBaseline: AutoLayoutAttributedItem {
        return (self, .firstBaseline)
    }

    public var nonAttribute: AutoLayoutAttributedItem {
        return (self, .notAnAttribute)
    }

    public func attributedItemForLayoutAttribute(_ attribute: NSLayoutAttribute) -> AutoLayoutAttributedItem {
        return (self, attribute)
    }

}
