//
//  MainThreadUpdatesTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
@testable import UIKitSwagger

class MainThreadUpdatesTests: XCTestCase {

    var executedOnMainThread = false
    var mainThreadExpectation: XCTestExpectation!
    var executionCount = 0
    var integerArgument: Int?

    override func setUp() {
        super.setUp()

        mainThreadExpectation = expectationWithDescription("main thread execution")
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testMainThreadExecutionClosureSyntax() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) {
            XCTAssertFalse(NSThread.isMainThread(), "Making sure we aren't running on the main thread")
            !{
                self.executionCount++
                self.executedOnMainThread = NSThread.isMainThread()
                self.mainThreadExpectation.fulfill()
            }
            XCTAssertFalse(NSThread.isMainThread(), "Making sure we aren't running on the main thread")
        }

        waitForExpectationsWithTimeout(MinimumTestExpectationWaitTime) { (_) -> () in
            XCTAssertTrue(self.executedOnMainThread, "The provided closure should be executed on the main thread")
            XCTAssertEqual(self.executionCount, 1, "The function should only be executed once")
        }
    }

    private func sampleExecutableStatement() {
        executedOnMainThread = NSThread.isMainThread()
        mainThreadExpectation.fulfill()
        executionCount++
    }

    func testMainThreadExecutionFunctionSyntax() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) {
            XCTAssertFalse(NSThread.isMainThread(), "Making sure we aren't running on the main thread")
            !self.sampleExecutableStatement
            XCTAssertFalse(NSThread.isMainThread(), "Making sure we aren't running on the main thread")
        }

        waitForExpectationsWithTimeout(MinimumTestExpectationWaitTime) { (_) -> () in
            XCTAssertTrue(self.executedOnMainThread, "The provided function should be executed on the main thread")
            XCTAssertEqual(self.executionCount, 1, "The function should only be executed once")
        }
    }

    private func sampleExecutableStatement(integer: Int) {
        integerArgument = integer
        executedOnMainThread = NSThread.isMainThread()
        mainThreadExpectation.fulfill()
    }

}
