//
//  UIViewAutoLayoutAttributes.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

extension UIView: AutoLayoutAttributable {

    public var left: AutoLayoutAttributedItem {
        return (self, .Left)
    }

    public var leftMargin: AutoLayoutAttributedItem {
        return (self, .LeftMargin)
    }

    public var right: AutoLayoutAttributedItem {
        return (self, .Right)
    }

    public var rightMargin: AutoLayoutAttributedItem {
        return (self, .RightMargin)
    }

    public var top: AutoLayoutAttributedItem {
        return (self, .Top)
    }

    public var topMargin: AutoLayoutAttributedItem {
        return (self, .TopMargin)
    }

    public var bottom: AutoLayoutAttributedItem {
        return (self, .Bottom)
    }

    public var bottomMargin: AutoLayoutAttributedItem {
        return (self, .BottomMargin)
    }

    public var leading: AutoLayoutAttributedItem {
        return (self, .Leading)
    }

    public var leadingMargin: AutoLayoutAttributedItem {
        return (self, .LeadingMargin)
    }

    public var trailing: AutoLayoutAttributedItem {
        return (self, .Trailing)
    }

    public var trailingMargin: AutoLayoutAttributedItem {
        return (self, .TrailingMargin)
    }

    public var width: AutoLayoutAttributedItem {
        return (self, .Width)
    }

    public var height: AutoLayoutAttributedItem {
        return (self, .Height)
    }

    public var centerX: AutoLayoutAttributedItem {
        return (self, .CenterX)
    }

    public var centerXInMargins: AutoLayoutAttributedItem {
        return (self, .CenterXWithinMargins)
    }

    public var centerY: AutoLayoutAttributedItem {
        return (self, .CenterY)
    }

    public var centerYInMargins: AutoLayoutAttributedItem {
        return (self, .CenterYWithinMargins)
    }

    public var baseline: AutoLayoutAttributedItem {
        return (self, .Baseline)
    }

    public var firstBaseline: AutoLayoutAttributedItem {
        return (self, .FirstBaseline)
    }

    public var nonAttribute: AutoLayoutAttributedItem {
        return (self, .NotAnAttribute)
    }

    public func attributedItemForLayoutAttribute(attribute: NSLayoutAttribute) -> AutoLayoutAttributedItem {
        return (self, attribute)
    }

}
