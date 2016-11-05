//
//  AttributedString.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 10/23/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import Foundation

public extension NSAttributedString {

    /// Convenience initializer for creating an attributed string using a collection of character attributes.
    /// - parameter string: Base string to use for the attributed string.
    /// - parameter attributes: Collection of `CharacterAttribute`s to apply to the provided string.
    public convenience init
        <Attributes: Collection>
        (string: String, characterAttributes: Attributes)
        where Attributes.Iterator.Element == CharacterAttribute {

            self.init(string: string, attributes: characterAttributes.attributeDictionary())
    }


    /// Retrieves the character attribute at the specified index identifiable by the provided attribute name.
    /// - parameter named: Name of character attribute to retrieve.
    /// - parameter at: Index in string of character with desired attribute.
    /// - returns: The character attribute identified by the name and index, if any.
    public func characterAttribute(named attributeName: String, at index: Int) -> CharacterAttribute? {
        guard let value = attribute(attributeName, at: index, effectiveRange: nil) else {
            return nil
        }

        return CharacterAttribute(name: attributeName, value: value)
    }


    /// Retrieves the set of character attributes at the specified index.
    /// - parameter at: Index in string of character with desired attributes.
    /// - returns: The character attributes identified by the name and index, if any.
    public func characterAttributes(at index: Int) -> Set<CharacterAttribute> {
        return attributes(at: index, effectiveRange: nil).characterAttributeSet()
    }


    /// Retrieves the character attribute at the specified index identifiable by the provided attribute name and the range over which the attribute is applied.
    /// - parameter named: Name of character attribute to retrieve.
    /// - parameter at: Index in string of character with desired attribute.
    /// - returns: The character attribute identified by the name and index, if any, and the range over which the attribute is applied.
    /// - note: The range isn’t necessarily the maximum range covered by the attribute and its extent is implementation-dependent.  If you need the maximum range, use `maximumRangedCharacterAttributeAtIndex(_:named:inRange:)`
    public func rangedCharacterAttribute(named attributeName: String, at index: Int)
        -> (CharacterAttribute?, Range<Int>) {

            var range = NSRange()
            guard let value = attribute(attributeName, at: index, effectiveRange: &range),
                let characterAttribute = CharacterAttribute(name: attributeName, value: value) else {
                    return (nil, range.toRange()!)
            }

            return (characterAttribute, range.toRange()!)
    }


    /// Retrieves the character attribute at the specified index identifiable by the provided attribute name and the longest effective range over which the attribute is applied within the supplied range limit.
    /// - parameter named: Name of character attribute to retrieve.
    /// - parameter at: Index in string of character with desired attribute.
    /// - parameter in: The maximum range extent to use for the returned range.
    /// - returns: The character attribute identified by the name and index, if any, and the range over which the attribute is applied.
    public func maximumRangedCharacterAttribute(
        named attributeName: String,
        at index: Int,
        in rangeLimit: Range<Int>
        ) -> (CharacterAttribute?, Range<Int>) {

        var range = NSRange()
        guard
            let value = attribute(
                attributeName,
                at: index,
                longestEffectiveRange: &range,
                in: NSRange(rangeLimit)
            ),
            let characterAttribute = CharacterAttribute(name: attributeName, value: value) else {
                return (nil, range.toRange()!)
        }

        return (characterAttribute, range.toRange()!)
    }


    /// Retrieves the character attributes at the specified index and the range over which the attributes are applied.
    /// - parameter at: Index in string of character with desired attributes.
    /// - returns: The character attributes at the specified index, if any, and the range over which the attributes are applied.
    /// - note: The range isn’t necessarily the maximum range covered by the attributes and its extent is implementation-dependent.  If you need the maximum range, use `maximumRangedCharacterAttributesAtIndex(_:inRange:)`
    public func rangedCharacterAttributes(at index: Int) -> (Set<CharacterAttribute>, Range<Int>) {
        var range = NSRange()
        let oldAttributes = attributes(at: index, effectiveRange: &range)
        return (oldAttributes.characterAttributeSet(), range.toRange()!)
    }


    /// Retrieves the character attributes at the specified index and the longest effective range over which the attributes are applied within the supplied range limit.
    /// - parameter at: Index in string of character with desired attributes.
    /// - parameter in: The maximum range extent to use for the returned range.
    /// - returns: The character attributes at the specified index, if any, and the range over which the attributes are applied.
    public func maximumRangedCharacterAttributes(at index: Int, in rangeLimit: Range<Int>)
        -> (Set<CharacterAttribute>, Range<Int>) {

            var range = NSRange()
            let oldAttributes = attributes(
                at: index,
                longestEffectiveRange: &range,
                in: NSRange(rangeLimit)
            )

            return (oldAttributes.characterAttributeSet(), range.toRange()!)
    }

}
