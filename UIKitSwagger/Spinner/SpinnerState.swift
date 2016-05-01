//
//  SpinnerState.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 5/1/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit

/**
 State enumeration representing the managed state of a `UIActivityIndicatorView`.
 - `Detached`: The manager does not currently have a spinner attached to it.
 - `Stopped`: The manager has a spinner, but it is not supposed to be animated.
 - `Started(Int)`: The manager has a spinner, is supposed to be animating, and is using a client count represented by the associated integer.
 */
public enum SpinnerState {
    case Detached
    case Stopped
    case Started(Int)
}
