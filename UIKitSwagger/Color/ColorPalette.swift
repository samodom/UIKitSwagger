//
//  ColorPalette.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/13/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
Convenient type alias for a string-keyed dictionary of colors.
*/
public typealias ColorDictionary = [String:UIColor]

/**
This class provides a simple interface for storing and retrieving commonly used colors by name.
You can create an empty palette or provide a dictionary of colors.
*/
public class ColorPalette {

    private var colorDictionary = ColorDictionary()

    /**
    Initializes an empty color palette.
    */
    public init() { }

    /**
    Initializes a color palette with the supplied colors and names.
    - parameter colors: Dictionary of colors stored by name.
    */
    public init(colors: ColorDictionary) {
        colorDictionary = colors
    }

    /**
    The number of colors in the palette.
    */
    public var numberOfColors: Int {
        return colorDictionary.count
    }

    /**
    All colors stored in the palette.
    */
    public var allColors: ColorDictionary {
        return colorDictionary
    }

    /**
    Adds a color to the palette by name.
    - parameter color: Color to add to the palette.
    - parameter name: Name to associate with the color.
    */
    public func addColor(color: UIColor, named name: String) {
        assert(name != "", "The name for a color in the palette must be at least one character long")
        colorDictionary[name] = color
    }

    /**
    Retrieves the color in the palette associated with the provided name.
    - parameter name: Name associated with color to retrieve.
    - returns: Color associated with the provided name or `nil` if no such association exists.
    */
    public func colorNamed(name: String) -> UIColor? {
        return colorDictionary[name]
    }

    /**
    Removes the color in the palette associated with the provided name.
    - parameter name: Name associated with the color to remove.
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
        get { return colorNamed(name) }
        set {
            newValue == nil ? removeColorNamed(name) : addColor(newValue!, named: name)
        }
    }
    
}
