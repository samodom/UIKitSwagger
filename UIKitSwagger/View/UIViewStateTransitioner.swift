//
//  UIViewStateTransitioner.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 1/13/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import UIKit

public class UIViewStateTransitioner<S: UIViewState> {

    private var transitions = [UIViewStateTransition<S>]()

    public var animationDuration: NSTimeInterval = 0.0 {
        willSet(newDuration) {
            assert(newDuration >= 0.0, "The animation duration must be non-negative")
        }
    }

    public func hasTransitionFromState(startState: S, toState endState: S) -> Bool {
        for transition in transitions {
            if transition.startState == startState && transition.endState == endState {
                return true
            }
        }

        return false
    }

    public func addTransition(transition: UIViewStateTransition<S>) {
        transitions.append(transition)
    }

    public func removeTransitionForStartState(startState: S, endState: S) {
        for transition in transitions {
            if transition.startState == startState && transition.endState == endState {

            }
        }
    }

    private func transitionForStartState(startState: S, endState: S) -> UIViewAnimationTransition? {
        for transition in transitions {
            if transition.startState == startState && transition.endState == endState {
                return transition
            }
        }

        return nil
    }

}
