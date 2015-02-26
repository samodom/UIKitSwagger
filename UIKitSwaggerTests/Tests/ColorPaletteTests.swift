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
    let red = UIColor.redColor()
    let blue = UIColor.blueColor()
    let green = UIColor.greenColor()
    var colors: [String:UIColor]!

    override func setUp() {
        super.setUp()

        colors = ["red": red, "blue": blue, "green": green]
    }

    override func tearDown() {
        super.tearDown()
    }

    func testCreatingEmptyPalette() {
        XCTAssertEqual(palette.numberOfColors, 0, "There should be no colors in an empty palette")
    }

    func testCreatingPaletteWithColors() {
        palette = ColorPalette(colors: colors)
        XCTAssertEqual(palette.numberOfColors, 3, "The palette should be created with three colors")
        XCTAssertEqual(palette.colorNamed("red")!, red, "The supplied colors should be added to the palette")
        XCTAssertEqual(palette.colorNamed("blue")!, blue, "The supplied colors should be added to the palette")
        XCTAssertEqual(palette.colorNamed("green")!, green, "The supplied colors should be added to the palette")
    }

    func testColorPaletteAddsColorsToDictionary() {
        palette.addColor(red, named: "rosso")
        XCTAssertEqual(palette.numberOfColors, 1, "There should be one color in the dictionary")
        XCTAssertEqual(palette.colorNamed("rosso")!, red, "The palette should add colors to its dictionary by a name string")

        palette.addColor(blue, named: "blou")
        XCTAssertEqual(palette.numberOfColors, 2, "There should be two colors in the dictionary")
        XCTAssertEqual(palette.colorNamed("blou")!, blue, "The palette should add colors to its dictionary by a name string")
    }

    func testColorPaletteReplacesColorsInDictionary() {
        palette.addColor(red, named: "rosso")
        palette.addColor(blue, named: "rosso")
        XCTAssertEqual(palette.numberOfColors, 1, "There should be one color in the dictionary")
        XCTAssertEqual(palette.colorNamed("rosso")!, blue, "The palette should replace colors in its dictionary")
    }

    func testColorPaletteRemovesColorsFromDictionary() {
        palette.addColor(red, named: "red")
        palette.removeColorNamed("red")
        XCTAssertEqual(palette.numberOfColors, 0, "There should be no colors left in the dictionary")
    }

    func testColorPaletteRemovesAllColors() {
        palette = ColorPalette(colors: colors)
        palette.removeAllColors()
        XCTAssertEqual(palette.numberOfColors, 0, "The palette should clear all of its colors")
    }

    func testColorPaletteReturnsColorsByName() {
        palette = ColorPalette(colors: colors)
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
