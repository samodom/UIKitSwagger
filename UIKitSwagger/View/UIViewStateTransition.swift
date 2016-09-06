//
//  UIViewStateTransition.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 1/11/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import UIKit

public typealias UIViewStateTransitionClosure = () -> ()

public struct UIViewStateTransition<S: UIViewState> {
    public var startState: S
    public var endState: S
    public var animationDuration: NSTimeInterval?
    public var transitionClosure: UIViewStateTransitionClosure

    public init(startState start: S, endState end: S, animationDuration duration: NSTimeInterval?, _ transitionClosure: UIViewStateTransitionClosure) {
        startState = start
        endState = end
        animationDuration = duration
        self.transitionClosure = transitionClosure
    }
    
}
