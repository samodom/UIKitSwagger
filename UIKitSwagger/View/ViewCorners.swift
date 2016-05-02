//
//  ViewCorners.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 5/2/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import Foundation

public struct ViewCorners: OptionSetType {

    public let rawValue: UInt

    public init(rawValue: UInt) {
        precondition(rawValue <= 15)

        self.rawValue = rawValue
    }

    public static let TopLeft = ViewCorners(rawValue: 1)
    public static let TopRight = ViewCorners(rawValue: 2)
    public static let BottomLeft = ViewCorners(rawValue: 4)
    public static let BottomRight = ViewCorners(rawValue: 8)

    public static let Top: ViewCorners = [.TopLeft, .TopRight]
    public static let Bottom: ViewCorners = [.BottomLeft, .BottomRight]
    public static let Left: ViewCorners = [.TopLeft, .BottomLeft]
    public static let Right: ViewCorners = [.TopRight, .BottomRight]

    public static let None: ViewCorners = []
    public static let All: ViewCorners = [.TopLeft, .TopRight, .BottomLeft, .BottomRight]

}
