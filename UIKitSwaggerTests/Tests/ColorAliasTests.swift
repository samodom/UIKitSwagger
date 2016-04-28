//
//  ColorAliasTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest
import UIKitSwagger

class ColorAliasTests: XCTestCase {

    func testBlackColorAlias() {
        XCTAssertEqual(Black, UIColor.blackColor(), "The constant alias `Black` should equal the black color")
    }

    func testWhiteColorAlias() {
        XCTAssertEqual(White, UIColor.whiteColor(), "The constant alias `White` should equal the white color")
    }

    func testGrayColorAlias() {
        XCTAssertEqual(Gray, UIColor.grayColor(), "The constant alias `Gray` should equal the gray color")
    }

    func testLightGrayColorAlias() {
        XCTAssertEqual(LightGray, UIColor.lightGrayColor(), "The constant alias `LightGray` should equal the light gray color")
    }

    func testDarkGrayColorAlias() {
        XCTAssertEqual(DarkGray, UIColor.darkGrayColor(), "The constant alias `DarkGray` should equal the dark gray color")
    }

    func testRedColorAlias() {
        XCTAssertEqual(Red, UIColor.redColor(), "The constant alias `Red` should equal the red color")
    }

    func testGreenColorAlias() {
        XCTAssertEqual(Green, UIColor.greenColor(), "The constant alias `Green` should equal the green color")
    }

    func testBlueColorAlias() {
        XCTAssertEqual(Blue, UIColor.blueColor(), "The constant alias `Blue` should equal the blue color")
    }

    func testCyanColorAlias() {
        XCTAssertEqual(Cyan, UIColor.cyanColor(), "The constant alias `Cyan` should equal the cyan color")
    }

    func testMagentaColorAlias() {
        XCTAssertEqual(Magenta, UIColor.magentaColor(), "The constant alias `Magenta` should equal the magenta color")
    }

    func testYellowColorAlias() {
        XCTAssertEqual(Yellow, UIColor.yellowColor(), "The constant alias `Yellow` should equal the yellow color")
    }

    func testOrangeColorAlias() {
        XCTAssertEqual(Orange, UIColor.orangeColor(), "The constant alias `Orange` should equal the orange color")
    }

    func testPurpleColorAlias() {
        XCTAssertEqual(Purple, UIColor.purpleColor(), "The constant alias `Purple` should equal the purple color")
    }

    func testBrownColorAlias() {
        XCTAssertEqual(Brown, UIColor.brownColor(), "The constant alias `Brown` should equal the brown color")
    }

    func testClearColorAlias() {
        XCTAssertEqual(Clear, UIColor.clearColor(), "The constant alias `Clear` should equal the clear color")
    }

}
