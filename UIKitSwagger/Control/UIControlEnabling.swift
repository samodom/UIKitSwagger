//
//  UIBarItemEnabling.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/7/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

extension UIControl: UIKitEnablable {

    /**
      Convenience method to enable a control.
    */
    public func enable() {
        enabled = true
    }

    /**
      Convenience method to disable a control.
    */
    public func disable() {
        enabled = false
    }

}
