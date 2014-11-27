//
//  NSLayoutConstraintApplication.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/26/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension NSLayoutConstraint {

    /**
      Applies constraint to the appropriate view: either the first common ancestor in the view hierarchy or the root view of a view controller if a layout guide is used.
    */
    public func apply() {
        if let view = viewForConstraintApplication() {
            view.addConstraint(self)
        }
    }

    private func viewForConstraintApplication() -> UIView? {
        if secondItem == nil {
            return firstItem as? UIView
        }

        if firstItem is UILayoutSupport {
            let controller = ViewControllerContainingView(secondItem as UIView, layoutGuide: firstItem as UILayoutSupport)
            return controller?.view
        }
        else if secondItem is UILayoutSupport {
            let controller = ViewControllerContainingView(firstItem as UIView, layoutGuide: secondItem as UILayoutSupport)
            return controller?.view
        }

        let viewOne = firstItem as UIView
        let viewTwo = secondItem as UIView
        return viewOne.firstCommonAncestor(viewTwo)
    }

}

private func ViewControllerContainingView(view: UIView, #layoutGuide: UILayoutSupport) -> UIViewController? {
    let window = view.window
    if window == nil {
        return nil
    }

    let rootController = window!.rootViewController
    if rootController == nil {
        return nil
    }

    if view.isDescendantOfView(rootController!.view) {
        return rootController
    }

    return nil
}
