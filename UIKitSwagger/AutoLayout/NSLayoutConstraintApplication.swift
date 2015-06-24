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
        guard let view = viewForConstraintApplication() else { return }
        view.addConstraint(self)
    }

    /**
      Removes constraint from view to which it is applied.
    */
    public func remove() {
        guard let view = viewForConstraintApplication() else { return }
        view.removeConstraint(self)
    }

    private func viewForConstraintApplication() -> UIView? {
        guard secondItem != nil else { return firstItem as? UIView }

        if let firstView = firstItem as? UIView,
            secondView = secondItem as? UIView {
            return firstView.firstCommonAncestor(secondView)
        }

        var view: UIView!
        var layoutGuide: UILayoutSupport!

        if firstItem is UILayoutSupport {
            layoutGuide = firstItem as! UILayoutSupport
            view = secondItem as! UIView
        }
        else {
            layoutGuide = secondItem as! UILayoutSupport
            view = firstItem as! UIView
        }

        let controller = ViewControllerContainingView(view, layoutGuide: layoutGuide)
        return controller?.view
    }

}

/**
  Convenience method for applying one or more constraints to the appropriate view.

  :param:       constraints One or more NSLayoutConstraints to be applied.
*/
public func ApplyConstraints(constraints: NSLayoutConstraint...) {
    ApplyConstraints(constraints)
}

/**
  Convenience method for applying an array of constraints to the appropriate view.

  :param:       constraints Array of NSLayoutConstraints to be applied.
*/
public func ApplyConstraints(constraints: [NSLayoutConstraint]) {
    constraints.map { $0.apply() }
}


/**
  Convenience method for removing one or more constraints from where they are applied.

  :param:       constraints One or more NSLayoutConstraints to be removed.
*/
public func RemoveConstraints(constraints: NSLayoutConstraint...) {
    RemoveConstraints(constraints)
}

/**
  Convenience method for removing an array of constraints from where they are applied.

  :param:       constraints Array of NSLayoutConstraints to be removed.
*/
public func RemoveConstraints(constraints: [NSLayoutConstraint]) {
    constraints.map { $0.remove() }
}


private func ViewControllerContainingView(view: UIView, layoutGuide: UILayoutSupport) -> UIViewController? {
    guard let rootController = view.window?.rootViewController else { return nil }
    return view.isDescendantOfView(rootController.view) ? rootController : nil
}
