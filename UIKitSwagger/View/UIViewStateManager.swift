//
//  UIViewStateManager.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 1/17/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import Foundation

public class ViewStateManager {
    typealias State: ViewState
    var currentState: State { get }
    init(initialState: State)
    func canTransitionFromState(state: Self, toState: Self) -> Bool
}
