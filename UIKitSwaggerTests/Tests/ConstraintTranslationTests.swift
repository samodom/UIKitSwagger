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
        assert(label.translatesAutoresizingMaskIntoConstraints)
    }

    func testTurningOffTranslationWithArrayLiteral() {
        [view, button, image, label].setTranslatesAutoresizingMaskIntoConstraints(false)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints, "The view's autoresizing mask should no longer be translated into constraints")
        XCTAssertFalse(button.translatesAutoresizingMaskIntoConstraints, "The button's autoresizing mask should no longer be translated into constraints")
        XCTAssertFalse(image.translatesAutoresizingMaskIntoConstraints, "The image view's autoresizing mask should no longer be translated into constraints")
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints, "The label's autoresizing mask should no longer be translated into constraints")
    }

    func testTurningOnTranslationWithArray() {
        button.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        view.subviews.setTranslatesAutoresizingMaskIntoConstraints(true)
        XCTAssertTrue(button.translatesAutoresizingMaskIntoConstraints, "The button's autoresizing mask should now be translated into constraints")
        XCTAssertTrue(image.translatesAutoresizingMaskIntoConstraints, "The image view's autoresizing mask should now be translated into constraints")
        XCTAssertTrue(label.translatesAutoresizingMaskIntoConstraints, "The label's autoresizing mask should now be translated into constraints")
    }

    func testTurningOffTranslationWithSet() {
        let items = [view, button, image, label] as Set
        items.setTranslatesAutoresizingMaskIntoConstraints(false)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints, "The view's autoresizing mask should no longer be translated into constraints")
        XCTAssertFalse(button.translatesAutoresizingMaskIntoConstraints, "The button's autoresizing mask should no longer be translated into constraints")
        XCTAssertFalse(image.translatesAutoresizingMaskIntoConstraints, "The image view's autoresizing mask should no longer be translated into constraints")
        XCTAssertFalse(label.translatesAutoresizingMaskIntoConstraints, "The label's autoresizing mask should no longer be translated into constraints")
    }

}
