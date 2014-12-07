//
//  UILabelEnabling.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/7/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

extension UILabel: UIKitEnablable {

    /**
      Convenience method to enable a label.
    */
    public func enable() {
        enabled = true
    }

    /**
      Convenience method to disable a label.
    */
    public func disable() {
        enabled = false
    }

}
