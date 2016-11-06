//
//  CharacterAttribute.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 10/20/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import UIKit


/// Enumerated type representing the various dictionary elements used with attributed string creation and manipulation.
public enum CharacterAttribute {

    /// Attribute case corresponding to the dictionary key `NSFontAttributeName`.
    case font(UIFont)

    /// Attribute case corresponding to the dictionary key `NSParagraphStyleAttributeName`.
    case paragraphStyle(NSParagraphStyle)

    /// Attribute case corresponding to the dictionary key `NSForegroundColorAttributeName`.
    case foregroundColor(UIColor)

    /// Attribute case corresponding to the dictionary key `NSForegroundColorAttributeName`.
    case backgroundColor(UIColor)

    /// Attribute case corresponding to the dictionary key `NSLigatureAttributeName`.
    case useLigatures(Bool)

    /// Attribute case corresponding to the dictionary key `NSKernAttributeName`.
    case kern(CGFloat)

    /// Attribute case corresponding to the dictionary key `NSStrikethroughStyleAttributeName`.
    case strikethroughStyle(NSUnderlineStyle)

    /// Attribute case corresponding to the dictionary key `NSUnderlineStyleAttributeName`.
    case underlineStyle(NSUnderlineStyle)

    /// Attribute case corresponding to the dictionary key `NSStrokeColorAttributeName`.
    case strokeColor(UIColor)

    /// Attribute case corresponding to the dictionary key `NSStrokeWidthAttributeName`.
    case strokeWidth(CGFloat)

    /// Attribute case corresponding to the dictionary key `NSShadowAttributeName`.
    case shadow(NSShadow)

    /// Attribute case corresponding to the dictionary key `NSTextEffectAttributeName`.
    case textEffect(String)

    /// Attribute case corresponding to the dictionary key `NSAttachmentAttributeName`.
    case attachment(NSTextAttachment)

    /// Attribute case corresponding to the dictionary key `NSLinkAttributeName`.
    case link(URL)

    /// Attribute case corresponding to the dictionary key `NSBaselineOffsetAttributeName`.
    case baselineOffset(CGFloat)

    /// Attribute case corresponding to the dictionary key `NSStrikethroughColorAttributeName`.
    case strikethroughColor(UIColor)

    /// Attribute case corresponding to the dictionary key `NSUnderlineColorAttributeName`.
    case underlineColor(UIColor)

    /// Attribute case corresponding to the dictionary key `NSObliquenessAttributeName`.
    case obliqueness(CGFloat)

    /// Attribute case corresponding to the dictionary key `NSExpansionAttributeName`.
    case expansion(CGFloat)

    /// Attribute case corresponding to the dictionary key `NSWritingDirectionAttributeName`.
    case writingDirection([Int])

    /// Attribute case corresponding to the dictionary key `NSVerticalGlyphFormAttributeName`.
    case useVerticalGlyphForm(Bool)


    /// Initializes a new character attribute using the provided key and associated value.
    /// - parameter name: Must be a valid attribute dictionary key.
    /// - parameter value: Must be a valid instance of the appropriate associated type.
    public init?(name: String, value: Any) {
        switch name {
        case NSFontAttributeName:
            guard let font = value as? UIFont else { return nil }
            self = .font(font)

        case NSParagraphStyleAttributeName:
            guard let style = value as? NSParagraphStyle else { return nil }
            self = .paragraphStyle(style)

        case NSForegroundColorAttributeName:
            guard let color = value as? UIColor else { return nil }
            self = .foregroundColor(color)

        case NSBackgroundColorAttributeName:
            guard let color = value as? UIColor else { return nil }
            self = .backgroundColor(color)

        case NSLigatureAttributeName:
            guard let shouldUseLigatures = value as? Bool else { return nil }
            self = .useLigatures(shouldUseLigatures)

        case NSKernAttributeName:
            guard let kern = value as? CGFloat else { return nil }
            self = .kern(kern)

        case NSStrikethroughStyleAttributeName:
            guard let boxedStyle = value as? NSNumber,
                let style = NSUnderlineStyle(rawValue: boxedStyle.intValue) else { return nil }
            self = .strikethroughStyle(style)

        case NSUnderlineStyleAttributeName:
            guard let boxedStyle = value as? NSNumber,
                let style = NSUnderlineStyle(rawValue: boxedStyle.intValue) else { return nil }
            self = .underlineStyle(style)

        case NSStrokeColorAttributeName:
            guard let color = value as? UIColor else { return nil }
            self = .strokeColor(color)

        case NSStrokeWidthAttributeName:
            guard let width = value as? CGFloat else { return nil }
            self = .strokeWidth(width)

        case NSShadowAttributeName:
            guard let shadow = value as? NSShadow else { return nil }
            self = .shadow(shadow)

        case NSTextEffectAttributeName:
            guard let effect = value as? String else { return nil }
            self = .textEffect(effect)

        case NSAttachmentAttributeName:
            guard let attachment = value as? NSTextAttachment else { return nil }
            self = .attachment(attachment)

        case NSLinkAttributeName:
            guard let link = value as? URL else { return nil }
            self = .link(link)

        case NSBaselineOffsetAttributeName:
            guard let offset = value as? CGFloat else { return nil }
            self = .baselineOffset(offset)

        case NSStrikethroughColorAttributeName:
            guard let color = value as? UIColor else { return nil }
            self = .strikethroughColor(color)

        case NSUnderlineColorAttributeName:
            guard let color = value as? UIColor else { return nil }
            self = .underlineColor(color)

        case NSObliquenessAttributeName:
            guard let obliqueness = value as? CGFloat else { return nil }
            self = .obliqueness(obliqueness)

        case NSExpansionAttributeName:
            guard let expansion = value as? CGFloat else { return nil }
            self = .expansion(expansion)

        case NSWritingDirectionAttributeName:
            guard let overrides = value as? [Int] else { return nil }
            self = .writingDirection(overrides)

        case NSVerticalGlyphFormAttributeName:
            guard let shouldUseVerticalGlyphForm = value as? Bool else { return nil }
            self = .useVerticalGlyphForm(shouldUseVerticalGlyphForm)

        default:
            return nil
        }
    }

}


extension CharacterAttribute: Hashable {

    public var hashValue: Int {
        return keyValuePair().key.hashValue
    }

}


public func ==(lhs: CharacterAttribute, rhs: CharacterAttribute) -> Bool {
    switch (lhs, rhs) {
    case let (.font(font1), .font(font2)):
        return font1 == font2

    case let (.paragraphStyle(style1), .paragraphStyle(style2)):
        return style1 == style2

    case let (.foregroundColor(color1), .foregroundColor(color2)):
        return color1 == color2

    case let (.backgroundColor(color1), .backgroundColor(color2)):
        return color1 == color2

    case let (.useLigatures(flag1), .useLigatures(flag2)):
        return flag1 == flag2

    case let (.kern(kern1), .kern(kern2)):
        return kern1 == kern2

    case let (.strikethroughStyle(style1), .strikethroughStyle(style2)):
        return style1 == style2

    case let (.underlineStyle(style1), .underlineStyle(style2)):
        return style1 == style2

    case let (.strokeColor(color1), .strokeColor(color2)):
        return color1 == color2

    case let (.strokeWidth(width1), .strokeWidth(width2)):
        return width1 == width2

    case let (.shadow(shadow1), .shadow(shadow2)):
        return shadow1 == shadow2

    case let (.textEffect(effect1), .textEffect(effect2)):
        return effect1 == effect2

    case let (.attachment(attachment1), .attachment(attachment2)):
        return attachment1 == attachment2

    case let (.link(link1), .link(link2)):
        return link1 == link2

    case let (.baselineOffset(offset1), .baselineOffset(offset2)):
        return offset1 == offset2

    case let (.strikethroughColor(color1), .strikethroughColor(color2)):
        return color1 == color2

    case let (.underlineColor(color1), .underlineColor(color2)):
        return color1 == color2

    case let (.obliqueness(obliqueness1), .obliqueness(obliqueness2)):
        return obliqueness1 == obliqueness2

    case let (.expansion(expansion1), .expansion(expansion2)):
        return expansion1 == expansion2

    case let (.writingDirection(overrides1), .writingDirection(overrides2)):
        return overrides1 == overrides2

    case let (.useVerticalGlyphForm(useVertical1), .useVerticalGlyphForm(useVertical2)):
        return useVertical1 == useVertical2

    default:
        return false
    }

}
