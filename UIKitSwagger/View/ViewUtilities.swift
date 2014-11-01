//
//  ViewUtilities.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/1/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public func HideViews(views: UIView...) {
    HideViews(views)
}

public func HideViews(views: [UIView]) {
    for view in views {
        view.hidden = true
    }
}

public func ShowViews(views: UIView...) {
    ShowViews(views)
}

public func ShowViews(views: [UIView]) {
    for view in views {
        view.hidden = false
    }
}
