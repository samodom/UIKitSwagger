//
//  ColorAliasTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class ColorAliasTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testBlackColorAlias() {
        XCTAssertEqual(black, UIColor.blackColor(), "The alias `black` should produce the black color")
    }

    func testWhiteColorAlias() {
        XCTAssertEqual(white, UIColor.whiteColor(), "The alias `white` should produce the white color")
    }

    func testGrayColorAlias() {
        XCTAssertEqual(gray, UIColor.grayColor(), "The alias `gray` should produce the gray color")
    }

    func testLightGrayColorAlias() {
        XCTAssertEqual(lightGray, UIColor.lightGrayColor(), "The alias `lightGray` should produce the light gray color")
    }

    func testDarkGrayColorAlias() {
        XCTAssertEqual(darkGray, UIColor.darkGrayColor(), "The alias `darkGray` should produce the dark gray color")
    }

    func testRedColorAlias() {
        XCTAssertEqual(red, UIColor.redColor(), "The alias `red` should produce the red color")
    }

    func testGreenColorAlias() {
        XCTAssertEqual(green, UIColor.greenColor(), "The alias `green` should produce the green color")
    }

    func testBlueColorAlias() {
        XCTAssertEqual(blue, UIColor.blueColor(), "The alias `blue` should produce the blue color")
    }

    func testCyanColorAlias() {
        XCTAssertEqual(cyan, UIColor.cyanColor(), "The alias `cyan` should produce the cyan color")
    }

    func testMagentaColorAlias() {
        XCTAssertEqual(magenta, UIColor.magentaColor(), "The alias `magenta` should produce the magenta color")
    }

    func testYellowColorAlias() {
        XCTAssertEqual(yellow, UIColor.yellowColor(), "The alias `yellow` should produce the yellow color")
    }

    func testOrangeColorAlias() {
        XCTAssertEqual(orange, UIColor.orangeColor(), "The alias `orange` should produce the orange color")
    }

    func testPurpleColorAlias() {
        XCTAssertEqual(purple, UIColor.purpleColor(), "The alias `purple` should produce the purple color")
    }

    func testBrownColorAlias() {
        XCTAssertEqual(brown, UIColor.brownColor(), "The alias `brown` should produce the brown color")
    }

    func testClearColorAlias() {
        XCTAssertEqual(clear, UIColor.clearColor(), "The alias `clear` should produce the clear color")
    }

}
