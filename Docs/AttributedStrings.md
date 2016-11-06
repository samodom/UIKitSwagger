Attributed Strings
==================

The existing APIs for `NSAttributedString` have been shadowed with a full complement of methods that make use of the `CharacterAttribute` type.

> The typealias `CharacterAttributeDictionary` has been defined to represent the  common type `[String: Any]`.


## Creating attributed strings

| Method | `init(string:characterAttributes:)` |
|:-------|:------------------------------------|
| **Description** | Uses any collection that generates `CharacterAttribute` elements to create an attributed string.<br><br>*Compare to `init(string:attributes:)`.*|


## Retrieving attributes

| Method | `characterAttribute(named:at:) -> CharacterAttribute?`
|:--|:--|
| **Description** | *Compare to `attribute(_:at:effectiveRange) -> AnyObject?`* |

| Method | `characterAttributes(at:) -> CharacterAttributeSet` |
|:--|:--|
| **Description** | *Compare to `attributes(at:effectiveRange:)`* |


## Retrieving attributes with ranges

| Method | `rangedCharacterAttribute(named:at:) -> (CharacterAttribute?, Range<Int>)` |
|:--|:--|
| **Description** | *Compare to `attribute(_:atIndex:effectiveRange) -> AnyObject?`* |

| Method | `maximumRangedCharacterAttribute(named:at:in:) -> (CharacterAttribute?, Range<Int>)` |
|:--|:--|
| **Description** | *Compare to `attribute(_:at:longestEffectiveRange:in:)`* |


## Mutable Attributed Strings

Mutable attributed strings have several mutating methods in addition to the various methods inherited from the immutable variant.

| Method |  `setCharacterAttributes(attributes:over:)` |
|:--|:--|
| **Description** | Sets the attributes for the characters in the specified range to the attributes specified in any collection generating elements of type `CharacterAttribute`. |

| Method | `addCharacterAttribute(attribute:over:)` |
|:--|:--|
| **Description** | Adds a character attribute to an attributed string over a specified range. |

| Method |  `addCharacterAttributes(attributes:over:)` |
|:--|:--|
| **Description** | Adds any collection generating elements of type `CharacterAttribute` to an attributed string over a specified range. |
