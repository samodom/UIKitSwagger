//
//  SpinnerStateManagerTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 1/23/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class SpinnerStateManagerTests: XCTestCase {

    var spinnerManager = SpinnerStateManager()
    var spinner: UIActivityIndicatorView! = UIActivityIndicatorView()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testManagerDoesNotHaveSpinnerByDefault() {
        XCTAssertNil(spinnerManager.spinner, "The manager should not have a spinner by default")
        switch spinnerManager.currentState {
        case .Detached:
            break

        default:
            XCTFail("The manager should be in the detached state by default")
        }
    }

    func testSettingStoppedSpinner() {
        spinnerManager.spinner = spinner
        XCTAssertEqual(spinnerManager.spinner!, spinner, "The manager should have a weak reference to an activity indicator view")
        switch spinnerManager.currentState {
        case .Stopped:
            break

        default:
            XCTFail("The manager should be in the stopped state after adding a stopped spinner")
        }
    }

    func testSettingStartedSpinner() {
        spinner.startAnimating()
        assert(spinner.isAnimating(), "Just checking that it is really spinning")
        spinnerManager.spinner = spinner
        switch spinnerManager.currentState {
        case .Started(let count):
            XCTAssertEqual(count, 1, "The manager should indicate that it is started but assumes a single client")

        default:
            XCTFail("The manager should be in the started state after adding a started spinner")
        }
    }

    func testCreatingManagerWithStoppedSpinner() {
        spinnerManager = SpinnerStateManager(spinner)
        XCTAssertEqual(spinnerManager.spinner!, spinner, "The manager should be created with a weak reference to the activity indicator view")
        switch spinnerManager.currentState {
        case .Stopped:
            break

        default:
            XCTFail("The manager should be in the stopped state after being created with a stopped spinner")
        }
    }

    func testCreatingManagerWithStartedSpinner() {
        spinner.startAnimating()
        spinnerManager = SpinnerStateManager(spinner)
        assert(spinner.isAnimating(), "Just checking that it is really spinning")
        switch spinnerManager.currentState {
        case .Started(let count):
            XCTAssertEqual(count, 1, "The manager should indicate that it is started but assumes a single client")

        default:
            XCTFail("The manager should be in the started state after being created with a started spinner")
        }
    }

    func testRemovingSpinner() {
        spinnerManager = SpinnerStateManager(spinner)
        spinnerManager.spinner = nil
        XCTAssertNil(spinnerManager.spinner, "Just checking it actually gets nilled")
        switch spinnerManager.currentState {
        case .Detached:
            break

        default:
            XCTFail("The manager should change to the detached state when the spinner is removed")
        }
    }

    func testStartingDetachedSpinner() {
        spinnerManager.start()
        switch spinnerManager.currentState {
        case .Detached:
            break

        default:
            XCTFail("The manager should still be in the detached state without a spinner")
        }
    }

    func testStartingStoppedSpinner() {
        spinnerManager.spinner = spinner
        spinnerManager.start()
        XCTAssertTrue(spinner.isAnimating(), "The spinner should now be animating")
        switch spinnerManager.currentState {
        case .Started(let clients):
            XCTAssertEqual(clients, 1, "The number of clients should be set when starting a stopped spinner")

        default:
            XCTFail("The manager should now be in the started state with a single client")
        }
    }

    func testIncreasingClientCount() {
        spinnerManager.spinner = spinner
        spinnerManager.start()
        spinnerManager.start()
        XCTAssertTrue(spinner.isAnimating(), "The spinner should still be animating")
        switch spinnerManager.currentState {
        case .Started(let clients):
            XCTAssertEqual(clients, 2, "The number of clients should be increased when starting a started spinner")

        default:
            XCTFail("The manager should now be in the started state with two clients")
        }

    }

    func testStoppingStartedSpinner() {
        spinnerManager.spinner = spinner
        spinnerManager.start()
        spinnerManager.stop()
        XCTAssertFalse(spinner.isAnimating(), "The spinner should no longer be animating")
        switch spinnerManager.currentState {
        case .Stopped:
            break

        default:
            XCTFail("The manager should now be in the stopped state")
        }
    }

    func testStoppingStartedSpinnerWithMultipleClients() {
        spinnerManager.spinner = spinner
        spinnerManager.start()
        spinnerManager.start()
        spinnerManager.stop()
        XCTAssertTrue(spinner.isAnimating(), "The spinner should still be animating")
        switch spinnerManager.currentState {
        case .Started(let clients):
            XCTAssertEqual(clients, 1, "The client count should be decreased")

        default:
            XCTFail("The manager should still be in the started state with a single client")
        }

        spinnerManager.stop()
        XCTAssertFalse(spinner.isAnimating(), "The spinner should no longer be animating")
        switch spinnerManager.currentState {
        case .Stopped:
            break

        default:
            XCTFail("The manager should now be stopped")
        }
    }

    func testStoppingStoppedSpinner() {
        spinnerManager.spinner = spinner
        spinnerManager.stop()
        XCTAssertFalse(spinner.isAnimating(), "The spinner should still not be animating")
        switch spinnerManager.currentState {
        case .Stopped:
            break

        default:
            XCTFail("The manager should still be in the stopped state")
        }
    }

    func testStoppingDetachedSpinner() {
        spinnerManager.stop()
        switch spinnerManager.currentState {
        case .Detached:
            break

        default:
            XCTFail("The manager should still be in the detached state")
        }
    }
    
}
