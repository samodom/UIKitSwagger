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


## Collections of attributes

A set of character attributes can be created from an attribute dictionary using the `CharacterAttributeSetFromDictionary()` function.

Any collection with `CharacterAttribute` elements can be converted into a `CharacterAttributeDictionary` using the property `attributeDictionary`.

## Using with existing APIs

In order to use the enumeration with attributed string creation and manipulation, several methods and properties are provided.

### `CharacterAttribute`
> The typealias `CharacterAttributeDictionary` has been defined to represent the type `[String: AnyObject]`.

| Method | `init?(name: String, value: AnyObject)` |
|:--|:--|
| **Description** | Creates an attribute from a key/value pair if possible. |

| Property | `var keyValuePair: (String, AnyObject)` |
|:--|:--|
| **Description** | Provides the key and value that would be used in an attribute dictionary. |

| Property | `var attributeDictionary: CharacterAttributeDictionary` |
|:--|:--|
| **Description** | Represents the attribute as a single-element dictionary. |


### `NSAttributedString`
> The typealias `CharacterAttributeSet` has been defined to represent a set of character attributes:
>
> `typealias CharacterAttributeSet = Set<CharacterAttribute>`
>
> The typealias `AttributedCharacterRange` has been defined to represent the results pair for attribute searches based on a character index:
>
> `typealias AttributedCharacterRange = (attributes: CharacterAttributeSet, range: Range<String.Index>)`

#### Constructing an attributed string

| Method | `init(string:characterAttributes:)` |
|:-------|:------------------------------------|
| **Description** | Uses any collection that generates `CharacterAttribute` elements to create an attributed string.  Compare to `init(string:attributes:)`|


#### Retrieving attributes

| Method | `characterAttributeAtIndex(_:named:) -> CharacterAttribute?`
|:--|:--|
| **Description** | Returns the named character attribute of the character at a given index.  Compare to `attribute(_:atIndex:effectiveRange) -> AnyObject?`. |
| **Subscript** | Subscripting may be used in the following form: `[Int, named: String]` |

| Method | `characterAttributesAtIndex(_) -> CharacterAttributeSet` |
|:--|:--|
| **Description** | Returns all character attributes defined on the attributed string at the specified index. |
| **Subscript** | Subscripting may be used in the following form: `[Int]`. |

| Method | `rangedCharacterAttributeAtIndex(_:named:) -> (CharacterAttribute?, Range<String.CharacterView.Index>?)` |
|:--|:--|
| **Description** | Returns the named character attribute of the character at a given index and the range over which the attribute applies.  If the attribute does not exist at the index, the range represents the range over which the attribute is not applied.  The range isn’t necessarily the maximum range covered by the attribute and its extent is implementation-dependent.  If you need the maximum range, use `maximumRangedCharacterAttributeAtIndex:named:inRange:``.  Compare to `attribute(_:atIndex:effectiveRange) -> AnyObject?`. |

| Method | `maximumRangedCharacterAttributeAtIndex(_:named:) -> (CharacterAttribute?, Range<String.CharacterView.Index>?)` |
|:--|:--|
| **Description** | Returns the named character attribute of the character at a given index and the full range over which the attribute applies.  Compare to `attribute(_:atIndex:longestEffectiveRange:inRange:)`. |
