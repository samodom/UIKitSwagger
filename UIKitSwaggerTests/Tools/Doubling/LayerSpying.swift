//
//  ViewSpying.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 4/28/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import QuartzCore

internal extension CALayer {

    internal func startSpyingOnSetNeedsDisplay() {
        precondition(!CALayer.setNeedsDisplayIsSwizzled)

        CALayer.swapSetNeedsDisplayMethods()
        CALayer.setNeedsDisplayIsSwizzled = true
    }

    internal func stopSpyingOnSetNeedsDisplay() {
        precondition(CALayer.setNeedsDisplayIsSwizzled)

        CALayer.swapSetNeedsDisplayMethods()
        CALayer.setNeedsDisplayIsSwizzled = false
        CALayer.clearClassSpyValues()
        clearInstanceSpyValues()
    }

    private static func swapSetNeedsDisplayMethods() {
        MethodSwizzler.swapInstanceMethodsForClass(
            self,
            realSelector: LayerSpyingSelectors.RealSetNeedsDisplay,
            userSelector: LayerSpyingSelectors.SpySetNeedsDisplay
        )
    }

    private static var setNeedsDisplayIsSwizzled: Bool {
        get {
            let flag = associationForKey(&LayerSpyingAssociationKeys.SetNeedsDisplayIsSwizzledKey) as? Bool
            return flag ?? false
        }
        set {
            associateObject(newValue, withKey: &LayerSpyingAssociationKeys.SetNeedsDisplayIsSwizzledKey)
        }
    }

    internal func spySetNeedsDisplay() {
        setNeedsDisplayCalled = true
    }

    internal var setNeedsDisplayCalled: Bool {
        get {
            let flag = associationForKey(&LayerSpyingAssociationKeys.SetNeedsDisplayCalledKey) as? Bool
            return flag ?? false
        }
        set {
            associateObject(newValue, withKey: &LayerSpyingAssociationKeys.SetNeedsDisplayCalledKey)
        }
    }

    private func clearInstanceSpyValues() {
        dissociateKey(&LayerSpyingAssociationKeys.SetNeedsDisplayCalledKey)
    }

    private static func clearClassSpyValues() {
        dissociateKey(&LayerSpyingAssociationKeys.SetNeedsDisplayIsSwizzledKey)
    }

}


private enum LayerSpyingAssociationKeys {
    private static var SetNeedsDisplayIsSwizzledKey = "SetNeedsDisplayIsSwizzled"
    private static var SetNeedsDisplayCalledKey = "SetNeedsDisplayCalled"
}

private enum LayerSpyingSelectors {
    private static let RealSetNeedsDisplay = #selector(CALayer.setNeedsDisplay)
    private static let SpySetNeedsDisplay = #selector(CALayer.spySetNeedsDisplay)
}
