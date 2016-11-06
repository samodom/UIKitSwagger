//
//  ConstraintTranslationTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 2/27/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import XCTest
import UIKitSwagger

class ConstraintTranslationTests: XCTestCase {

    let view = UIView()
    let button = UIButton()
    let image = UIImageView()
    let label = UILabel()

    override func setUp() {
        super.setUp()

        view.addSubview(button)
        view.addSubview(image)
        view.addSubview(label)
        assert(view.translatesAutoresizingMaskIntoConstraints)
        assert(button.translatesAutoresizingMaskIntoConstraints)
        assert(image.translatesAutoresizingMaskIntoConstraints)

        label.translatesAutoresizingMaskIntoConstraints = false
    }

    //  MARK: Single views

    func testTurningOnAutoLayout() {
        button.usesAutoLayout = true
        XCTAssertFalse(button.translatesAutoresizingMaskIntoConstraints, "Turning on auto layout usage should clear the translation flag")
    }

    func testTurningOffAutoLayout() {
        label.usesAutoLayout = false
        XCTAssertTrue(label.translatesAutoresizingMaskIntoConstraints, "Turning off auto layout usage should set the translation flag")
    }

    func testAutoLayoutFlagMirrorsTranslationFlag() {
        assert(!button.usesAutoLayout)
        button.translatesAutoresizingMaskIntoConstraints = false
        XCTAssertTrue(button.usesAutoLayout, "Clearing the translation flag should set the auto layout usage flag")

        button.translatesAutoresizingMaskIntoConstraints = true
        XCTAssertFalse(button.usesAutoLayout, "Setting the translation flag should clear the auto layout usage flag")
    }


    //  MARK: Multiple views

    func testTurningOnAutoLayoutWithArrayLiteral() {
        assert(label.usesAutoLayout)
        [view, button, image, label].useAutoLayout()
        XCTAssertTrue(view.usesAutoLayout, "The view should now be using auto layout")
        XCTAssertTrue(button.usesAutoLayout, "The button should now be using auto layout")
        XCTAssertTrue(image.usesAutoLayout, "The image should now be using auto layout")
        XCTAssertTrue(label.usesAutoLayout, "The label should still be using auto layout")
    }

    func testTurningOnAutoLayoutWithArray() {
        assert(label.usesAutoLayout)
        view.subviews.useAutoLayout()
        XCTAssertTrue(button.usesAutoLayout, "The button should now be using auto layout")
        XCTAssertTrue(image.usesAutoLayout, "The image should now be using auto layout")
        XCTAssertTrue(label.usesAutoLayout, "The label should still be using auto layout")
    }

    func testTurningOnAutoLayoutWithSet() {
        assert(label.usesAutoLayout)
        let items: Set = [view, button, image, label]
        items.useAutoLayout()
        XCTAssertTrue(view.usesAutoLayout, "The view should now be using auto layout")
        XCTAssertTrue(button.usesAutoLayout, "The button should now be using auto layout")
        XCTAssertTrue(image.usesAutoLayout, "The image should now be using auto layout")
        XCTAssertTrue(label.usesAutoLayout, "The label should still be using auto layout")
    }

}
