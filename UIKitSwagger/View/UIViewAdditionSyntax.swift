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
extension UIMotionEffect: UIViewAddable { }
extension UIGestureRecognizer: UIViewAddable { }

@available(iOS 9.0, *)
extension UILayoutGuide: UIViewAddable { }

public typealias UIViewRemovable = UIViewAddable


/**
An operator used to add a subview, layout guide, motion effect or gesture recognizer to a view.
*/
public func +=(view: UIView, addable: UIViewAddable) {
    if #available(iOS 9.0, *) {
        if let guide = addable as? UILayoutGuide {
            view.addLayoutGuide(guide)
            return
        }
    }

    switch addable {
    case let subview as UIView:
        view.addSubview(subview)

    case let effect as UIMotionEffect:
        view.addMotionEffect(effect)

    case let recognizer as UIGestureRecognizer:
        view.addGestureRecognizer(recognizer)

    default:
        break
    }
}

/**
An operator used to add an array of subviews, layout guides, motion effects and gesture recognizers to a view.
- note: The order in which the items are applied is not necessarily the order in which they are provided in the array.  This is done to avoid adding modifiers for which the view is unprepared.
*/
public func +=(view: UIView, addables: [UIViewAddable]) {
    groupAddables(addables).forEach { view += $0 }
}

/**
An operator used to remove a subview, auto layout constraint, motion effect or gesture recognizer from a view.
*/
public func -=(view: UIView, removable: UIViewRemovable) {
    if #available(iOS 9.0, *) {
        if let guide = removable as? UILayoutGuide {
            view.removeLayoutGuide(guide)
            return
        }
    }

    switch removable {
    case let subview as UIView:
        if subview.superview == view {
            subview.removeFromSuperview()
        }

    case let effect as UIMotionEffect:
        view.removeMotionEffect(effect)

    case let recognizer as UIGestureRecognizer:
        view.removeGestureRecognizer(recognizer)

    default:
        break
    }
}

/**
An operator used to remove an array of subviews, layout guides, motion effects and gesture recognizers from a view.
- note: The order in which the items are removed is not necessarily the order in which they are provided in the array.  This is done to avoid leaving invalid modifiers in the view.
*/
public func -=(view: UIView, removables: [UIViewRemovable]) {
    groupRemovables(removables).forEach { view -= $0 }
}


////////////////////////////////////////////////////////////////////////////////

private func groupAddables(addables: [UIViewAddable]) -> [UIViewAddable] {
    var views = [UIViewAddable]()
    var guides = [UIViewAddable]()
    var effects = [UIViewAddable]()
    var recognizers = [UIViewAddable]()

    for addable in addables {
        if #available(iOS 9.0, *) {
            if let guide = addable as? UILayoutGuide {
                guides.append(guide)
                continue
            }
        }

        switch addable {
        case let view as UIView:
            views.append(view)

        case let effect as UIMotionEffect:
            effects.append(effect)

        case let recognizer as UIGestureRecognizer:
            recognizers.append(recognizer)

        default:
            break
        }
    }

    return views + guides + effects + recognizers
}

private func groupRemovables(removables: [UIViewRemovable]) -> [UIViewRemovable] {
    return groupAddables(removables).reverse()
}
