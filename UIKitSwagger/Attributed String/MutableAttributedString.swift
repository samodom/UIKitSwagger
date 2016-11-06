//
//  MutableAttributedString.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/5/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

public extension NSMutableAttributedString {

    /// Sets the attributes for the characters in the specified range to the specified attributes.
    /// - parameter attributes: The set of character attributes to apply over the specified range.
    /// - parameter over: The range over which to apply the attributes.
    public func setCharacterAttributes(attributes: Set<CharacterAttribute>, over range: Range<Int>) {
        setAttributes(attributes.attributeDictionary(), range: NSRange(range))
    }


    /// Adds an attribute to the characters in the specified range.
    /// - parameter attribute: The character attribute to add over the specified range.
    /// - parameter over: The range over which to add the attribute.
    public func addCharacterAttribute(attribute: CharacterAttribute, over range: Range<Int>) {
        let (key, value) = attribute.keyValuePair()
        addAttribute(key, value: value, range: NSRange(range))
    }


    /// Adds the given set of attributes to the characters in the specified range.
    /// - parameter attributes: The character attributes to add over the specified range.
    /// - parameter over: The range over which to add the attributes.
    public func addCharacterAttributes(attributes: Set<CharacterAttribute>, over range: Range<Int>) {
        addAttributes(attributes.attributeDictionary(), range: NSRange(range))
    }

}
