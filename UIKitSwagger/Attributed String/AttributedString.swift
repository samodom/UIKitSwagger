//
//  AttributedString.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 10/23/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import Foundation

public typealias CharacterAttributeRun = (
    attributes: CharacterAttributeSet,
    range: Range<String.Index>
)

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
    public func characterAttributeAtIndex(index: String.Index, named attributeName: String) -> CharacterAttribute? {
        guard let value = attribute(
            attributeName,
            atIndex: IntegerFromIndex(index),
            effectiveRange: nil
            ) else {
                return nil
        }

        return CharacterAttribute(name: attributeName, value: value)
    }

    /**
     Retrieves the set of character attributes at the specified index.
     - parameter index: Index in string of character with desired attributes.
     - returns: The character attributes identified by the name and index, if any.
     */
    public func characterAttributesAtIndex(index: String.Index) -> CharacterAttributeSet {
        let attributes = attributesAtIndex(IntegerFromIndex(index), effectiveRange: nil)

        return CharacterAttributeSetFromDictionary(attributes)
    }

    /**
     Retrieves the named character attribute or all character attributes at the specified index identifiable by the provided attribute name, if provided, and the range over which the attribute(s) is (are) applied.
     - parameter index: Index in string of character with desired attribute(s).
     - parameter attributeName: Name of character attribute to retrieve or `nil` to retrieve all attributes.
     - returns: The character attribute run identified by the index and name, if any, and the range over which the attribute(s) is (are) applied.
     - note: The range isn’t necessarily the maximum range covered by the attribute(s) and its extent is implementation-dependent.  If you need the maximum range, use `longestCharacterAttributeRunAtIndex(_:named:inRange:)`.
     */
    public func characterAttributeRunAtIndex(index: String.Index, named attributeName: String? = nil) -> CharacterAttributeRun {
        var nsRange = NSRange()
        var attributeDictionary = CharacterAttributeDictionary()

        if let name = attributeName {
            if let value = attribute(name, atIndex: IntegerFromIndex(index), effectiveRange: &nsRange) {
                attributeDictionary = [name: value]
            }
        }

        else {
            attributeDictionary = attributesAtIndex(IntegerFromIndex(index), effectiveRange: &nsRange)
        }

        return (CharacterAttributeSetFromDictionary(attributeDictionary), IndexRangeFromNSRange(nsRange))
    }

    /**
     Retrieves the named character attribute or all character attributes at the specified index identifiable by the provided attribute name, if provided, and the longest effective range over which the attribute(s) is (are) applied within the supplied range limit.
     - parameter index: Index in string of character with desired attribute(s).
     - parameter rangeLimit: The maximum range extent to use for the returned range.
     - parameter attributeName: Name of character attribute to retrieve or `nil` to retrieve all attributes.
     - returns: The character attribute run identified by the index and name, if any, and the range over which the attribute(s) is (are) applied.
     */
    public func longestCharacterAttributeRunAtIndex(index: String.Index, inRange rangeLimit: Range<String.Index>, named attributeName: String? = nil) -> CharacterAttributeRun {
        var nsRange = NSRange()
        var attributeDictionary = CharacterAttributeDictionary()

        if let name = attributeName {
            if let value = attribute(
                name,
                atIndex: IntegerFromIndex(index),
                longestEffectiveRange: &nsRange,
                inRange: NSRangeFromIndexRange(rangeLimit)
                ) {
                attributeDictionary = [name: value]
            }
        }

        else {
            attributeDictionary = attributesAtIndex(IntegerFromIndex(index), effectiveRange: &nsRange)
        }

        return (CharacterAttributeSetFromDictionary(attributeDictionary), IndexRangeFromNSRange(nsRange))
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
    public subscript(index: String.Index, named name: String) -> CharacterAttribute? {
        return characterAttributeAtIndex(index, named: name)
    }

    /**
     Retrieves the set of character attributes at the specified index.
     - parameter index: Index in string of character with desired attributes.
     - returns: The set of character attributes in use at the provided index, if any.
     */
    public subscript(index: String.Index) -> CharacterAttributeSet {
        return characterAttributesAtIndex(index)
    }

    /**
     Retrieves a substring via subscripting using the system method `attributedSubstringFromRange(_:)`.
     - parameter range: The range of the desired substring in this attributed string.
     - returns: The attributed string contained at the desired location.
     */
    public subscript(range: Range<String.Index>) -> NSAttributedString {
        return attributedSubstringFromRange(NSRangeFromIndexRange(range))
    }

}


//  MARK: Mutability

public extension NSMutableAttributedString {

    public func setCharacterAttributes<C: CollectionType where C.Generator.Element == CharacterAttribute>(attributes: C, overRange range: Range<String.Index>) {
        setAttributes(attributes.attributeDictionary, range: NSRangeFromIndexRange(range))
    }

    public func addCharacterAttribute(attribute: CharacterAttribute, overRange range: Range<String.Index>) {
        let (key, value) = attribute.keyValuePair
        addAttribute(key, value: value, range: NSRangeFromIndexRange(range))
    }

    public func addCharacterAttributes<C: CollectionType where C.Generator.Element == CharacterAttribute>(attributes: C, overRange range: Range<String.Index>) {
        addAttributes(attributes.attributeDictionary, range: NSRangeFromIndexRange(range))
    }

}

private extension NSAttributedString {

    private func IntegerFromIndex(index: String.Index) -> Int {
        return string.startIndex.distanceTo(index)
    }

    private func NSRangeFromIndexRange(range: Range<String.Index>) -> NSRange {
        let location = string.startIndex.distanceTo(range.startIndex)
        let end = string.startIndex.distanceTo(range.endIndex)
        let length = end - location
        return NSRange(location: location, length: length)
    }

    private func IndexRangeFromNSRange(range: NSRange) -> Range<String.Index> {
        let location = range.location
        let start = string.startIndex.advancedBy(location)
        let end = string.startIndex.advancedBy(location + range.length)
        return start ..< end
    }

}
