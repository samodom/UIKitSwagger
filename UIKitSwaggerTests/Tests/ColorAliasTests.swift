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
        XCTAssertEqual(Black, UIColor.blackColor(), "The alias `Black` should produce the black color")
    }

    func testWhiteColorAlias() {
        XCTAssertEqual(White, UIColor.whiteColor(), "The alias `White` should produce the white color")
    }

    func testGrayColorAlias() {
        XCTAssertEqual(Gray, UIColor.grayColor(), "The alias `Gray` should produce the gray color")
    }

    func testLightGrayColorAlias() {
        XCTAssertEqual(LightGray, UIColor.lightGrayColor(), "The alias `LightGray` should produce the light gray color")
    }

    func testDarkGrayColorAlias() {
        XCTAssertEqual(DarkGray, UIColor.darkGrayColor(), "The alias `DarkGray` should produce the dark gray color")
    }

    func testRedColorAlias() {
        XCTAssertEqual(Red, UIColor.redColor(), "The alias `Red` should produce the red color")
    }

    func testGreenColorAlias() {
        XCTAssertEqual(Green, UIColor.greenColor(), "The alias `Green` should produce the green color")
    }

    func testBlueColorAlias() {
        XCTAssertEqual(Blue, UIColor.blueColor(), "The alias `Blue` should produce the blue color")
    }

    func testCyanColorAlias() {
        XCTAssertEqual(Cyan, UIColor.cyanColor(), "The alias `Cyan` should produce the cyan color")
    }

    func testMagentaColorAlias() {
        XCTAssertEqual(Magenta, UIColor.magentaColor(), "The alias `Magenta` should produce the magenta color")
    }

    func testYellowColorAlias() {
        XCTAssertEqual(Yellow, UIColor.yellowColor(), "The alias `Yellow` should produce the yellow color")
    }

    func testOrangeColorAlias() {
        XCTAssertEqual(Orange, UIColor.orangeColor(), "The alias `Orange` should produce the orange color")
    }

    func testPurpleColorAlias() {
        XCTAssertEqual(Purple, UIColor.purpleColor(), "The alias `Purple` should produce the purple color")
    }

    func testBrownColorAlias() {
        XCTAssertEqual(Brown, UIColor.brownColor(), "The alias `Brown` should produce the brown color")
    }

    func testClearColorAlias() {
        XCTAssertEqual(Clear, UIColor.clearColor(), "The alias `Clear` should produce the clear color")
    }

}
