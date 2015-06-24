//
//  UIKitEnablable.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/7/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import Foundation

public protocol UIKitEnablable {
    var enabled: Bool { get set }
    mutating func enable()
    mutating func disable()
}

public extension UIKitEnablable {
    public mutating func enable() { enabled = true }
    public mutating func disable() { enabled = false }
}
