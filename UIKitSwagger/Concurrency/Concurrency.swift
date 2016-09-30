//
//  Concurrency.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import Foundation

/**
 The prefix bang (!) operator provides a shortcut to executing code on the main thread.
 This is particularly useful for code that may run in the background that needs to update the UI in realtime.
 */
public prefix func !(closure: @escaping () -> Void) {
    DispatchQueue.main.async {
        closure()
    }
}
