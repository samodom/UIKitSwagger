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
    var appliedConstraints: [Constraint]!
    var returnedConstraints: [Constraint]!

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
        returnedConstraints = DistributeLeftToRight(button, slider, toggle)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = superview.constraints() as! [Constraint]
        var expected = slider.left =* button.right
        XCTAssertTrue(contains(appliedConstraints, expected), "The slider should be pinned to the right side of the button")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = toggle.left =* slider.right
        XCTAssertTrue(contains(appliedConstraints, expected), "The toggle should be pinned to the right side of the slider")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testLeftToRightDistributionOfListWithSpacing() {
        returnedConstraints = DistributeLeftToRight(spacing: 14, button, slider, toggle)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = superview.constraints() as! [Constraint]
        var expected = slider.left =* button.right + 14
        XCTAssertTrue(contains(appliedConstraints, expected), "The slider should be 14 pt to the right of the button")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = toggle.left =* slider.right + 14
        XCTAssertTrue(contains(appliedConstraints, expected), "The toggle should be 14 pt to the right of the slider")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testLeftToRightDistributionOfArrayWithoutSpacing() {
        returnedConstraints = DistributeLeftToRight([button, slider, toggle])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = superview.constraints() as! [Constraint]
        var expected = slider.left =* button.right
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        XCTAssertTrue(contains(appliedConstraints, expected), "The slider should be pinned to the right side of the button")
        expected = toggle.left =* slider.right
        XCTAssertTrue(contains(appliedConstraints, expected), "The toggle should be pinned to the right side of the slider")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testLeftToRightDistributionOfArrayWithSpacing() {
        returnedConstraints = DistributeLeftToRight(spacing: 14, [button, slider, toggle])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = superview.constraints() as! [Constraint]
        var expected = slider.left =* button.right + 14
        XCTAssertTrue(contains(appliedConstraints, expected), "The slider should be 14 pt to the right of the button")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = toggle.left =* slider.right + 14
        XCTAssertTrue(contains(appliedConstraints, expected), "The toggle should be 14 pt to the right of the slider")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    //  MARK: Leading-to-trailing distribution

    func testLeadingToTrailingDistributionOfListWithoutSpacing() {
        returnedConstraints = DistributeLeadingToTrailing(button, slider, toggle)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = superview.constraints() as! [Constraint]
        var expected = slider.leading =* button.trailing
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        XCTAssertTrue(contains(appliedConstraints, expected), "The slider should be pinned to the right side of the button")
        expected = toggle.leading =* slider.trailing
        XCTAssertTrue(contains(appliedConstraints, expected), "The toggle should be pinned to the right side of the slider")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testLeadingToTrailingDistributionOfListWithSpacing() {
        returnedConstraints = DistributeLeadingToTrailing(spacing: 14, button, slider, toggle)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = superview.constraints() as! [Constraint]
        var expected = slider.leading =* button.trailing + 14
        XCTAssertTrue(contains(appliedConstraints, expected), "The slider should be 14 pt from the trailing side of the button")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = toggle.leading =* slider.trailing + 14
        XCTAssertTrue(contains(appliedConstraints, expected), "The toggle should be 14 pt from the trailing side of the slider")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testLeadingToTrailingDistributionOfArrayWithoutSpacing() {
        returnedConstraints = DistributeLeadingToTrailing([button, slider, toggle])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = superview.constraints() as! [Constraint]
        var expected = slider.leading =* button.trailing
        XCTAssertTrue(contains(appliedConstraints, expected), "The slider should be pinned to the right side of the button")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = toggle.leading =* slider.trailing
        XCTAssertTrue(contains(appliedConstraints, expected), "The toggle should be pinned to the right side of the slider")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testLeadingToTrailingDistributionOfArrayWithSpacing() {
        returnedConstraints = DistributeLeadingToTrailing(spacing: 14, [button, slider, toggle])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = superview.constraints() as! [Constraint]
        var expected = slider.leading =* button.trailing + 14
        XCTAssertTrue(contains(appliedConstraints, expected), "The slider should be 14 pt to the trailing side of the button")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = toggle.leading =* slider.trailing + 14
        XCTAssertTrue(contains(appliedConstraints, expected), "The toggle should be 14 pt to the trailing side of the slider")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    //  MARK: Top-to-bottom distribution

    func testTopToBottomDistributionOfListWithoutSpacing() {
        returnedConstraints = DistributeTopToBottom(button, slider, toggle)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = superview.constraints() as! [Constraint]
        var expected = slider.top =* button.bottom
        XCTAssertTrue(contains(appliedConstraints, expected), "The slider should be pinned to the bottom side of the button")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = toggle.top =* slider.bottom
        XCTAssertTrue(contains(appliedConstraints, expected), "The toggle should be pinned to the bottom side of the slider")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testTopToBottomDistributionOfListWithSpacing() {
        returnedConstraints = DistributeTopToBottom(spacing: 14, button, slider, toggle)
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = superview.constraints() as! [Constraint]
        var expected = slider.top =* button.bottom + 14
        XCTAssertTrue(contains(appliedConstraints, expected), "The slider should be 14 pt underneath the button")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = toggle.top =* slider.bottom + 14
        XCTAssertTrue(contains(appliedConstraints, expected), "The toggle should be 14 pt underneath the slider")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testTopToBottomDistributionOfArrayWithoutSpacing() {
        returnedConstraints = DistributeTopToBottom([button, slider, toggle])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = superview.constraints() as! [Constraint]
        var expected = slider.top =* button.bottom
        XCTAssertTrue(contains(appliedConstraints, expected), "The slider should be pinned to the bottom side of the button")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = toggle.top =* slider.bottom
        XCTAssertTrue(contains(appliedConstraints, expected), "The toggle should be pinned to the bottom side of the slider")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

    func testTopToBottomDistributionOfArrayWithSpacing() {
        returnedConstraints = DistributeTopToBottom(spacing: 14, [button, slider, toggle])
        XCTAssertEqual(returnedConstraints.count, 2, "There should be two total constraints returned")
        appliedConstraints = superview.constraints() as! [Constraint]
        var expected = slider.top =* button.bottom + 14
        XCTAssertTrue(contains(appliedConstraints, expected), "The slider should be 14 pt underneath the button")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
        expected = toggle.top =* slider.bottom + 14
        XCTAssertTrue(contains(appliedConstraints, expected), "The toggle should be 14 pt underneath the slider")
        XCTAssertTrue(contains(returnedConstraints, expected), "The applied constraint should be returned to the caller")
    }

}
