//
//  LayoutEdgeInternal.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 4/30/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import Foundation

internal extension LayoutEdge {

    internal var layoutAxis: UILayoutConstraintAxis {
        switch self {
        case .Top, .Bottom:
            return .Vertical

        default:
            return .Horizontal
        }
    }

    internal func getLayoutAttribute(usingMargins useMargins: Bool) -> NSLayoutAttribute {
        switch self {
        case .Left:
            return useMargins ? .LeftMargin : .Left

        case .Right:
            return useMargins ? .RightMargin : .Right

        case .Leading:
            return useMargins ? .LeadingMargin : .Leading

        case .Trailing:
            return useMargins ? .TrailingMargin : .Trailing

        case .Top:
            return useMargins ? .TopMargin : .Top
            
        case .Bottom:
            return useMargins ? .BottomMargin : .Bottom
        }
    }
    
}
