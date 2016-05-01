//
//  SpinnerStateManager.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 1/23/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import UIKit

/**
 Class that helps manage mutliple concurrent client tasks that use a `UIActivityIndicatorView`.
 */
public class SpinnerStateManager {

    /**
     The current state of the manager concerning attachment to a spinner and its expected animation state.
     - Note: This value cannot be modified directly.  Instead, the state is managed internally through the assignment of the spinner and by start/stop events.
     */
    public internal(set) var currentState = SpinnerState.Detached

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
     - Parameter spinner: An instance of `UIActivityIndicatorView` to be managed.
     - Note: If a spinner is provided during initialization, the manager's state will be either `Stopped` or `Started(1)`, depending on the animation state of the spinner.
     */
    public init(_ spinner: UIActivityIndicatorView? = nil) {
        self.spinner = spinner
        matchNewSpinnerState()
    }

    /**
     Begins animating an attached spinner, if any, or increases the client count of a spinner that is already animating.
     - Note: If a spinner is not attached to the manager, the start event is ignored.
     */
    public func start() {
        spinner?.startAnimating()

        switch currentState {
        case .Stopped:
            currentState = .Started(1)

        case .Started(let clientCount):
            currentState = .Started(clientCount + 1)

        case .Detached:
            break
        }
    }

    /**
     Stop animating an attached spinner, if any, if it is currently animating and has a client count of 1.
     - Note: If it is animating and has multiple clients, the client count is decreased by one (1) and the spinner will continue to animate.  If a spinner is not attached to the manager, the stop event is ignored.
     */
    public func stop() {
        removeClient()
    }

}
