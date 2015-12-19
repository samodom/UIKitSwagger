//
//  AttributedString.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 10/23/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import Foundation

public extension NSAttributedString {

    /**
     Convenience initializer for creating an attributed string using a collection of character attributes.
     - parameter string: Base string to use for the attributed string.
     - parameter attributes: Collection of `CharacterAttribute`s to apply to the provided string.
     */
    public convenience init
        <C: CollectionType where C.Generator.Element == CharacterAttribute>
        (string: String, characterAttributes: C) {
        self.init(string: string, attributes: characterAttributes.attributeDictionary)
    }

    /**
     Retrieves the character attribute at the specified index identifiable by the provided attribute name.
     - parameter index: Index in string of character with desired attribute.
     - parameter attributeName: Name of character attribute to retrieve.
     - returns: The character attribute identified by the name and index, if any.
     */
    public func characterAttributeAtIndex(index: Int, named attributeName: String) -> CharacterAttribute? {
        guard let value = attribute(attributeName, atIndex: index, effectiveRange: nil) else {
            return nil
        }

        return CharacterAttribute(name: attributeName, value: value)
    }

    /**
     Retrieves the character attribute at the specified index identifiable by the provided attribute name.
     - parameter index: Index in string of character with desired attribute.
     - parameter attributeName: Name of character attribute to retrieve.
     - returns: The character attribute identified by the name and index, if any.
     */
    public subscript(index: Int, named name: String) -> CharacterAttribute? {
        return characterAttributeAtIndex(index, named: name)
    }

}


private extension CollectionType where Generator.Element == CharacterAttribute {

    private var attributeDictionary: CharacterAttributeDictionary {
        return reduce(CharacterAttributeDictionary()) { (var dictionary, let attribute) -> CharacterAttributeDictionary in
            let (key, value) = attribute.keyValuePair
            dictionary[key] = value
            return dictionary
        }
    }

}