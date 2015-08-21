//
//  ViewUtilities.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/1/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
Utility function for hiding one or more views.
- parameter views: One or more views to hide.
- warning: This method does not explicitly use the main thread.
*/
public func HideViews(views: UIView...) {
    HideViews(views)
}

/**
Utility function for hiding an array of views.
- parameter views: An array of views to hide.
- warning: This method does not explicitly use the main thread.
*/
public func HideViews(views: [UIView]) {
    views.forEach { $0.hidden = true }
}

/**
Utility function for showing one or more views.
- parameter views: One or more views to show.
- warning: This method does not explicitly use the main thread.
*/
public func ShowViews(views: UIView...) {
    ShowViews(views)
}

/**
Utility function for showing an array of views.
- parameter views: An array of views to show.
- warning: This method does not explicitly use the main thread.
*/
public func ShowViews(views: [UIView]) {
    views.forEach { $0.hidden = false }
}

/**
Utility function for turning off autoresizing-mask-to-constraint translation for one or more views.
- parameter views: One or more views on which to turn off translation.
*/
public func DoNotTranslateMasks(views: UIView...) {
    DoNotTranslateMasks(views)
}

/**
Utility function for turning off autoresizing-mask-to-constraint translation for an array of views.
- parameter views: An array of views on which to turn off translation.
*/
public func DoNotTranslateMasks(views: [UIView]) {
    views.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
}
