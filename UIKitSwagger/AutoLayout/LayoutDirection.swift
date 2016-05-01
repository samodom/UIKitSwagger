//
//  LayoutDirection.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 7/10/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import UIKit

/**
 Enumerated integer type for layout directions in both possible orders.
 */
public enum LayoutDirection: Int {

    /// Represents the direction from left-to-right
    case LeftToRight = 1

    /// Represents the direction from right-to-left
    case RightToLeft = -1

    /// Represents the direction from leading-to-trailing
    case LeadingToTrailing = 2

    /// Represents the direction from trailing-to-leading
    case TrailingToLeading = -2

    /// Represents the direction from top-to-bottom
    case TopToBottom = 3

    /// Represents the direction from bottom-to-top
    case BottomToTop = -3

}
