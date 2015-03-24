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
        
          :index:       Index of subview to return.
          :returns:     Subview at provided index.
        */
        get {
            switch index {
            case 0 ..< Int.max:
                if index >= subviews.count {
                    return nil
                }
                else {
                    return subviews[index] as? UIView
                }

            case -1:
                return superview

            default:
                return superview?[index.successor()]
            }
        }

        /**
          Integer-indexed subview subscripting.
          When replacing a subview, there must exist a subview at the specified index.
          Otherwise, the operation is ignored.

          :param:       index When non-negative, uses the provided view to replace the subview at the specified index.  Using any negative index is treated as moving the view to a new superview.
          :param:       newView When `index` is non-negative, this view will replace any existing subview at the index.  When `index` is negative, this view will become the new superview of the current view.
        */
        set(newSuperview) {
            if index >= 0 {
                let oldView = subviews[index] as! UIView
                oldView.removeFromSuperview()

                if newSuperview != nil {
                    insertSubview(newSuperview!, atIndex: index)
                }
            }

            else {
                removeFromSuperview()
                newSuperview!.addSubview(self)
            }
        }

    }

    /**
      Searches for the first common view at or above this view and the provided view.

      :param:       view View whose hierarchy should be searched along with the current view.
      :returns:     First common ancestor of the current and provided views, if they share one.
    */
    public func firstCommonAncestor(view: UIView) -> UIView? {
        if isDescendantOfView(view) {
            return view
        }

        if view.isDescendantOfView(self) {
            return self
        }

        return superview?.firstCommonAncestor(view)
    }

}


public extension UIView {

    /**
      Much less verbose method signature for exchanging subviews.

      :param:       indexOne Index of first subview to swap.
      :param:       indexTwo Index of second subview to swap.
    */
    public func swap(indexOne: Int, _ indexTwo: Int) {
        exchangeSubviewAtIndex(indexOne, withSubviewAtIndex: indexTwo)
    }

}