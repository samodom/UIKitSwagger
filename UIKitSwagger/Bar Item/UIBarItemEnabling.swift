//
//  UIBarItemEnabling.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/7/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

extension UIBarItem: UIKitEnablable {

    /**
      Convenience method to enable a bar item.
    */
    public func enable() {
        enabled = true
    }

    /**
      Convenience method to disable a bar item.
    */
    public func disable() {
        enabled = false
    }

}
