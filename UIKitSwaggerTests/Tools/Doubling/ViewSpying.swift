//
//  ViewSpying.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 4/28/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit

internal extension UIView {

    internal func startSpyingOnSetNeedsDisplay() {
        precondition(!UIView.setNeedsDisplayIsSwizzled)
        UIView.swapSetNeedsDisplayMethods()
        UIView.setNeedsDisplayIsSwizzled = true
    }

    internal func stopSpyingOnSetNeedsDisplay() {
        precondition(UIView.setNeedsDisplayIsSwizzled)
        UIView.swapSetNeedsDisplayMethods()
        UIView.setNeedsDisplayIsSwizzled = false
        UIView.clearClassSpyValues()
        clearInstanceSpyValues()
    }

    internal var setNeedsDisplayCalled: Bool {
        get {
            guard let association =
                associationForKey(&ViewSpyingAssociationKeys.SetNeedsDisplayCalledKey) as? Bool else {
                return false
            }

            return association
        }
        set {
            associateObject(newValue, withKey: &ViewSpyingAssociationKeys.SetNeedsDisplayCalledKey)
        }
    }

    private static func swapSetNeedsDisplayMethods() {
        MethodSwizzler.swapInstanceMethodsForClass(
            self,
            realSelector: ViewSpyingSelectors.RealSetNeedsDisplay,
            userSelector: ViewSpyingSelectors.SpySetNeedsDisplay
        )
    }

    private static var setNeedsDisplayIsSwizzled: Bool {
        get {
            guard let association =
                associationForKey(ViewSpyingAssociationKeys.SetNeedsDisplayIsSwizzledKey) as? Bool else {
                    return false
            }

            return association
        }
        set {
            associateObject(newValue, withKey: ViewSpyingAssociationKeys.SetNeedsDisplayIsSwizzledKey)
        }
    }

    internal func spySetNeedsDisplay() {
        setNeedsDisplayCalled = true
    }

    private func clearInstanceSpyValues() {
        dissociateKey(ViewSpyingAssociationKeys.SetNeedsDisplayCalledKey)
    }

    private static func clearClassSpyValues() {
        dissociateKey(ViewSpyingAssociationKeys.SetNeedsDisplayIsSwizzledKey)
    }

}


private enum ViewSpyingAssociationKeys {
    private static let SetNeedsDisplayIsSwizzledKey = "SetNeedsDisplayIsSwizzled"
    private static let SetNeedsDisplayCalledKey = "SetNeedsDisplayCalled"
}

private enum ViewSpyingSelectors {
    private static let RealSetNeedsDisplay = #selector(UIView.setNeedsDisplay)
    private static let SpySetNeedsDisplay = #selector(UIView.spySetNeedsDisplay)
}
