Auto Layout Convenience
=======================


> In the source code and this documentation, the following type alias is used:
>
> `typealias Constraint = NSLayoutConstraint`

> In addition, `AutoLayoutAttributedItem` represents a pair consisting of an Auto Layout item (view or view controller layout guide) and an `NSLayoutAttribute`


## Enhancements to Constraints

### Equality

Compare two constraints with respect to the items, attributes, relation, multiplier and constant.  It even tries the reverse of one operand to truly determine equivalency.  In addition, the `==*` operator can be used to compare constraints for extended equivalency by comparing constraint priorities and identifiers.

### Reversal

Want to reverse the items in a constraint to produce an equivalent constraint?  Note that some constraints are not reversible.
- `func reversed() -> Constraint?`


## Real Auto Layout Syntax

You can now build your constraints in Swift with a real syntax the same way that you use the `init(item:attribute:relatedBy:toItem:attribute:multiplier:constant:)` initializer.  The `*` and `+` operators provide the scalar multiples and constant offsets, respectively.  The `=*`, `>=*` and `<=*` operators specify "equal", "greater than or equal" and "less than or equal" relations, respectively.

```swift
let constraint1 = button.centerX =* 2 * view.leftMargin + 14.5
let constraint2 = button.height <=* 20
let constraint3 = button.width >=* button.height + 4
```

Additionally, the two modifiable attributes of a constraint can be manipulated with the tilde operator (`~`) as follows:

|Syntax|Equivalent|
|------|----------|
|`constraint ~ 444`|`constraint.priority = 444`|
|`constraint ~ "sample"`|`constant.identifier = "sample"`|
|`constraint ~ nil`|`contraint.identifier = nil`|


## Views Enhancements and Utilities

### Turning Off Translation

Tired of calling `setTranslatesAutoresizingMaskIntoConstraints(false)` on so many views when writing Auto Layout code?  Do a bunch at once:

```swift
DoNotTranslateMasks(button, image, titleLabel)
//  OR
DoNotTranslateMasks(view.subviews)
```


### Blindly Apply/Remove Constraints

Instead of figuring out where to add constraints, just apply them!  And instead of figuring out where they are applied before removing them, just remove them!  The correct view is figured out for you automatically - even if a view controller layout guide is involved.

Methods on NSLayoutConstraint:
 - `func apply()`
 - `func remove()`

Global top-level functions:
 - `func ApplyConstraints(Constraint...)`
 - `func ApplyConstraints([Constraint])`
 - `func RemoveConstraints(Constraint...)`
 - `func RemoveConstraints([Constraint])`

And for good measure, a method to remove all of a view's constraints without having to use this cumbersome one-liner:

```swift
view.removeConstraints(view.constraints())
```

This can now be written as:

```swift
view.clearConstraints()
```

### Activation Functions

Convenience methods for activating and deactivating constraints:
 - `func activate()`
 - `func deactivate()`

Similar to constraint application, one should be able to activate or deactivate multiple constraints in a single statement:
 - `func ActivateConstraints(Constraint...)`
 - `func ActivateConstraints([Constraint])`
 - `func DeactivateConstraints(Constraint...)`
 - `func DeactivateConstraints([Constraint])`

 ### Constraint Search

 Don't clutter your view controller code trying to find a particular constraint to remove!   Finding constraints is much easier with these methods on `UIView`:

  - `func constraintsForItem(AnyObject) -> [Constraint]?`
  - `func constraintsForAttribute(NSLayoutAttribute) -> [Constraint]?`
  - `func constraintsForAttributedItem(AutoLayoutAttributedItem) -> [Constraint]?`
  - `func constraintsForItems(AnyObject, AnyObject) -> [Constraint]?`
  - `func constraintsForItems(AutoLayoutAttributedItem, AutoLayoutAttributedItem) -> [Constraint]?`

 Also, you can check for an applied constraint (or equivalent) using this method:

  - `func hasConstraint(Constraint) -> Bool`


### Alignment Functions

Common alignment tasks can be performed without creating constraints manually.  In each case, two or more items must be provided to automatically align views.  The produced constraints are defined with respect to the appropriate attribute of the first item listed.  Each method returns the constraints that it applies.
 - `AlignLeft(AutoLayoutAttributable...) -> [Constraint]`
 - `AlignLeft([AutoLayoutAttributable]) -> [Constraint]`
 - `AlignLeading(AutoLayoutAttributable...) -> [Constraint]`
 - `AlignLeading([AutoLayoutAttributable]) -> [Constraint]`
 - `AlignRight(AutoLayoutAttributable...) -> [Constraint]`
 - `AlignRight([AutoLayoutAttributable]) -> [Constraint]`
 - `AlignTrailing(AutoLayoutAttributable...) -> [Constraint]`
 - `AlignTrailing([AutoLayoutAttributable]) -> [Constraint]`
 - `AlignTop(AutoLayoutAttributable...) -> [Constraint]`
 - `AlignTop([AutoLayoutAttributable]) -> [Constraint]`
 - `AlignBottom(AutoLayoutAttributable...) -> [Constraint]`
 - `AlignBottom([AutoLayoutAttributable]) -> [Constraint]`
 - `AlignHorizontally(AutoLayoutAttributable...) -> [Constraint]`
 - `AlignHorizontally([AutoLayoutAttributable]) -> [Constraint]`
 - `AlignVertically(AutoLayoutAttributable...) -> [Constraint]`
 - `AlignVertically([AutoLayoutAttributable]) -> [Constraint]`
 - `AlignCenters(AutoLayoutAttributable...) -> [Constraint]`
 - `AlignCenters([AutoLayoutAttributable]) -> [Constraint]`
 - `AlignBaselines(AutoLayoutAttributable...) -> [Constraint]`
 - `AlignBaselines([AutoLayoutAttributable]) -> [Constraint]`


### Distribution Functions

Common distribution tasks can be performed without creating constraints manually.  In each case, two or more items must be provided to automatically distribute views.  Functions that accept a numeric argument use the provided value for spacing between items.  The produced constraints are defined with respect to the appropriate attribute of the first item listed.  All of these functions return the constraints that they apply.
 - `DistributeLeftToRight(UIView...) -> [Constraint]`
 - `DistributeLeftToRight([UIView]) -> [Constraint]`
 - `DistributeLeftToRight(CGFloat, UIView...) -> [Constraint]`
 - `DistributeLeftToRight(CGFloat, [UIView]) -> [Constraint]`
 - `DistributeLeadingToTrailing(UIView...) -> [Constraint]`
 - `DistributeLeadingToTrailing([UIView]) -> [Constraint]`
 - `DistributeLeadingToTrailing(CGFloat, UIView...) -> [Constraint]`
 - `DistributeLeadingToTrailing(CGFloat, [UIView]) -> [Constraint]`
 - `DistributeTopToBottom(UIView...) -> [Constraint]`
 - `DistributeTopToBottom([UIView]) -> [Constraint]`
 - `DistributeTopToBottom(CGFloat, UIView...) -> [Constraint]`
 - `DistributeTopToBottom(CGFloat, [UIView]) -> [Constraint]`


### Dimensions

#### Single Dimension

Restricting a view's width or height to a constant or range is easy enough:

 - `func constrainWidth(160)`
 - `func constrainWidth(120 ... 160)`
 - `func constrainWidth(120.12 ... 160.8)`
 - `func constrainHeight(44)`
 - `func constrainHeight(22 ... 44)`
 - `func constrainHeight(22.1 ... 44.1)`


#### Aspect Ratios

The dimensions of a view can be constrained to a particular aspect ratio with or without an offset.  These functions create and apply the necessary constraints, then return them to the caller for use as variables.

Methods on NSLayoutConstraint:
 - `func constrainWidthToHeight(CGFloat, CGFloat) -> Constraint`
 - `func constrainHeightToWidth(CGFloat, CGFloat) -> Constraint`

Global top-level functions (the produced constraints are defined with respect to the appropriate attribute of the first item listed or the provided constant):
 - `func MatchWidths(AutoLayoutAttributable...) -> [Constraint]`
 - `func MatchWidths([AutoLayoutAttributable]) -> [Constraint]`
 - `func ConstrainWidths(CGFloat, AutoLayoutAttributable...) -> [Constraint]`
 - `func ConstrainWidths(CGFloat, [AutoLayoutAttributable]) -> [Constraint]`
 - `func MatchHeights(AutoLayoutAttributable...) -> [Constraint]`
 - `func MatchHeights([AutoLayoutAttributable]) -> [Constraint]`
 - `func ConstrainHeights(CGFloat, AutoLayoutAttributable...) -> [Constraint]`
 - `func ConstrainHeights(CGFloat, [AutoLayoutAttributable]) -> [Constraint]`
