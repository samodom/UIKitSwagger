//
//  CharacterAttributeDictionary.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 10/23/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import UIKit

public extension CharacterAttribute {

    /// Provides a key/value pair that can be used in an attribute dictionary.
    /// - returns: a string representing the case and the attribute's associated value
    public func keyValuePair() -> (key: String, value: Any) {
        let key: String
        let value: Any
        switch self {
        case .font(let font):
            key = NSFontAttributeName
            value = font

        case .paragraphStyle(let style):
            key = NSParagraphStyleAttributeName
            value = style

        case .foregroundColor(let color):
            key = NSForegroundColorAttributeName
            value = color

        case .backgroundColor(let color):
            key = NSBackgroundColorAttributeName
            value = color

        case .useLigatures(let shouldUseLigatures):
            key = NSLigatureAttributeName
            value = shouldUseLigatures

        case .kern(let kern):
            key = NSKernAttributeName
            value = kern

        case .strikethroughStyle(let style):
            key = NSStrikethroughStyleAttributeName
            value = style.rawValue

        case .underlineStyle(let style):
            key = NSUnderlineStyleAttributeName
            value = style.rawValue

        case .strokeColor(let color):
            key = NSStrokeColorAttributeName
            value = color

        case .strokeWidth(let width):
            key = NSStrokeWidthAttributeName
            value = width

        case .shadow(let shadow):
            key = NSShadowAttributeName
            value = shadow

        case .textEffect(let effect):
            key = NSTextEffectAttributeName
            value = effect

        case .attachment(let attachment):
            key = NSAttachmentAttributeName
            value = attachment

        case .link(let link):
            key = NSLinkAttributeName
            value = link

        case .baselineOffset(let offset):
            key = NSBaselineOffsetAttributeName
            value = offset

        case .strikethroughColor(let color):
            key = NSStrikethroughColorAttributeName
            value = color

        case .underlineColor(let color):
            key = NSUnderlineColorAttributeName
            value = color

        case .obliqueness(let obliqueness):
            key = NSObliquenessAttributeName
            value = obliqueness

        case .expansion(let expansion):
            key = NSExpansionAttributeName
            value = expansion
            
        case .writingDirection(let overrides):
            key = NSWritingDirectionAttributeName
            value = overrides
            
        case .useVerticalGlyphForm(let shouldUseVerticalGlyphForm):
            key = NSVerticalGlyphFormAttributeName
            value = shouldUseVerticalGlyphForm
        }
        
        return (key, value)
    }

}
