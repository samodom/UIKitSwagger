//
//  AttributedString.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 10/23/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import Foundation

public extension NSAttributedString {

    public convenience init
        <C: CollectionType where C.Generator.Element == CharacterAttribute>
        (string: String, characterAttributes: C) {
        self.init(string: string, attributes: characterAttributes.attributeDictionary)
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
