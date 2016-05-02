//
//  ColorComponents.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
 Protocol that unifies the various types of component sets used to identify and compose a color.
 - Note: Any user-defined component types will not enjoy the luxury of having the convenience initializer on `UIColor` produce component-based colors using their type (unless added by the user).
 */
public protocol ColorComponents {

    /**
     Provides an instance of `UIColor` representing these color components.
     */
    func color() -> UIColor

}
