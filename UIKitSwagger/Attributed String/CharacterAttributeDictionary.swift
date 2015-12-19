//
//  CharacterAttributeDictionary.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 10/23/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import UIKit

/**
 Type alias for the attribute dictionary used by attributed strings.
 */
public typealias CharacterAttributeDictionary = [String: AnyObject]

public extension CharacterAttribute {

    /**
     Provides a key/value pair that can be used in an attribute dictionary.
     */
    public var keyValuePair: (String, AnyObject) {
        let key: String
        let value: AnyObject
        switch self {
        case .Font(let font):
            key = NSFontAttributeName
            value = font

        case .ParagraphStyle(let style):
            key = NSParagraphStyleAttributeName
            value = style

        case .ForegroundColor(let color):
            key = NSForegroundColorAttributeName
            value = color

        case .BackgroundColor(let color):
            key = NSBackgroundColorAttributeName
            value = color

        case .UseLigatures(let shouldUseLigatures):
            key = NSLigatureAttributeName
            value = shouldUseLigatures

        case .Kern(let kern):
            key = NSKernAttributeName
            value = kern

        case .StrikethroughStyle(let style):
            key = NSStrikethroughStyleAttributeName
            value = style.rawValue

        case .UnderlineStyle(let style):
            key = NSUnderlineStyleAttributeName
            value = style.rawValue

        case .StrokeColor(let color):
            key = NSStrokeColorAttributeName
            value = color

        case .StrokeWidth(let width):
            key = NSStrokeWidthAttributeName
            value = width

        case .Shadow(let shadow):
            key = NSShadowAttributeName
            value = shadow

        case .TextEffect(let effect):
            key = NSTextEffectAttributeName
            value = effect

        case .Attachment(let attachment):
            key = NSAttachmentAttributeName
            value = attachment

        case .Link(let link):
            key = NSLinkAttributeName
            value = link

        case .BaselineOffset(let offset):
            key = NSBaselineOffsetAttributeName
            value = offset

        case .StrikethroughColor(let color):
            key = NSStrikethroughColorAttributeName
            value = color

        case .UnderlineColor(let color):
            key = NSUnderlineColorAttributeName
            value = color

        case .Obliqueness(let obliqueness):
            key = NSObliquenessAttributeName
            value = obliqueness

        case .Expansion(let expansion):
            key = NSExpansionAttributeName
            value = expansion
            
        case .WritingDirection(let overrides):
            key = NSWritingDirectionAttributeName
            value = overrides
            
        case .UseVerticalGlyphForm(let shouldUseVerticalGlyphForm):
            key = NSVerticalGlyphFormAttributeName
            value = shouldUseVerticalGlyphForm
        }
        
        return (key, value)
    }

    /**
     Represents the attribute as a single-element dictionary.
     */
    public var attributeDictionary: CharacterAttributeDictionary {
        return Dictionary(dictionaryLiteral: keyValuePair)
    }
    
}
