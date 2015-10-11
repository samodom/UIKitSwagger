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

    case Leading, Trailing
    case Left, Right
    case Top, Bottom

    internal var layoutAxis: UILayoutConstraintAxis {
        switch self {
        case .Top, .Bottom:
            return .Vertical

        default:
            return .Horizontal
        }
    }

}
