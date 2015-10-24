Character Attribute
===================

When working with attributed strings, there are a number of keys that are used to populate attribute dictionaries.  The `CharacterAttribute` enumerated type encapsulates the various types of key/value pairs that are used in these attribute dictionaries and can be used in place of these dictionaries.

`enum CharacterAttribute: Hashable`

### Attributes

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


### Using with existing APIs

> The typealias `CharacterAttributeDictionary` has been defined to represent the type `[String: AnyObject]`.

In order to use the enumeration with attributed string creation and manipulation, several methods and properties are provided.

#### `CharacterAttribute`

* `init?(name: String, value: AnyObject)`
> Creates an attribute from a key/value pair if possible.

* `var keyValuePair: (String, AnyObject)`
> Provides the key and value that would be used in an attribute dictionary.

* `var attributeDictionary: CharacterAttributeDictionary`
> Represents the attribute as a single-element dictionary.


#### `NSAttributedString`

* `init(string:attributes:)`
> Uses any collection whose elements are of type `CharacterAttribute` to create an attributed string.


#### `NSMutableAttributedString`

* `init(string:attributes:)`
> Inherited from `NSAttributedString`

* `addAttribute(_:value:range:)`
> Adds a character attribute to an attributed string over a specified range.

* `addAttributes(_:range:)`
> Adds any collection whose elements are of type `CharacterAttribute` to an attributed string over a specified range.

* `setAttributes(_:range:)`
> Sets any collection whose elements are of type `CharacterAttribute` to an attributed string over a specified range.
