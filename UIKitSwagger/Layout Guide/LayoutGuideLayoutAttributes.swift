//
//  LayoutGuideLayoutAttributes.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 06/24/15.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

@available(iOS 9.0, *)
extension UILayoutGuide: AutoLayoutAttributable {

    public var left: AutoLayoutAttributedItem {
        return (self, .left)
    }

    public var leftMargin: AutoLayoutAttributedItem {
        return (self, .left)
    }

    public var right: AutoLayoutAttributedItem {
        return (self, .right)
    }

    public var rightMargin: AutoLayoutAttributedItem {
        return (self, .right)
    }

    public var top: AutoLayoutAttributedItem {
        return (self, .top)
    }

    public var topMargin: AutoLayoutAttributedItem {
        return (self, .top)
    }

    public var bottom: AutoLayoutAttributedItem {
        return (self, .bottom)
    }

    public var bottomMargin: AutoLayoutAttributedItem {
        return (self, .bottom)
    }

    public var leading: AutoLayoutAttributedItem {
        return (self, .leading)
    }

    public var leadingMargin: AutoLayoutAttributedItem {
        return (self, .leading)
    }

    public var trailing: AutoLayoutAttributedItem {
        return (self, .trailing)
    }

    public var trailingMargin: AutoLayoutAttributedItem {
        return (self, .trailing)
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
        return (self, .centerX)
    }

    public var centerY: AutoLayoutAttributedItem {
        return (self, .centerY)
    }

    public var centerYInMargins: AutoLayoutAttributedItem {
        return (self, .centerY)
    }

    public var baseline: AutoLayoutAttributedItem {
        return (self, .bottom)
    }

    public var firstBaseline: AutoLayoutAttributedItem {
        return (self, .bottom)
    }

    public var nonAttribute: AutoLayoutAttributedItem {
        return (self, .notAnAttribute)
    }

    public func attributedItemForLayoutAttribute(_ attribute: NSLayoutAttribute) -> AutoLayoutAttributedItem {
        switch attribute {
        case .leftMargin:
            return left

        case .rightMargin:
            return right

        case .topMargin:
            return top

        case .bottomMargin, .lastBaseline, .firstBaseline:
            return bottom

        case .leadingMargin:
            return leading

        case .trailingMargin:
            return trailing

        case .centerXWithinMargins:
            return centerX
            
        case .centerYWithinMargins:
            return centerY
            
        default:
            return (self, attribute)
        }
    }
}
