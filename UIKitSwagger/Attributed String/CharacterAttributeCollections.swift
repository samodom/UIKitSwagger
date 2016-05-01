//
//  CharacterAttributeCollections.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/19/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import Foundation

/**
 Type alias for a set of character attributes.
 */
public typealias CharacterAttributeSet = Set<CharacterAttribute>

/**
 Type alias for the attribute dictionary used by attributed strings.
 */
public typealias CharacterAttributeDictionary = [String: AnyObject]


/**
 Produces a set of character attributes representing each key/value pair in the provided dictionary.
 - Parameter attributeDictionary: A dictionary of character attributes.
 - Returns: A set of character attributes derived from the dictionary members.
 */
public func CharacterAttributeSetFromDictionary(attributeDictionary: CharacterAttributeDictionary) -> CharacterAttributeSet {
    return attributeDictionary.reduce(CharacterAttributeSet()) {
        if let attribute = CharacterAttribute(name: $1.0, value: $1.1) {
            return $0.union([attribute])
        }

        return $0
    }
}

public extension CollectionType where Generator.Element == CharacterAttribute {

    /**
     Produces an attribute dictionary from a collection containing character attributes.
     */
    public var attributeDictionary: CharacterAttributeDictionary {
        return reduce(CharacterAttributeDictionary()) { dictionary, attribute -> CharacterAttributeDictionary in
            var dictionary = dictionary
            let (key, value) = attribute.keyValuePair
            dictionary[key] = value
            return dictionary
        }
    }
    
}
