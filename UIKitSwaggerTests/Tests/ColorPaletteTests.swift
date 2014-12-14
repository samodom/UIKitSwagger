//
//  ColorPaletteTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class ColorPaletteTests: XCTestCase {

    var palette = ColorPalette()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testColorPaletteHasColorDictionary() {
        let dictionary = palette.colorDictionary
        XCTAssertEqual(dictionary.count, 0, "The palette should have an empty color dictionary by default")
    }

    func testColorPaletteAddsColorsToDictionary() {
        palette.addColor(red, named: "rosso")
        XCTAssertEqual(palette.colorDictionary.count, 1, "There should be one color in the dictionary")
        XCTAssertEqual(palette.colorDictionary["rosso"]!, red, "The palette should add colors to its dictionary by a name string")

        palette.addColor(blue, named: "blou")
        XCTAssertEqual(palette.colorDictionary.count, 2, "There should be two colors in the dictionary")
        XCTAssertEqual(palette.colorDictionary["blou"]!, blue, "The palette should add colors to its dictionary by a name string")
    }

    func testColorPaletteReplacesColorsInDictionary() {
        palette.addColor(red, named: "rosso")
        palette.addColor(blue, named: "rosso")
        XCTAssertEqual(palette.colorDictionary.count, 1, "There should be one color in the dictionary")
        XCTAssertEqual(palette.colorDictionary["rosso"]!, blue, "The palette should replace colors in its dictionary")
    }

    func testColorPaletteRemovesColorsFromDictionary() {
        palette.addColor(red, named: "red")
        palette.removeColorNamed("red")
        XCTAssertEqual(palette.colorDictionary.count, 0, "There should be no colors left in the dictionary")
    }

    func testColorPaletteRemovesAllColors() {
        palette.colorDictionary = [ "red": red, "blue": blue, "green": green ]
        palette.removeAllColors()
        XCTAssertEqual(palette.colorDictionary.count, 0, "The palette should clear all of its colors")
    }

    func testColorPaletteReturnsColorsByName() {
        palette.colorDictionary = [ "red": red, "blue": blue, "green": green ]
        XCTAssertEqual(palette.colorNamed("red")!, red, "The palette should return colors by their name")
        XCTAssertEqual(palette.colorNamed("blue")!, blue, "The palette should return colors by their name")
        XCTAssertEqual(palette.colorNamed("green")!, green, "The palette should return colors by their name")
        XCTAssertNil(palette.colorNamed("pink"), "No color should be returned if it does not exist in the palette's dictionary")
    }

    func testSettingColorWithSubscript() {
        palette["red"] = red
        XCTAssertEqual(palette.colorNamed("red")!, red, "The palette should add the color named by the subscript")
    }

    func testReplacingColorWithSubscript() {
        palette.addColor(red, named: "red")
        palette["red"] = blue
        XCTAssertEqual(palette.colorNamed("red")!, blue, "The palette should replace the color named by the subscript")
    }

    func testGettingColorWithSubscript() {
        palette.addColor(red, named: "red")
        XCTAssertEqual(palette["red"]!, red, "The palette should return the color named by the subscript")
        XCTAssertNil(palette["pink"], "The palette should not return a color if it is not part of the palette")
    }

    func testClearingColorWithSubscript() {
        palette.addColor(red, named: "red")
        palette["red"] = nil
        XCTAssertNil(palette.colorNamed("red"), "The palette should clear the color named by the subscript")
    }

}
