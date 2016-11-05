Character Attributes
====================

When working with attributed strings, there are a number of keys that are used to populate attribute dictionaries.  The `CharacterAttribute` enumerated type encapsulates the various types of key/value pairs that are used in these attribute dictionaries and can be used in place of these dictionaries.


| Enumeration case | Dictionary key |
|:-----------------|:---------------|
| `font(UIFont)` | `NSFontAttributeName` |
| `paragraphStyle(NSParagraphStyle)` | `NSParagraphStyleAttributeName` |
| `foregroundColor(UIColor)` | `NSForegroundColorAttributeName` |
| `backgroundColor(UIColor)` | `NSBackgroundColorAttributeName` |
| `useLigatures(Bool)` | `NSLigatureAttributeName` |
| `kern(CGFloat)` | `NSKernAttributeName` |
| `strikethroughStyle(NSUnderlineStyle)` | `NSStrikethroughStyleAttributeName` |
| `underlineStyle(NSUnderlineStyle)` | `NSUnderlineStyleAttributeName` |
| `strokeColor(UIColor)` | `NSStrokeColorAttributeName` |
| `strokeWidth(CGFloat)` | `NSStrokeWidthAttributeName` |
| `shadow(NSShadow)` | `NSShadowAttributeName` |
| `textEffect(String)` | `NSTextEffectAttributeName` |
| `attachment(NSTextAttachment)` | `NSAttachmentAttributeName` |
| `link(URL)` | `NSLinkAttributeName` |
| `baselineOffset(CGFloat)` | `NSBaselineOffsetAttributeName` |
| `underlineColor(UIColor)` | `NSUnderlineColorAttributeName` |
| `strikethroughColor(UIColor)` | `NSStrikethroughColorAttributeName` |
| `obliqueness(CGFloat)` | `NSObliquenessAttributeName` |
| `expansion(CGFloat)` | `NSExpansionAttributeName` |
| `writingDirection([Int]])` | `NSWritingDirectionAttributeName` |
| `useVerticalGlyphForm(Bool)` | `NSVerticalGlyphFormAttributeName` |


## Constructing an attribute from its key/value pair

| Method | `init?(name: String, value: AnyObject)` |
|:--|:--|
| **Description** | Creates an attribute from a key/value pair if possible. |


## Attribute methods

| Method | `func keyValuePair() -> (key: String, value: Any)` |
|:--|:--|
| **Description** | Provides the key and value that would be used in an attribute dictionary. |


## Collections of character attributes

A set of character attributes can be created from an attribute dictionary using the `characterAttributeSet()` method on `CharacterAttributeDictionary`.

Any collection with `CharacterAttribute` elements can be converted into a `CharacterAttributeDictionary` using the method `attributeDictionary()`.
