Character Attributes
====================

When working with attributed strings, there are a number of keys that are used to populate attribute dictionaries.  The `CharacterAttribute` enumerated type encapsulates the various types of key/value pairs that are used in these attribute dictionaries and can be used in place of these dictionaries.


| Enumeration case | Dictionary key |
|:-----------------|:---------------|
| `Font(UIFont)` | `NSFontAttributeName` |
| `ParagraphStyle(NSParagraphStyle)` | `NSParagraphStyleAttributeName` |
| `ForegroundColor(UIColor)` | `NSForegroundColorAttributeName` |
| `BackgroundColor(UIColor)` | `NSBackgroundColorAttributeName` |
| `UseLigatures(Bool)` | `NSLigatureAttributeName` |
| `Kern(CGFloat)` | `NSKernAttributeName` |
| `StrikethroughStyle(NSUnderlineStyle)` | `NSStrikethroughStyleAttributeName` |
| `UnderlineStyle(NSUnderlineStyle)` | `NSUnderlineStyleAttributeName` |
| `StrokeColor(UIColor)` | `NSStrokeColorAttributeName` |
| `StrokeWidth(CGFloat)` | `NSStrokeWidthAttributeName` |
| `Shadow(NSShadow)` | `NSShadowAttributeName` |
| `TextEffect(String)` | `NSTextEffectAttributeName` |
| `Attachment(NSTextAttachment)` | `NSAttachmentAttributeName` |
| `Link(NSURL)` | `NSLinkAttributeName` |
| `BaselineOffset(CGFloat)` | `NSBaselineOffsetAttributeName` |
| `UnderlineColor(UIColor)` | `NSUnderlineColorAttributeName` |
| `StrikethroughColor(UIColor)` | `NSStrikethroughColorAttributeName` |
| `Obliqueness(CGFloat)` | `NSObliquenessAttributeName` |
| `Expansion(CGFloat)` | `NSExpansionAttributeName` |
| `WritingDirection([Int]])` | `NSWritingDirectionAttributeName` |
| `UseVerticalGlyphForm(Bool)` | `NSVerticalGlyphFormAttributeName` |


## Constructing an attribute from its key/value pair

| Method | `init?(name: String, value: AnyObject)` |
|:--|:--|
| **Description** | Creates an attribute from a key/value pair if possible. |


## Attribute properties

| Property | `var keyValuePair: (String, AnyObject)` |
|:--|:--|
| **Description** | Provides the key and value that would be used in an attribute dictionary. |

| Property | `var attributeDictionary: CharacterAttributeDictionary` |
|:--|:--|
| **Description** | Represents the attribute as a single-element dictionary. |


## Collections of character attributes

> The typealias `CharacterAttributeSet` has been defined to represent a set of character attributes:
>
> `typealias CharacterAttributeSet = Set<CharacterAttribute>`

A set of character attributes can be created from an attribute dictionary using the `CharacterAttributeSetFromDictionary` function.

Any collection with `CharacterAttribute` elements can be converted into a `CharacterAttributeDictionary` using the property `attributeDictionary`.
