//
//  SpinnerStateManager.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 1/23/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import UIKit

/**
 State enumeration representing the managed state of a `UIActivityIndicatorView`.
 - `Detached`: The manager does not currently have a spinner attached to it.
 - `Stopped`: The manager has a spinner, but it is not supposed to be animated.
 - `Started(Int)`: The manager has a spinner, is supposed to be animating, and is using a client count represented by the associated integer.
 */
public enum SpinnerState {
    case detached
    case stopped
    case started(Int)
}

/**
 Class that helps manage mutliple concurrent client tasks that use a `UIActivityIndicatorView`.
 */
public final class SpinnerStateManager {

    /**
     The current state of the manager concerning attachment to a spinner and its expected animation state.
     - note: This value cannot be modified directly.  Instead, the state is managed internally through the assignment of the spinner and by start/stop events.
     */
    public fileprivate(set) var currentState = SpinnerState.detached

    /**
     The instance of `UIActivityIndicatorView` that is attached to the manager, if any.
     */
    weak public var spinner: UIActivityIndicatorView? {
        didSet {
            matchNewSpinnerState()
        }
    }

    /**
     Designated initializer for a `SpinnerStateManager`.
     - parameter spinner: An instance of `UIActivityIndicatorView` to be managed.
     - note: If a spinner is provided during initialization, the manager's state will be either `Stopped` or `Started(1)`, depending on the animation state of the spinner.
     */
    public init(_ spinner: UIActivityIndicatorView? = nil) {
        self.spinner = spinner
        matchNewSpinnerState()
    }

    /**
     Begins animating an attached spinner, if any, or increases the client count of a spinner that is already animating.
     - note: If a spinner is not attached to the manager, the start event is ignored.
     */
    public func start() {
        spinner?.startAnimating()

        switch currentState {
        case .stopped:
            currentState = .started(1)

        case .started(let clientCount):
            currentState = .started(clientCount + 1)

        case .detached:
            break
        }
    }

    /**
     Stop animating an attached spinner, if any, if it is currently animating and has a client count of 1.
     - note: If it is animating and has multiple clients, the client count is decreased by one (1) and the spinner will continue to animate.  If a spinner is not attached to the manager, the stop event is ignored.
     */
    public func stop() {
        removeClient()
    }

    private func removeClient() {
        switch currentState {
        case .started(let clients) where clients == 1:
            currentState = .stopped

        case .started(let clients):
            currentState = .started(clients - 1)

        default:
            break
        }

        stopAnimatingIfNeeded()
    }

    private func stopAnimatingIfNeeded() {
        switch currentState {
        case .started(_):
            break

        default:
            spinner?.stopAnimating()
        }
    }

    private func matchNewSpinnerState() {
        if spinner == nil {
            currentState = .detached
        }
        else if spinner!.isAnimating {
            currentState = .started(1)
        }
        else {
            currentState = .stopped
        }
    }
    
}
