//
//  CharacterAttributeCollections.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/19/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import Foundation


/// Type alias for the attribute dictionary used by attributed strings.
public typealias CharacterAttributeDictionary = [String: Any]


public extension Sequence where Iterator.Element == (key: String, value: Any) {

    /// Produces a set of character attributes representing each key/value pair in the provided dictionary.
    /// - returns: A set of character attributes derived from the dictionary members.
    public func characterAttributeSet() -> Set<CharacterAttribute> {
        return reduce(Set<CharacterAttribute>()) {
            if let attribute = CharacterAttribute(name: $1.0, value: $1.1) {
                return $0.union([attribute])
            }
            
            return $0
        }
    }

}


public extension Collection where Iterator.Element == CharacterAttribute {

    /// Produces an attribute dictionary from a collection containing character attributes.
    /// - returns: A dictionary of key-value pairs representing character attributes
    public func attributeDictionary() -> CharacterAttributeDictionary {
        return reduce(CharacterAttributeDictionary()) {
            (dictionary, attribute) -> CharacterAttributeDictionary in
            var newDictionary = dictionary
            let (key, value) = attribute.keyValuePair()
            newDictionary[key] = value
            return newDictionary
        }
    }
    
}
