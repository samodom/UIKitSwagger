//
//  LayoutEdge.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 10/10/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import UIKit

/**
 Enumerated type for specifying a horizontal or vertical edge used with Auto Layout.
 */
public enum LayoutEdge {

    case leading, trailing
    case left, right
    case top, bottom

    internal var layoutAxis: UILayoutConstraintAxis {
        switch self {
        case .top, .bottom:
            return .vertical

        default:
            return .horizontal
        }
    }

    internal func getLayoutAttribute(usingMargins useMargins: Bool) -> NSLayoutAttribute {
        switch self {
        case .left:
            return useMargins ? .leftMargin : .left

        case .right:
            return useMargins ? .rightMargin : .right

        case .leading:
            return useMargins ? .leadingMargin : .leading

        case .trailing:
            return useMargins ? .trailingMargin : .trailing

        case .top:
            return useMargins ? .topMargin : .top

        case .bottom:
            return useMargins ? .bottomMargin : .bottom
        }
    }

}
