//
//  ViewDistributionTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/27/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class ViewDistributionTests: XCTestCase {

    var controller: UIViewController!
    var superview: UIView!
    let button = UIButton()
    let slider = UISlider()
    let toggle = UISwitch()

    override func setUp() {
        super.setUp()

        let window = UIApplication.sharedApplication().delegate!.window!
        controller = window!.rootViewController
        controller.loadView()
        superview = controller.view
        superview.addSubview(button)
        superview.addSubview(slider)
        superview.addSubview(toggle)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    //  MARK: Left-to-right distribution

    func testLeftToRightDistributionOfListWithoutSpacing() {
        DistributeLeftToRight(button, slider, toggle)
        let constraints = superview.constraints() as [Constraint]
        var expected = slider.left =* button.right
        XCTAssertTrue(contains(constraints, expected), "The slider should be pinned to the right side of the button")
        expected = toggle.left =* slider.right
        XCTAssertTrue(contains(constraints, expected), "The toggle should be pinned to the right side of the slider")
    }

    func testLeftToRightDistributionOfListWithSpacing() {
        DistributeLeftToRight(spacing: 14, button, slider, toggle)
        let constraints = superview.constraints() as [Constraint]
        var expected = slider.left =* button.right + 14
        XCTAssertTrue(contains(constraints, expected), "The slider should be 14 pt to the right of the button")
        expected = toggle.left =* slider.right + 14
        XCTAssertTrue(contains(constraints, expected), "The toggle should be 14 pt to the right of the slider")
    }

    func testLeftToRightDistributionOfArrayWithoutSpacing() {
        DistributeLeftToRight([button, slider, toggle])
        let constraints = superview.constraints() as [Constraint]
        var expected = slider.left =* button.right
        XCTAssertTrue(contains(constraints, expected), "The slider should be pinned to the right side of the button")
        expected = toggle.left =* slider.right
        XCTAssertTrue(contains(constraints, expected), "The toggle should be pinned to the right side of the slider")
    }

    func testLeftToRightDistributionOfArrayWithSpacing() {
        DistributeLeftToRight(spacing: 14, [button, slider, toggle])
        let constraints = superview.constraints() as [Constraint]
        var expected = slider.left =* button.right + 14
        XCTAssertTrue(contains(constraints, expected), "The slider should be 14 pt to the right of the button")
        expected = toggle.left =* slider.right + 14
        XCTAssertTrue(contains(constraints, expected), "The toggle should be 14 pt to the right of the slider")
    }

    //  MARK: Leading-to-trailing distribution

    func testLeadingToTrailingDistributionOfListWithoutSpacing() {
        DistributeLeadingToTrailing(button, slider, toggle)
        let constraints = superview.constraints() as [Constraint]
        var expected = slider.leading =* button.trailing
        XCTAssertTrue(contains(constraints, expected), "The slider should be pinned to the right side of the button")
        expected = toggle.leading =* slider.trailing
        XCTAssertTrue(contains(constraints, expected), "The toggle should be pinned to the right side of the slider")
    }

    func testLeadingToTrailingDistributionOfListWithSpacing() {
        DistributeLeadingToTrailing(spacing: 14, button, slider, toggle)
        let constraints = superview.constraints() as [Constraint]
        var expected = slider.leading =* button.trailing + 14
        XCTAssertTrue(contains(constraints, expected), "The slider should be 14 pt from the trailing side of the button")
        expected = toggle.leading =* slider.trailing + 14
        XCTAssertTrue(contains(constraints, expected), "The toggle should be 14 pt from the trailing side of the slider")
    }

    func testLeadingToTrailingDistributionOfArrayWithoutSpacing() {
        DistributeLeadingToTrailing([button, slider, toggle])
        let constraints = superview.constraints() as [Constraint]
        var expected = slider.leading =* button.trailing
        XCTAssertTrue(contains(constraints, expected), "The slider should be pinned to the right side of the button")
        expected = toggle.leading =* slider.trailing
        XCTAssertTrue(contains(constraints, expected), "The toggle should be pinned to the right side of the slider")
    }

    func testLeadingToTrailingDistributionOfArrayWithSpacing() {
        DistributeLeadingToTrailing(spacing: 14, [button, slider, toggle])
        let constraints = superview.constraints() as [Constraint]
        var expected = slider.leading =* button.trailing + 14
        XCTAssertTrue(contains(constraints, expected), "The slider should be 14 pt to the trailing side of the button")
        expected = toggle.leading =* slider.trailing + 14
        XCTAssertTrue(contains(constraints, expected), "The toggle should be 14 pt to the trailing side of the slider")
    }

    //  MARK: Top-to-bottom distribution

    func testTopToBottomDistributionOfListWithoutSpacing() {
        DistributeTopToBottom(button, slider, toggle)
        let constraints = superview.constraints() as [Constraint]
        var expected = slider.top =* button.bottom
        XCTAssertTrue(contains(constraints, expected), "The slider should be pinned to the bottom side of the button")
        expected = toggle.top =* slider.bottom
        XCTAssertTrue(contains(constraints, expected), "The toggle should be pinned to the bottom side of the slider")
    }

    func testTopToBottomDistributionOfListWithSpacing() {
        DistributeTopToBottom(spacing: 14, button, slider, toggle)
        let constraints = superview.constraints() as [Constraint]
        var expected = slider.top =* button.bottom + 14
        XCTAssertTrue(contains(constraints, expected), "The slider should be 14 pt underneath the button")
        expected = toggle.top =* slider.bottom + 14
        XCTAssertTrue(contains(constraints, expected), "The toggle should be 14 pt underneath the slider")
    }

    func testTopToBottomDistributionOfArrayWithoutSpacing() {
        DistributeTopToBottom([button, slider, toggle])
        let constraints = superview.constraints() as [Constraint]
        var expected = slider.top =* button.bottom
        XCTAssertTrue(contains(constraints, expected), "The slider should be pinned to the bottom side of the button")
        expected = toggle.top =* slider.bottom
        XCTAssertTrue(contains(constraints, expected), "The toggle should be pinned to the bottom side of the slider")
    }

    func testTopToBottomDistributionOfArrayWithSpacing() {
        DistributeTopToBottom(spacing: 14, [button, slider, toggle])
        let constraints = superview.constraints() as [Constraint]
        var expected = slider.top =* button.bottom + 14
        XCTAssertTrue(contains(constraints, expected), "The slider should be 14 pt underneath the button")
        expected = toggle.top =* slider.bottom + 14
        XCTAssertTrue(contains(constraints, expected), "The toggle should be 14 pt underneath the slider")
    }

}
