//
//  UIViewSubscripting.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 6/23/14.
//  Copyright (c) 2014 Sam Odom. All rights reserved.
//

import UIKit

extension UIView {

    /**
    Integer-indexed subview subscripting.
    - parameter index: (getter) Index of subview to get.  (setter) When non-negative, uses the provided view to replace the subview at the specified index.  Using any negative index is treated as moving the view to a new superview.
    - returns: Subview at provided index (getter).
    - note: When replacing a subview, there must exist a subview at the specified index -- otherwise, the operation is ignored.
    */
    public subscript(index: Int) -> UIView? {

        get {
            switch index {
            case 0 ..< Int.max:
                if index >= subviews.count {
                    return nil
                }
                else {
                    return subviews[index]
                }

            case -1:
                return superview

            default:
                return superview?[index.successor()]
            }
        }

        set(newSuperview) {
            if index >= 0 {
                let oldView = subviews[index]
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

}


public extension UIView {

    /**
    Much less verbose method signature for exchanging subviews.
    - parameter indexOne: Index of first subview to swap.
    - parameter indexTwo: Index of second subview to swap.
    */
    public func swap(indexOne: Int, _ indexTwo: Int) {
        exchangeSubviewAtIndex(indexOne, withSubviewAtIndex: indexTwo)
    }
    
}