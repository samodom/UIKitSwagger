//
//  UIGestureRecognizerEnabling.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/7/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

extension UIGestureRecognizer: UIKitEnablable {

    /**
      Convenience method to enable a gesture recognizer.
    */
    public func enable() {
        enabled = true
    }

    /**
      Convenience method to disable a gesture recognizer.
    */
    public func disable() {
        enabled = false
    }

}
