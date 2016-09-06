//
//  ViewStateTransitionerTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 1/12/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class ViewStateTransitionerTests: XCTestCase {

    private var transitioner = UIViewStateTransitioner<SampleViewState>()
    private var transitionOne: UIViewStateTransition<SampleViewState>!
    private var transitionTwo: UIViewStateTransition<SampleViewState>!
    private var transitionThree: UIViewStateTransition<SampleViewState>!
    var closureOne: UIViewStateTransitionClosure!
    var closureTwo: UIViewStateTransitionClosure!
    var closureThree: UIViewStateTransitionClosure!
    var closureOneInvoked = false
    var closureTwoInvoked = false
    var closureThreeInvoked = false
    var hasTransition = false

    override func setUp() {
        super.setUp()

        closureOne = {
            self.closureOneInvoked = true
        }

        closureTwo = {
            self.closureTwoInvoked = true
        }

        closureThree = {
            self.closureThreeInvoked = true
        }

        transitionOne = UIViewStateTransition(startState: .Default, endState: .Alternate1, animationDuration: 0.5, closureOne)
        transitionTwo = UIViewStateTransition(startState: .Default, endState: .Alternate1, animationDuration: 0.2, closureTwo)
        transitionThree = UIViewStateTransition(startState: .Default, endState: .Alternate2, animationDuration: 0.3, closureThree)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testTransitionerHasAnimationDuration() {
        XCTAssertEqual(transitioner.animationDuration, 0.0, "The animation duration should be zero by default")
        transitioner.animationDuration = 0.3
        XCTAssertEqual(transitioner.animationDuration, 0.3, "The animation duration should be configurable")
    }

    func testTransitionerHasNoTransitions() {
        hasTransition = transitioner.hasTransitionFromState(.Default, toState: .Alternate1)
        XCTAssertFalse(hasTransition, "The transitioner should not have any transitions by default")
        hasTransition = transitioner.hasTransitionFromState(.Default, toState: .Alternate2)
        XCTAssertFalse(hasTransition, "The transitioner should not have any transitions by default")
        hasTransition = transitioner.hasTransitionFromState(.Alternate1, toState: .Default)
        XCTAssertFalse(hasTransition, "The transitioner should not have any transitions by default")
        hasTransition = transitioner.hasTransitionFromState(.Alternate1, toState: .Alternate2)
        XCTAssertFalse(hasTransition, "The transitioner should not have any transitions by default")
        hasTransition = transitioner.hasTransitionFromState(.Alternate2, toState: .Default)
        XCTAssertFalse(hasTransition, "The transitioner should not have any transitions by default")
        hasTransition = transitioner.hasTransitionFromState(.Alternate2, toState: .Alternate1)
        XCTAssertFalse(hasTransition, "The transitioner should not have any transitions by default")
    }

    func testCanAddTransition() {
        transitioner.addTransition(transitionOne)
        hasTransition = transitioner.hasTransitionFromState(.Default, toState: .Alternate1)
        XCTAssertTrue(hasTransition, "The transitioner should now have a transition between these states")
    }

    func testCanRemoveTransition() {
        transitioner.addTransition(transitionOne)
        transitioner.removeTransitionForStartState(.Default, endState: .Alternate1)
        hasTransition = transitioner.hasTransitionFromState(.Default, toState: .Alternate1)
        XCTAssertFalse(hasTransition, "The transitioner should no longer have a transition between these states")
    }

}

private enum SampleViewState: UIViewState {
    case Default, Alternate1, Alternate2
}
