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
     Retrieves the set of character attributes at the specified index.
     - parameter index: Index in string of character with desired attributes.
     - returns: The character attributes identified by the name and index, if any.
     */
    public func characterAttributesAtIndex(index: Int) -> CharacterAttributeSet {
        let attributes = attributesAtIndex(index, effectiveRange: nil)

        return CharacterAttributeSetFromDictionary(attributes)
    }

    /**
     Retrieves the character attribute at the specified index identifiable by the provided attribute name and the range over which the attribute is applied.
     - parameter index: Index in string of character with desired attribute.
     - parameter attributeName: Name of character attribute to retrieve.
     - returns: The character attribute identified by the name and index, if any, and the range over which the attribute is applied.
     - note: The range isn’t necessarily the maximum range covered by the attribute and its extent is implementation-dependent.  If you need the maximum range, use `maximumRangedCharacterAttributeAtIndex(_:named:inRange:)`
    */
    public func rangedCharacterAttributeAtIndex(index: Int, named attributeName: String) -> (CharacterAttribute?, Range<Int>) {
        var range = NSRange()
        guard let value = attribute(attributeName, atIndex: index, effectiveRange: &range),
            let characterAttribute = CharacterAttribute(name: attributeName, value: value) else {
            return (nil, range.toRange()!)
        }

        return (characterAttribute, range.toRange()!)
    }

    /**
     Retrieves the character attribute at the specified index identifiable by the provided attribute name and the longest effective range over which the attribute is applied within the supplied range limit.
     - parameter index: Index in string of character with desired attribute.
     - parameter attributeName: Name of character attribute to retrieve.
     - parameter rangeLimit: The maximum range extent to use for the returned range.
     - returns: The character attribute identified by the name and index, if any, and the range over which the attribute is applied.
     */
    public func maximumRangedCharacterAttributeAtIndex(index: Int, named attributeName: String, inRange rangeLimit: Range<Int>) -> (CharacterAttribute?, Range<Int>) {
        var range = NSRange()
        guard let value = attribute(attributeName, atIndex: index, longestEffectiveRange: &range, inRange: ConvertIntRangetoNSRange(rangeLimit)),
            let characterAttribute = CharacterAttribute(name: attributeName, value: value) else {
                return (nil, range.toRange()!)
        }

        return (characterAttribute, range.toRange()!)
    }

    /**
     Retrieves the character attributes at the specified index and the range over which the attributes are applied.
     - parameter index: Index in string of character with desired attributes.
     - returns: The character attributes at the specified index, if any, and the range over which the attributes are applied.
     - note: The range isn’t necessarily the maximum range covered by the attributes and its extent is implementation-dependent.  If you need the maximum range, use `maximumRangedCharacterAttributesAtIndex(_:inRange:)`
     */
    public func rangedCharacterAttributesAtIndex(index: Int) -> (CharacterAttributeSet, Range<Int>) {
        var range = NSRange()
        let attributes = attributesAtIndex(index, effectiveRange: &range)
        return (CharacterAttributeSetFromDictionary(attributes), range.toRange()!)
    }

    /**
     Retrieves the character attributes at the specified index and the longest effective range over which the attributes are applied within the supplied range limit.
     - parameter index: Index in string of character with desired attributes.
     - parameter rangeLimit: The maximum range extent to use for the returned range.
     - returns: The character attributes at the specified index, if any, and the range over which the attributes are applied.
     */
    public func maximumRangedCharacterAttributesAtIndex(index: Int, inRange rangeLimit: Range<Int>) -> (CharacterAttributeSet, Range<Int>) {
        var range = NSRange()
        let attributes = attributesAtIndex(index, longestEffectiveRange: &range, inRange: ConvertIntRangetoNSRange(rangeLimit))

        return (CharacterAttributeSetFromDictionary(attributes), range.toRange()!)
    }

}

//  MARK: - Subscripting

public extension NSAttributedString {

    /**
     Retrieves the character attribute at the specified index identifiable by the provided attribute name.
     - parameter index: Index in string of character with desired attribute.
     - parameter attributeName: Name of character attribute to retrieve.
     - returns: The character attribute identified by the name and index, if any.
     */
    public subscript(index: Int, named name: String) -> CharacterAttribute? {
        return characterAttributeAtIndex(index, named: name)
    }

    /**
     Retrieves the set of character attributes at the specified index.
     - parameter index: Index in string of character with desired attributes.
     - returns: The set of character attributes in use at the provided index, if any.
     */
    public subscript(index: Int) -> CharacterAttributeSet {
        return characterAttributesAtIndex(index)
    }

    /**
     Retrieves a substring via subscripting using the system method `attributedSubstringFromRange(_:)`.
     - parameter range: The range of the desired substring in this attributed string.
     - returns: The attributed string contained at the desired location.
     */
    public subscript(range: Range<Int>) -> NSAttributedString {
        return attributedSubstringFromRange(ConvertIntRangetoNSRange(range))
    }

}

private func ConvertIntRangetoNSRange(range: Range<Int>) -> NSRange {
    let start = range.startIndex
    return NSRange(location: start, length: range.endIndex - start)
}
