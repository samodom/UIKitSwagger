Character Attribute
===================

When working with attributed strings, there are a number of keys that are used to populate attribute dictionaries.  The `CharacterAttribute` type encapsulates the various types of key/value pairs that are used in the attribute dictionaries and provides an easy means to create said dictionaries.

### Attributes

```swift
enum CharacterAttribute: (String, AnyObject) {
    Font(UIFont)
    ParagraphStyle(NSParagraphStyle)
    ForegroundColor(UIColor)
    BackgroundColor(UIColor)
    UseLigatures(Bool)
    Kern(CGFloat)
    StrikethroughStyle(NSUnderlineStyle)
    UnderlineStyle(NSUnderlineStyle)
    StrokeColor(UIColor)
    StrokeWidth(CGFloat)
    Shadow(NSShadow)
    TextEffect(String)
    Attachment(NSTextAttachment)
    Link(NSURL)
    BaselineOffset(CGFloat)
    UnderlineColor(UIColor)
    StrikethroughColor(UIColor)
    Obliqueness(CGFloat)
    Expansion(CGFloat)
    WritingDirection([Int]])
    UseVerticalGlyphForm(Bool)
}
```

Apple's character attribute keys (all are of type `String`):
* NSFontAttributeName
* NSParagraphStyleAttributeName
* NSForegroundColorAttributeName
* NSBackgroundColorAttributeName
* NSLigatureAttributeName
* NSKernAttributeName
* NSStrikethroughStyleAttributeName
* NSUnderlineStyleAttributeName
* NSStrokeColorAttributeName
* NSStrokeWidthAttributeName
* NSShadowAttributeName
* NSTextEffectAttributeName
* NSAttachmentAttributeName
* NSLinkAttributeName
* NSBaselineOffsetAttributeName
* NSUnderlineColorAttributeName
* NSStrikethroughColorAttributeName
* NSObliquenessAttributeName
* NSExpansionAttributeName
* NSWritingDirectionAttributeName
* NSVerticalGlyphFormAttributeName

Each of these keys has a corresponding case in the `CharacterAttribute` enumeration along with an associated value of the appropriate type.


### Dictionaries

In order to use the enumeration with attributed string creation and manipulation, several methods are provided.

1.  The first is the `keyValuePair` property of the enumeration.  It provides the key/value pair that would be used in an attribute dictionary.

1.  The second is the `init?(name: String, value: AnyObject)` initializer that converts a key/value pair into an enumeration value if possible.

1.  The third is a property for representing the attribute as a single-element dictionary: `var attributeDictionary: [String: AnyObject]`.

1.  The fourth is a convenience property on arrays of character attributes: `attributeDictionary: [String: AnyObject]`.
