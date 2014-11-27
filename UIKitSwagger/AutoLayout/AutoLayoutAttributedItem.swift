//
//  AutoLayoutAttributedItem.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
  Simple structure representing an Auto Layout item (view or view controller) and an NSLayoutAttribute.  This is a convenience type for the constraint builder syntax.
*/
public struct AutoLayoutAttributedItem {

    public unowned var item: AnyObject
    public var attribute: NSLayoutAttribute

    public init(_ item: AnyObject, _ attribute: NSLayoutAttribute) {
        self.item = item
        self.attribute = attribute
    }

}
