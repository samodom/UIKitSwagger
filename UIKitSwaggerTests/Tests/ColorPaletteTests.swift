//
//  ColorPaletteTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest
import UIKitSwagger

class ColorPaletteTests: XCTestCase {

    var palette = ColorPalette()
    var colors: [String:UIColor]!

    override func setUp() {
        super.setUp()

        colors = [
            "red": UIColor.red,
            "blue": UIColor.blue,
            "green": UIColor.green
        ]
    }

    func testCreatingEmptyPalette() {
        XCTAssertEqual(palette.numberOfColors, 0, "There should be no colors in an empty palette")
    }

    func testCreatingPaletteWithColors() {
        palette = ColorPalette(colors: colors)
        XCTAssertEqual(palette.numberOfColors, 3, "The palette should be created with three colors")
        XCTAssertEqual(palette.colorNamed("red")!, UIColor.red, "The supplied colors should be added to the palette")
        XCTAssertEqual(palette.colorNamed("blue")!, UIColor.blue, "The supplied colors should be added to the palette")
        XCTAssertEqual(palette.colorNamed("green")!, UIColor.green, "The supplied colors should be added to the palette")
    }

    func testPaletteProvidesColorDictionary() {
        palette = ColorPalette(colors: colors)
        XCTAssertEqual(palette.allColors, colors, "The palette should provide all of the colors with their names")
    }

    func testColorPaletteAddsColorsToDictionary() {
        palette.addColor(UIColor.red, named: "rosso")
        XCTAssertEqual(palette.numberOfColors, 1, "There should be one color in the dictionary")
        XCTAssertEqual(palette.colorNamed("rosso")!, UIColor.red, "The palette should add colors to its dictionary by a name string")

        palette.addColor(UIColor.blue, named: "blou")
        XCTAssertEqual(palette.numberOfColors, 2, "There should be two colors in the dictionary")
        XCTAssertEqual(palette.colorNamed("blou")!, UIColor.blue, "The palette should add colors to its dictionary by a name string")
    }

    func testColorPaletteReplacesColorsInDictionary() {
        palette.addColor(UIColor.red, named: "rosso")
        palette.addColor(UIColor.blue, named: "rosso")
        XCTAssertEqual(palette.numberOfColors, 1, "There should be one color in the dictionary")
        XCTAssertEqual(palette.colorNamed("rosso")!, UIColor.blue, "The palette should replace colors in its dictionary")
    }

    func testColorPaletteRemovesColorsFromDictionary() {
        palette.addColor(UIColor.red, named: "red")
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
        XCTAssertEqual(palette.colorNamed("red")!, UIColor.red, "The palette should return colors by their name")
        XCTAssertEqual(palette.colorNamed("blue")!, UIColor.blue, "The palette should return colors by their name")
        XCTAssertEqual(palette.colorNamed("green")!, UIColor.green, "The palette should return colors by their name")
        XCTAssertNil(palette.colorNamed("pink"), "No color should be returned if it does not exist in the palette's dictionary")
    }

    func testSettingColorWithSubscript() {
        palette["red"] = UIColor.red
        XCTAssertEqual(palette.colorNamed("red")!, UIColor.red, "The palette should add the color named by the subscript")
    }

    func testReplacingColorWithSubscript() {
        palette.addColor(UIColor.red, named: "red")
        palette["red"] = UIColor.blue
        XCTAssertEqual(palette.colorNamed("red")!, UIColor.blue, "The palette should replace the color named by the subscript")
    }

    func testGettingColorWithSubscript() {
        palette.addColor(UIColor.red, named: "red")
        XCTAssertEqual(palette["red"]!, UIColor.red, "The palette should return the color named by the subscript")
        XCTAssertNil(palette["pink"], "The palette should not return a color if it is not part of the palette")
    }

    func testClearingColorWithSubscript() {
        palette.addColor(UIColor.red, named: "red")
        palette["red"] = nil
        XCTAssertNil(palette.colorNamed("red"), "The palette should clear the color named by the subscript")
    }

}
