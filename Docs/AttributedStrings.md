Attributed Strings
==================

The existing APIs for `NSAttributedString` have been shadowed with a full complement of methods that make use of the `CharacterAttribute` type.

> The typealias `CharacterAttributeDictionary` has been defined to represent the  common type `[String: AnyObject]`.


## Creating attributed strings

| Method | `init(string:characterAttributes:)` |
|:-------|:------------------------------------|
| **Description** | Uses any collection that generates `CharacterAttribute` elements to create an attributed string.<br><br>*Compare to `init(string:attributes:)`.*|


## Substrings

The system method `attributedSubstringFromRange(_:)` can be invoked via subscripting with a range of integers (`Range<Int>`):

```swift
let substring1 = attributedString[3 ..< 8]
let substring2 = attributedString[1 ... 4]
```


## Retrieving attributes

| Method | `characterAttributeAtIndex(_:named:) -> CharacterAttribute?`
|:--|:--|
| **Description** | Returns the named character attribute of the character at a given index.<br><br>*Compare to `attribute(_:atIndex:effectiveRange) -> AnyObject?`.* |
| **Subscript** | Subscripting may be used in the following form: `[Int, named: String]`.<br><br>*Example:*<br>`let attribute = attributedString[4, named: NSFontAttributeName]` |

| Method | `characterAttributesAtIndex(_) -> CharacterAttributeSet` |
|:--|:--|
| **Description** | Returns all character attributes defined on the attributed string at the specified index.<br><br>*Compare to `attributesAtIndex(_:effectiveRange:)`.* |
| **Subscript** | Subscripting may be used in the following form: `[Int]`.<br><br>*Example:*<br>`let attributes = attributedString[4]` |


## Retrieving attributes with ranges

> The typealias `CharacterAttributeRun` has been defined to represent the results pair for character attribute searches based on an index:
>
> ```swift
> typealias CharacterAttributeRun = (
>     attributes: CharacterAttributeSet,
>     range: Range<String.Index>
> )
> ```

| Method | `characterAttributeRunAtIndex(_:named:) -> CharacterAttributeRun` |
|:--|:--|
| **Description** | Returns the named character attribute or all character attributes of the character at a given index and the range over which the attribute(s) apply(ies).  If the attribute(s) do(es) not exist at the index, the set is empty and the range represents the range over which the attribute(s) is (are) not applied.  The range isn’t necessarily the maximum range covered by the attribute(s) and its extent is implementation-dependent.  If you need the maximum range, use `longestCharacterAttributeRunAtIndex(_:inRange:named:)`.<br><br>*Compare to `attribute(_:atIndex:effectiveRange) -> AnyObject?`.* |

| Method | `longestCharacterAttributeRunAtIndex(_:inRange:named:) -> CharacterAttributeRun` |
|:--|:--|
| **Description** | Returns the named character attribute or all character attributes of the character at a given index and the full range over which the attribute(s) apply(ies) within the provided range limit.  If the attribute(s) do(es) not exist at the index, the set is empty and the range represents the range over which the attribute(s) is (are) not applied.  If you do not need the maximum range, use `characterAttributeRunAtIndex(_:named:)`.<br><br>*Compare to `attribute(_:atIndex:longestEffectiveRange:inRange:)`.* |


## Mutable Attributed Strings

Mutable attributed strings have several mutating methods in addition to the various methods inherited from the immutable variant.

| Method |  `setCharacterAttributes(_:overRange:)` |
|:--|:--|
| **Description** | Sets the attributes for the characters in the specified range to the attributes specified in any collection generating elements of type `CharacterAttribute`. |
| **Subscripting** | Subscripting may be used in the following form: `[Range<Int>]`<br><br>*Example:*<br>`attributedString[4 ..< 8] = [.Font(newFont)]` |

| Method | `addCharacterAttribute(_:overRange:)` |
|:--|:--|
| **Description** | Adds a character attribute to an attributed string over a specified range. |

| Method |  `addCharacterAttributes(_:overRange:)` |
|:--|:--|
| **Description** | Adds any collection generating elements of type `CharacterAttribute` to an attributed string over a specified range. |
