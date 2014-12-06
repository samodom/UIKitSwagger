//
//  UIViewAdditionSyntax.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/5/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public protocol UIViewAddable { }

extension UIView: UIViewAddable { }
extension Constraint: UIViewAddable { }
extension UIMotionEffect: UIViewAddable { }
extension UIGestureRecognizer: UIViewAddable { }

public typealias UIViewRemovable = UIViewAddable


/**
  An operator used to add a subview, auto layout constraint, motion effect or gesture recognizer to a view.
*/
public func +=(view: UIView, addable: UIViewAddable) {
    switch addable {
    case is UIView:
        view.addSubview(addable as UIView)

    case is Constraint:
        view.addConstraint(addable as Constraint)

    case is UIMotionEffect:
        view.addMotionEffect(addable as UIMotionEffect)

    case is UIGestureRecognizer:
        view.addGestureRecognizer(addable as UIGestureRecognizer)

    default:
        break
    }
}

/**
An operator used to remove a subview, auto layout constraint, motion effect or gesture recognizer from a view.
*/
public func -=(view: UIView, removable: UIViewRemovable) {
    switch removable {
    case is UIView:
        let subview = removable as UIView
        subview.removeFromSuperview()

    case is Constraint:
        view.removeConstraint(removable as Constraint)

    case is UIMotionEffect:
        view.removeMotionEffect(removable as UIMotionEffect)

    case is UIGestureRecognizer:
        view.removeGestureRecognizer(removable as UIGestureRecognizer)

    default:
        break
    }
}
