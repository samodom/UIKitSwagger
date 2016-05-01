//
//  ColorPaletteTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import UIKitSwagger

class ColorPaletteTests: XCTestCase {

    var palette = ColorPalette()
    var dictionary = [String: UIColor]()

    override func setUp() {
        super.setUp()

        dictionary["red"] = Red
        dictionary["blue"] = Blue
        dictionary["green"] = Green
    }

    func testCreatingEmptyPalette() {
        XCTAssertEqual(palette.numberOfColors, 0, "There should be no colors in an empty palette")
    }

    func testCreatingPaletteWithColors() {
        palette = ColorPalette(colors: dictionary)
        XCTAssertEqual(palette.numberOfColors, 3, "The palette should be created with three colors")
        XCTAssertEqual(palette.colorNamed("red")!, Red, "The supplied colors should be added to the palette")
        XCTAssertEqual(palette.colorNamed("blue")!, Blue, "The supplied colors should be added to the palette")
        XCTAssertEqual(palette.colorNamed("green")!, Green, "The supplied colors should be added to the palette")
    }

    func testCreatingPaletteWithUnnamedColor() {
        dictionary[""] = Purple
        palette = ColorPalette(colors: dictionary)
        XCTAssertEqual(palette.numberOfColors, 3, "The palette should be created with three colors")
        XCTAssertEqual(palette.colorNamed("red")!, Red, "The supplied colors should be added to the palette")
        XCTAssertEqual(palette.colorNamed("blue")!, Blue, "The supplied colors should be added to the palette")
        XCTAssertEqual(palette.colorNamed("green")!, Green, "The supplied colors should be added to the palette")
        XCTAssertNil(palette.colorNamed(""), "Colors without names should not be imported into the palette")
    }


    func testPaletteProvidesColorDictionary() {
        palette = ColorPalette(colors: dictionary)
        XCTAssertEqual(palette.allColors, dictionary, "The palette should provide all of the colors with their names")
    }

    func testColorPaletteAddsColorsToDictionary() {
        palette.addColor(Red, named: "rosso")
        XCTAssertEqual(palette.numberOfColors, 1, "There should be one color in the dictionary")
        XCTAssertEqual(palette.colorNamed("rosso")!, Red, "The palette should add colors to its dictionary by a name string")

        palette.addColor(Blue, named: "blou")
        XCTAssertEqual(palette.numberOfColors, 2, "There should be two colors in the dictionary")
        XCTAssertEqual(palette.colorNamed("blou")!, Blue, "The palette should add colors to its dictionary by a name string")
    }

    func testColorPaletteReplacesColorsInDictionary() {
        palette.addColor(Red, named: "rosso")
        palette.addColor(Blue, named: "rosso")
        XCTAssertEqual(palette.numberOfColors, 1, "There should be one color in the dictionary")
        XCTAssertEqual(palette.colorNamed("rosso")!, Blue, "The palette should replace colors in its dictionary")
    }

    func testColorPaletteRemovesColorsFromDictionary() {
        palette.addColor(Red, named: "red")
        palette.removeColorNamed("red")
        XCTAssertEqual(palette.numberOfColors, 0, "There should be no colors left in the dictionary")
    }

    func testColorPaletteRemovesAllColors() {
        palette = ColorPalette(colors: dictionary)
        palette.removeAllColors()
        XCTAssertEqual(palette.numberOfColors, 0, "The palette should clear all of its colors")
    }

    func testColorPaletteReturnsColorsByName() {
        palette = ColorPalette(colors: dictionary)
        XCTAssertEqual(palette.colorNamed("red")!, Red, "The palette should return colors by their name")
        XCTAssertEqual(palette.colorNamed("blue")!, Blue, "The palette should return colors by their name")
        XCTAssertEqual(palette.colorNamed("green")!, Green, "The palette should return colors by their name")
        XCTAssertNil(palette.colorNamed("pink"), "No color should be returned if it does not exist in the palette's dictionary")
    }

    func testSettingColorWithSubscript() {
        palette["red"] = Red
        XCTAssertEqual(palette.colorNamed("red")!, Red, "The palette should add the color named by the subscript")
    }

    func testReplacingColorWithSubscript() {
        palette.addColor(Red, named: "red")
        palette["red"] = Blue
        XCTAssertEqual(palette.colorNamed("red")!, Blue, "The palette should replace the color named by the subscript")
    }

    func testGettingColorWithSubscript() {
        palette.addColor(Red, named: "red")
        XCTAssertEqual(palette["red"]!, Red, "The palette should return the color named by the subscript")
        XCTAssertNil(palette["pink"], "The palette should not return a color if it is not part of the palette")
    }

    func testClearingColorWithSubscript() {
        palette.addColor(Red, named: "red")
        palette["red"] = nil
        XCTAssertNil(palette.colorNamed("red"), "The palette should clear the color named by the subscript")
    }

}
