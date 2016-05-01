//
//  SpinnerStateManagerInternal.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 5/1/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit

internal extension SpinnerStateManager {

    internal func removeClient() {
        switch currentState {
        case .Started(let clients) where clients == 1:
            currentState = .Stopped

        case .Started(let clients):
            currentState = .Started(clients - 1)

        default:
            break
        }

        stopAnimatingIfNeeded()
    }

    private func stopAnimatingIfNeeded() {
        switch currentState {
        case .Started(_):
            break

        default:
            spinner?.stopAnimating()
        }
    }

    internal func matchNewSpinnerState() {
        if spinner == nil {
            currentState = .Detached
        }
        else if spinner!.isAnimating() {
            currentState = .Started(1)
        }
        else {
            currentState = .Stopped
        }
    }

}
