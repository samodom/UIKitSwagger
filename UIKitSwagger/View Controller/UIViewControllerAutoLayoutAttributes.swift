//
//  UIViewControllerAutoLayoutAttributes.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

extension UIViewController: AutoLayoutAttributable {

    public var left: AutoLayoutAttributedItem {
        return view.left
    }

    public var leftMargin: AutoLayoutAttributedItem {
        return view.leftMargin
    }

    public var right: AutoLayoutAttributedItem {
        return view.right
    }

    public var rightMargin: AutoLayoutAttributedItem {
        return view.rightMargin
    }

    public var top: AutoLayoutAttributedItem {
        return (topLayoutGuide, .Bottom)
    }

    public var topMargin: AutoLayoutAttributedItem {
        return view.topMargin
    }

    public var bottom: AutoLayoutAttributedItem {
        return (bottomLayoutGuide, .Top)
    }

    public var bottomMargin: AutoLayoutAttributedItem {
        return view.bottomMargin
    }

    public var leading: AutoLayoutAttributedItem {
        return view.leading
    }

    public var leadingMargin: AutoLayoutAttributedItem {
        return view.leadingMargin
    }

    public var trailing: AutoLayoutAttributedItem {
        return view.trailing
    }

    public var trailingMargin: AutoLayoutAttributedItem {
        return view.trailingMargin
    }

    public var width: AutoLayoutAttributedItem {
        return view.width
    }

    public var height: AutoLayoutAttributedItem {
        return view.height
    }

    public var centerX: AutoLayoutAttributedItem {
        return view.centerX
    }

    public var centerXInMargins: AutoLayoutAttributedItem {
        return view.centerXInMargins
    }

    public var centerY: AutoLayoutAttributedItem {
        return view.centerY
    }

    public var centerYInMargins: AutoLayoutAttributedItem {
        return view.centerYInMargins
    }

    public var baseline: AutoLayoutAttributedItem {
        return view.baseline
    }

    public var firstBaseline: AutoLayoutAttributedItem {
        return view.firstBaseline
    }

    public var nonAttribute: AutoLayoutAttributedItem {
        return view.nonAttribute
    }

    public func attributedItemForLayoutAttribute(attribute: NSLayoutAttribute) -> AutoLayoutAttributedItem {
        switch attribute {
        case .Top:
            return (topLayoutGuide, .Bottom)

        case .Bottom:
            return (bottomLayoutGuide, .Top)

        default:
            return (view, attribute)
        }
    }

}
