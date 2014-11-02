//
//  UIViewHierarchy.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 6/23/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import UIKit

extension UIView {

    //  Integer indexed subview subscripting
    public subscript(index: Int) -> UIView? {

        get {
            switch index {
            case 0..<Int.max:
                if index >= subviews.count {
                    return nil
                }
                else {
                    return subviews[index] as? UIView
                }

            case -1:
                return superview

            default:
                if superview != nil {
                    return superview![index.successor()]
                }
                else {
                    return nil
                }
            }
        }

        set(newSuperview) {
            //  Non-negative integer is potentially a subview
            if index >= 0 {
                let oldView = subviews[index] as UIView
                oldView.removeFromSuperview()
                if newSuperview != nil {
                    insertSubview(newSuperview!, atIndex: index)
                }
            }

            //  Any negative integer is considered the immediate superview
            else {
                removeFromSuperview()
                newSuperview!.addSubview(self)
            }
        }

    }

    //  Ancestry
    public func firstCommonAncestor(view: UIView) -> UIView? {

        if isDescendantOfView(view) {
            return view
        }

        if view.isDescendantOfView(self) {
            return self
        }

        if let parent = superview {
            return parent.firstCommonAncestor(view)
        }

        return nil
    }

}
