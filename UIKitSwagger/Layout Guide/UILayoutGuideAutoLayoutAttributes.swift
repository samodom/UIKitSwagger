//
//  UILayoutGuideAutoLayoutAttributes.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 06/24/15.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

@available(iOS 9.0, *)
extension UILayoutGuide: AutoLayoutAttributable {

    public var left: AutoLayoutAttributedItem {
        return (self, .Left)
    }

    public var leftMargin: AutoLayoutAttributedItem {
        return (self, .Left)
    }

    public var right: AutoLayoutAttributedItem {
        return (self, .Right)
    }

    public var rightMargin: AutoLayoutAttributedItem {
        return (self, .Right)
    }

    public var top: AutoLayoutAttributedItem {
        return (self, .Top)
    }

    public var topMargin: AutoLayoutAttributedItem {
        return (self, .Top)
    }

    public var bottom: AutoLayoutAttributedItem {
        return (self, .Bottom)
    }

    public var bottomMargin: AutoLayoutAttributedItem {
        return (self, .Bottom)
    }

    public var leading: AutoLayoutAttributedItem {
        return (self, .Leading)
    }

    public var leadingMargin: AutoLayoutAttributedItem {
        return (self, .Leading)
    }

    public var trailing: AutoLayoutAttributedItem {
        return (self, .Trailing)
    }

    public var trailingMargin: AutoLayoutAttributedItem {
        return (self, .Trailing)
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
        return (self, .CenterX)
    }

    public var centerY: AutoLayoutAttributedItem {
        return (self, .CenterY)
    }

    public var centerYInMargins: AutoLayoutAttributedItem {
        return (self, .CenterY)
    }

    public var baseline: AutoLayoutAttributedItem {
        return (self, .Bottom)
    }

    public var firstBaseline: AutoLayoutAttributedItem {
        return (self, .Bottom)
    }

    public var nonAttribute: AutoLayoutAttributedItem {
        return (self, .NotAnAttribute)
    }

    public func attributedItemForLayoutAttribute(attribute: NSLayoutAttribute) -> AutoLayoutAttributedItem {
        switch attribute {
        case .LeftMargin:
            return left

        case .RightMargin:
            return right

        case .TopMargin:
            return top

        case .BottomMargin, .Baseline, .FirstBaseline:
            return bottom

        case .LeadingMargin:
            return leading

        case .TrailingMargin:
            return trailing

        case .CenterXWithinMargins:
            return centerX

        case .CenterYWithinMargins:
            return centerY

        default:
            return (self, attribute)
        }
    }
}
