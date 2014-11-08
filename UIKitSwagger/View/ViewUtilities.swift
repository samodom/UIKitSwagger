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
  @param        views One or more views to hide.
  @discussion   This method does not explicitly use the main thread.
*/
public func HideViews(views: UIView...) {
    HideViews(views)
}

/**
  Utility function for hiding an array of views.
  @param        views An array of views to hide.
  @discussion   This method does not explicitly use the main thread.
*/
public func HideViews(views: [UIView]) {
    for view in views {
        view.hidden = true
    }
}

/**
  Utility function for showing one or more views.
  @param        views One or more views to show.
  @discussion   This method does not explicitly use the main thread.
*/
public func ShowViews(views: UIView...) {
    ShowViews(views)
}

/**
  Utility function for showing an array of views.
  @param        views An array of views to show.
  @discussion   This method does not explicitly use the main thread.
*/
public func ShowViews(views: [UIView]) {
    for view in views {
        view.hidden = false
    }
}
