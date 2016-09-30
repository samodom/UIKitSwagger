//
//  MainThreadUpdatesTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import UIKitSwagger

class MainThreadUpdatesTests: XCTestCase {

    var executedOnMainThread = false
    var mainThreadExpectation: XCTestExpectation!
    var executionCount = 0
    var integerArgument: Int?

    override func setUp() {
        super.setUp()

        mainThreadExpectation = expectation(description: "Main thread execution completed")
    }

    func testMainThreadExecutionClosureSyntax() {
        BackgroundQueue.async {
            assert(!Thread.isMainThread)

            !{
                self.executionCount += 1
                self.executedOnMainThread = Thread.isMainThread
                self.mainThreadExpectation.fulfill()
            }

            assert(!Thread.isMainThread)
        }

        waitForExpectations(timeout: MaximumTestExpectationWaitTime) { _ in
            XCTAssertTrue(self.executedOnMainThread, "The provided closure should be executed on the main thread")
            XCTAssertEqual(self.executionCount, 1, "The function should only be executed once")
        }
    }

    fileprivate func sampleExecutableStatement() {
        executedOnMainThread = Thread.isMainThread
        mainThreadExpectation.fulfill()
        executionCount += 1
    }

    func testMainThreadExecutionFunctionSyntax() {
        BackgroundQueue.async {
            assert(!Thread.isMainThread)

            !self.sampleExecutableStatement

            assert(!Thread.isMainThread)
        }

        waitForExpectations(timeout: MaximumTestExpectationWaitTime) {  _ in
            XCTAssertTrue(self.executedOnMainThread, "The provided function should be executed on the main thread")
            XCTAssertEqual(self.executionCount, 1, "The function should only be executed once")
        }
    }

    fileprivate func sampleExecutableStatement(_ integer: Int) {
        integerArgument = integer
        executedOnMainThread = Thread.isMainThread
        mainThreadExpectation.fulfill()
    }

}
