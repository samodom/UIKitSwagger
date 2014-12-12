//
//  UIAlertActionEnabling.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/6/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

extension UIAlertAction: UIKitEnablable {

    /**
      Convenience method to enable an alert action.
    */
    public func enable() {
        enabled = true
    }

    /**
      Convenience method to disable an alert action.
    */
    public func disable() {
        enabled = false
    }

}
