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

    /**
      Removes constraint from view to which it is applied.
    */
    public func remove() {
        if let view = viewForConstraintApplication() {
            view.removeConstraint(self)
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

/**
  Convenience method for applying one or more constraints to the appropriate view.
  @param            constraints One or more NSLayoutConstraints to be applied.
*/
public func ApplyConstraints(constraints: Constraint...) {
    ApplyConstraints(constraints)
}

/**
  Convenience method for applying an array of constraints to the appropriate view.
  @param            constraints Array of NSLayoutConstraints to be applied.
*/
public func ApplyConstraints(constraints: [Constraint]) {
    for constraint in constraints {
        constraint.apply()
    }
}


/**
  Convenience method for removing one or more constraints from where they are applied.
  @param            constraints One or more NSLayoutConstraints to be removed.
*/
public func RemoveConstraints(constraints: Constraint...) {
    RemoveConstraints(constraints)
}

/**
  Convenience method for removing an array of constraints from where they are applied.
  @param            constraints Array of NSLayoutConstraints to be removed.
*/
public func RemoveConstraints(constraints: [Constraint]) {
    for constraint in constraints {
        constraint.remove()
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
