//
//  CharacterAttribute.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 10/20/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import UIKit

public enum CharacterAttribute {

    case Font(UIFont)
    case ParagraphStyle(NSParagraphStyle)
    case ForegroundColor(UIColor)
    case BackgroundColor(UIColor)
    case UseLigatures(Bool)
    case Kern(CGFloat)
    case StrikethroughStyle(NSUnderlineStyle)
    case UnderlineStyle(NSUnderlineStyle)
    case StrokeColor(UIColor)
    case StrokeWidth(CGFloat)
    case Shadow(NSShadow)
    case TextEffect(String)
    case Attachment(NSTextAttachment)
    case Link(NSURL)
    case BaselineOffset(CGFloat)
    case StrikethroughColor(UIColor)
    case UnderlineColor(UIColor)
    case Obliqueness(CGFloat)
    case Expansion(CGFloat)
    case WritingDirection([Int])
    case UseVerticalGlyphForm(Bool)

    public init?(name: String, value: AnyObject) {
        switch name {
        case NSFontAttributeName:
            guard let font = value as? UIFont else { return nil }
            self = .Font(font)

        case NSParagraphStyleAttributeName:
            guard let style = value as? NSParagraphStyle else { return nil }
            self = .ParagraphStyle(style)

        case NSForegroundColorAttributeName:
            guard let color = value as? UIColor else { return nil }
            self = .ForegroundColor(color)

        case NSBackgroundColorAttributeName:
            guard let color = value as? UIColor else { return nil }
            self = .BackgroundColor(color)

        case NSLigatureAttributeName:
            guard let shouldUseLigatures = value as? Bool else { return nil }
            self = .UseLigatures(shouldUseLigatures)

        case NSKernAttributeName:
            guard let kern = value as? CGFloat else { return nil }
            self = .Kern(kern)

        case NSStrikethroughStyleAttributeName:
            guard let boxedStyle = value as? NSNumber,
                let style = NSUnderlineStyle(rawValue: boxedStyle.integerValue) else { return nil }
            self = .StrikethroughStyle(style)

        case NSUnderlineStyleAttributeName:
            guard let boxedStyle = value as? NSNumber,
                let style = NSUnderlineStyle(rawValue: boxedStyle.integerValue) else { return nil }
            self = .UnderlineStyle(style)

        case NSStrokeColorAttributeName:
            guard let color = value as? UIColor else { return nil }
            self = .StrokeColor(color)

        case NSStrokeWidthAttributeName:
            guard let width = value as? CGFloat else { return nil }
            self = .StrokeWidth(width)

        case NSShadowAttributeName:
            guard let shadow = value as? NSShadow else { return nil }
            self = .Shadow(shadow)

        case NSTextEffectAttributeName:
            guard let effect = value as? String else { return nil }
            self = .TextEffect(effect)

        case NSAttachmentAttributeName:
            guard let attachment = value as? NSTextAttachment else { return nil }
            self = .Attachment(attachment)

        case NSLinkAttributeName:
            guard let link = value as? NSURL else { return nil }
            self = .Link(link)

        case NSBaselineOffsetAttributeName:
            guard let offset = value as? CGFloat else { return nil }
            self = .BaselineOffset(offset)

        case NSStrikethroughColorAttributeName:
            guard let color = value as? UIColor else { return nil }
            self = .StrikethroughColor(color)

        case NSUnderlineColorAttributeName:
            guard let color = value as? UIColor else { return nil }
            self = .UnderlineColor(color)

        case NSObliquenessAttributeName:
            guard let obliqueness = value as? CGFloat else { return nil }
            self = .Obliqueness(obliqueness)

        case NSExpansionAttributeName:
            guard let expansion = value as? CGFloat else { return nil }
            self = .Expansion(expansion)

        case NSWritingDirectionAttributeName:
            guard let overrides = value as? [Int] else { return nil }
            self = .WritingDirection(overrides)

        case NSVerticalGlyphFormAttributeName:
            guard let shouldUseVerticalGlyphForm = value as? Bool else { return nil }
            self = .UseVerticalGlyphForm(shouldUseVerticalGlyphForm)

        default:
            return nil
        }
    }

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
}
