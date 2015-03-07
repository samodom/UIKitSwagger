//
//  ConstraintTranslationTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 2/27/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

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
        assert(view.translatesAutoresizingMaskIntoConstraints())
        assert(button.translatesAutoresizingMaskIntoConstraints())
        assert(image.translatesAutoresizingMaskIntoConstraints())
        assert(label.translatesAutoresizingMaskIntoConstraints())
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testTurningOffTranslationWithSingleItem() {
        DoNotTranslateMasks(view)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints(), "The view's autoresizing masks should no longer be translated into constraints")
    }


    func testTurningOffTranslationWithMultipleItems() {
        DoNotTranslateMasks(button, image, label)
        XCTAssertFalse(button.translatesAutoresizingMaskIntoConstraints(), "The button's autoresizing masks should no longer be translated into constraints")
        XCTAssertFalse(image.translatesAutoresizingMaskIntoConstraints(), "The image view's autoresizing masks should no longer be translated into constraints")
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints(), "The label's autoresizing masks should no longer be translated into constraints")
    }


    func testTurningOffTranslationWithArray() {
        DoNotTranslateMasks(view.subviews as! [UIView])
        XCTAssertFalse(button.translatesAutoresizingMaskIntoConstraints(), "The button's autoresizing masks should no longer be translated into constraints")
        XCTAssertFalse(image.translatesAutoresizingMaskIntoConstraints(), "The image view's autoresizing masks should no longer be translated into constraints")
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints(), "The label's autoresizing masks should no longer be translated into constraints")
    }

}
