//
//  MethodSwizzler.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 4/28/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import Foundation

internal class MethodSwizzler {

    internal class func swapInstanceMethodsForClass(`class`: AnyClass, realSelector: Selector, userSelector: Selector) {
        let realMethod = class_getInstanceMethod(`class`, realSelector)
        let userMethod = class_getInstanceMethod(`class`, userSelector)
        method_exchangeImplementations(realMethod, userMethod)
    }

    internal class func swapClassMethodsForClass(`class`: AnyClass, realSelector: Selector, userSelector: Selector) {
        let realMethod = class_getClassMethod(`class`, realSelector)
        let userMethod = class_getClassMethod(`class`, userSelector)
        method_exchangeImplementations(realMethod, userMethod)
    }

}
