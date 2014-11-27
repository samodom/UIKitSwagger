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
        return AutoLayoutAttributedItem(self, .Left)
    }

    public var leftMargin: AutoLayoutAttributedItem {
        return AutoLayoutAttributedItem(self, .LeftMargin)
    }

    public var right: AutoLayoutAttributedItem {
        return AutoLayoutAttributedItem(self, .Right)
    }

    public var rightMargin: AutoLayoutAttributedItem {
        return AutoLayoutAttributedItem(self, .RightMargin)
    }

    public var top: AutoLayoutAttributedItem {
        return AutoLayoutAttributedItem(self, .Top)
    }

    public var topMargin: AutoLayoutAttributedItem {
        return AutoLayoutAttributedItem(self, .TopMargin)
    }

    public var bottom: AutoLayoutAttributedItem {
        return AutoLayoutAttributedItem(self, .Bottom)
    }

    public var bottomMargin: AutoLayoutAttributedItem {
        return AutoLayoutAttributedItem(self, .BottomMargin)
    }

    public var leading: AutoLayoutAttributedItem {
        return AutoLayoutAttributedItem(self, .Leading)
    }

    public var leadingMargin: AutoLayoutAttributedItem {
        return AutoLayoutAttributedItem(self, .LeadingMargin)
    }

    public var trailing: AutoLayoutAttributedItem {
        return AutoLayoutAttributedItem(self, .Trailing)
    }

    public var trailingMargin: AutoLayoutAttributedItem {
        return AutoLayoutAttributedItem(self, .TrailingMargin)
    }

    public var width: AutoLayoutAttributedItem {
        return AutoLayoutAttributedItem(self, .Width)
    }

    public var height: AutoLayoutAttributedItem {
        return AutoLayoutAttributedItem(self, .Height)
    }

    public var centerX: AutoLayoutAttributedItem {
        return AutoLayoutAttributedItem(self, .CenterX)
    }

    public var centerXInMargins: AutoLayoutAttributedItem {
        return AutoLayoutAttributedItem(self, .CenterXWithinMargins)
    }

    public var centerY: AutoLayoutAttributedItem {
        return AutoLayoutAttributedItem(self, .CenterY)
    }

    public var centerYInMargins: AutoLayoutAttributedItem {
        return AutoLayoutAttributedItem(self, .CenterYWithinMargins)
    }

    public var baseline: AutoLayoutAttributedItem {
        return AutoLayoutAttributedItem(self, .Baseline)
    }

    public var firstBaseline: AutoLayoutAttributedItem {
        return AutoLayoutAttributedItem(self, .FirstBaseline)
    }

    public var nonAttribute: AutoLayoutAttributedItem {
        return AutoLayoutAttributedItem(self, .NotAnAttribute)
    }

}
