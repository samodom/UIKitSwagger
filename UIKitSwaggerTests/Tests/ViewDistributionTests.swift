//
//  ViewDistributionTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/27/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest
import UIKitSwagger

class ViewDistributionTests: XCTestCase {

    var controller: UIViewController!
    var superview: UIView!
    let button = UIButton()
    let slider = UISlider()
    let toggle = UISwitch()
    var returnedConstraints: [NSLayoutConstraint]!

    override func setUp() {
        super.setUp()

        let window = UIApplication.sharedApplication().delegate!.window!
        controller = window!.rootViewController
        superview = controller.view
        superview.addSubview(button)
        superview.addSubview(slider)
        superview.addSubview(toggle)
    }
    
    override func tearDown() {
        button.removeFromSuperview()
        slider.removeFromSuperview()
        toggle.removeFromSuperview()
        superview.clearConstraints()
        
        super.tearDown()
    }

    //  MARK: Left-to-right distribution

    func testLeftToRightDistributionOfListWithoutSpacing() {
        returnedConstraints = DistributeLeftToRight(button, slider, toggle)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        var expected = slider.left =* button.right
        XCTAssertTrue(superview.constraints.contains(expected), "The slider should be pinned to the right side of the button")
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
        expected = toggle.left =* slider.right
        XCTAssertTrue(superview.constraints.contains(expected), "The toggle should be pinned to the right side of the slider")
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
    }

    func testLeftToRightDistributionOfListWithSpacing() {
        returnedConstraints = DistributeLeftToRight(spacing: 14, views: button, slider, toggle)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        var expected = slider.left =* button.right + 14
        XCTAssertTrue(superview.constraints.contains(expected), "The slider should be 14 pt to the right of the button")
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
        expected = toggle.left =* slider.right + 14
        XCTAssertTrue(superview.constraints.contains(expected), "The toggle should be 14 pt to the right of the slider")
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
    }

    func testLeftToRightDistributionOfArrayWithoutSpacing() {
        returnedConstraints = DistributeLeftToRight([button, slider, toggle])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        var expected = slider.left =* button.right
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
        XCTAssertTrue(superview.constraints.contains(expected), "The slider should be pinned to the right side of the button")
        expected = toggle.left =* slider.right
        XCTAssertTrue(superview.constraints.contains(expected), "The toggle should be pinned to the right side of the slider")
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
    }

    func testLeftToRightDistributionOfArrayWithSpacing() {
        returnedConstraints = DistributeLeftToRight(spacing: 14, views: [button, slider, toggle])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        var expected = slider.left =* button.right + 14
        XCTAssertTrue(superview.constraints.contains(expected), "The slider should be 14 pt to the right of the button")
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
        expected = toggle.left =* slider.right + 14
        XCTAssertTrue(superview.constraints.contains(expected), "The toggle should be 14 pt to the right of the slider")
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
    }

    //  MARK: Leading-to-trailing distribution

    func testLeadingToTrailingDistributionOfListWithoutSpacing() {
        returnedConstraints = DistributeLeadingToTrailing(button, slider, toggle)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        var expected = slider.leading =* button.trailing
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
        XCTAssertTrue(superview.constraints.contains(expected), "The slider should be pinned to the right side of the button")
        expected = toggle.leading =* slider.trailing
        XCTAssertTrue(superview.constraints.contains(expected), "The toggle should be pinned to the right side of the slider")
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
    }

    func testLeadingToTrailingDistributionOfListWithSpacing() {
        returnedConstraints = DistributeLeadingToTrailing(spacing: 14, views: button, slider, toggle)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        var expected = slider.leading =* button.trailing + 14
        XCTAssertTrue(superview.constraints.contains(expected), "The slider should be 14 pt from the trailing side of the button")
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
        expected = toggle.leading =* slider.trailing + 14
        XCTAssertTrue(superview.constraints.contains(expected), "The toggle should be 14 pt from the trailing side of the slider")
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
    }

    func testLeadingToTrailingDistributionOfArrayWithoutSpacing() {
        returnedConstraints = DistributeLeadingToTrailing([button, slider, toggle])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        var expected = slider.leading =* button.trailing
        XCTAssertTrue(superview.constraints.contains(expected), "The slider should be pinned to the right side of the button")
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
        expected = toggle.leading =* slider.trailing
        XCTAssertTrue(superview.constraints.contains(expected), "The toggle should be pinned to the right side of the slider")
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
    }

    func testLeadingToTrailingDistributionOfArrayWithSpacing() {
        returnedConstraints = DistributeLeadingToTrailing(spacing: 14, views: [button, slider, toggle])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        var expected = slider.leading =* button.trailing + 14
        XCTAssertTrue(superview.constraints.contains(expected), "The slider should be 14 pt to the trailing side of the button")
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
        expected = toggle.leading =* slider.trailing + 14
        XCTAssertTrue(superview.constraints.contains(expected), "The toggle should be 14 pt to the trailing side of the slider")
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
    }

    //  MARK: Top-to-bottom distribution

    func testTopToBottomDistributionOfListWithoutSpacing() {
        returnedConstraints = DistributeTopToBottom(button, slider, toggle)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        var expected = slider.top =* button.bottom
        XCTAssertTrue(superview.constraints.contains(expected), "The slider should be pinned to the bottom side of the button")
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
        expected = toggle.top =* slider.bottom
        XCTAssertTrue(superview.constraints.contains(expected), "The toggle should be pinned to the bottom side of the slider")
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
    }

    func testTopToBottomDistributionOfListWithSpacing() {
        returnedConstraints = DistributeTopToBottom(spacing: 14, views: button, slider, toggle)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        var expected = slider.top =* button.bottom + 14
        XCTAssertTrue(superview.constraints.contains(expected), "The slider should be 14 pt underneath the button")
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
        expected = toggle.top =* slider.bottom + 14
        XCTAssertTrue(superview.constraints.contains(expected), "The toggle should be 14 pt underneath the slider")
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
    }

    func testTopToBottomDistributionOfArrayWithoutSpacing() {
        returnedConstraints = DistributeTopToBottom([button, slider, toggle])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        var expected = slider.top =* button.bottom
        XCTAssertTrue(superview.constraints.contains(expected), "The slider should be pinned to the bottom side of the button")
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
        expected = toggle.top =* slider.bottom
        XCTAssertTrue(superview.constraints.contains(expected), "The toggle should be pinned to the bottom side of the slider")
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
    }

    func testTopToBottomDistributionOfArrayWithSpacing() {
        returnedConstraints = DistributeTopToBottom(spacing: 14, views: [button, slider, toggle])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        var expected = slider.top =* button.bottom + 14
        XCTAssertTrue(superview.constraints.contains(expected), "The slider should be 14 pt underneath the button")
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
        expected = toggle.top =* slider.bottom + 14
        XCTAssertTrue(superview.constraints.contains(expected), "The toggle should be 14 pt underneath the slider")
        XCTAssertTrue(returnedConstraints.contains(expected), "The applied constraint should be returned to the caller")
    }

}
