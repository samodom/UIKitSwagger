//
//  ColorPalette.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public class ColorPalette {

    private typealias ColorDictionary = [String:UIColor]
    private var colorDictionary = ColorDictionary()

    /**
      Initializes a color palette with the supplied colors and names.
      @param        colors Dictionary of colors stored by name.
    */
    public init() { }

    /**
      Initializes a color palette with the supplied colors and names.
      @param        colors Dictionary of colors stored by name.
    */
    public init(colors: [String:UIColor]) {
        colorDictionary = colors
    }

    /**
      The number of colors in the palette.
    */
    public var numberOfColors: Int {
        return colorDictionary.count
    }

    /**
      Adds a color to the palette by name.
      @param        color Color to add to the palette.
      @param        name Name to associate with the color
    */
    public func addColor(color: UIColor, named name: String) {
        assert(name != "", "The name for a color in the palette must be at least one character long")
        colorDictionary[name] = color
    }

    /**
      Retrieves the color in the palette associated with the provided name.
      @param        name Name associated with color to retrieve.
      @return       Color associated with the provided name or `nil` if no such association exists.
    */
    public func colorNamed(name: String) -> UIColor? {
        return colorDictionary[name]
    }

    /**
      Removes the color in the palette associated with the provided name.
      @param        name Name associated with the color to remove.
    */
    public func removeColorNamed(name: String) {
        colorDictionary[name] = nil
    }

    /**
      Removes all colors in the palette.
    */
    public func removeAllColors() {
        colorDictionary.removeAll()
    }

}

public extension ColorPalette {

    /**
      Subscript convenience for retrieving, adding, replacing and clearing colors in the palette.
    */
    public subscript(name: String) -> UIColor? {
        get {
            return colorNamed(name)
        }

        set {
            newValue == nil ? removeColorNamed(name) : addColor(newValue!, named: name)
        }
    }

}
