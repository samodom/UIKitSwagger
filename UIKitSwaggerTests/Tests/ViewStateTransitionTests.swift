//
//  ViewStateTransitionTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 1/11/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class ViewStateTransitionTests: XCTestCase {

    private let start = SampleViewState.Default
    private let end = SampleViewState.Alternate
    var closure: UIViewStateTransitionClosure!
    private var transition: UIViewStateTransition<SampleViewState>!
    var invokedClosure = false

    override func setUp() {
        super.setUp()

        closure = {
            self.invokedClosure = true
        }

        transition = UIViewStateTransition(startState: start, endState: end, animationDuration: 0.3, closure)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testTransitionHasStartState() {
        XCTAssertEqual(transition.startState, SampleViewState.Default, "The transition should have a start view state")
    }

    func testTransitionHasEndState() {
        XCTAssertEqual(transition.endState, SampleViewState.Alternate, "The transition should have an end view state")
    }

    func testTransitionHasAnimationDuration() {
        XCTAssertEqual(transition.animationDuration!, 0.3, "The transition should have an animation duration")
    }

    func testTransitionHasTransitionClosure() {
        XCTAssertFalse(invokedClosure, "The closure should not be invoked yet")
        transition.transitionClosure()
        XCTAssertTrue(invokedClosure, "The transition should have a transition closure")
    }

}

private enum SampleViewState: UIViewState {
    case Default, Alternate
}
