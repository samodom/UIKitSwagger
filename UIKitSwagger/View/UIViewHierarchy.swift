//
//  UIViewHierarchy.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 6/23/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import UIKit

extension UIView {

    public subscript(index: Int) -> UIView? {

        /**
          Integer-indexed subview subscripting.
          @return       Subview at provided index.
        */
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

        /**
          Integer-indexed subview subscripting.
          @param        index When non-negative, uses the provided view to replace the subview at the specified index.  Using any negative index is treated as moving the view to a new superview.
          @param        newView When `index` is non-negative, this view will replace any existing subview at the index.  When `index` is negative, this view will become the new superview of the current view.
          @discussion   When replacing a subview, there must exist a subview at the specified index.  Otherwise, the operation is ignored.
        */
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

    /**
      Searches for the first common view at or above this view and the provided view.
      @param        view View whose hierarchy should be searched along with the current view.
      @return       First common ancestor of the current and provided views, if they share one.
    */
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
