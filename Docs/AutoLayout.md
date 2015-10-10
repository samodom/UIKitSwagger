Auto Layout Convenience
=======================


## Enhancements to Constraints


### Equality

Compare two constraints with respect to the items and their attributes, the equivalence relation, the multiplier and constant, and the priority.  It even tries the reverse of one operand to truly determine equivalency.  Constraint identifiers and activation status are not used in checking equivalence, but the `==*` operator can be used to compare constraints for identify by using normal equivalence *plus* identifiers.


### Reversal

Want to reverse the items in a constraint to produce an equivalent constraint?  Note that some constraints are not reversible.
 - `reversed() -> NSLayoutConstraint?`
 - `makeConstantPositive() -> NSLayoutConstraint`


## Real Auto Layout Syntax

You can now build your constraints in Swift with a real syntax the same way that you use the `init(item:attribute:relatedBy:toItem:attribute:multiplier:constant:)` initializer.  The `*` and `+` operators provide the scalar multiples and constant offsets, respectively.  The `=*`, `>=*` and `<=*` operators specify "equal", "greater than or equal" and "less than or equal" relations, respectively.  The syntax works with views and layout guides**.

```swift
let constraint1 = button.centerX =* 2 * view.leftMargin + 14.5
let constraint2 = button.height <=* 20
let constraint3 = spacer.top >=* controller.top + 4
```

** Including the top and bottom layout guides for a view controller; the other attributes use the root view's corresponding attributes. Layout guides use their bottom attribute for the baseline attributes and non-margin equivalents for margin attributes (i.e., left for left margin).  Layout guides are available in iOS 9 and later only.


Additionally, the two modifiable attributes of a constraint can be manipulated with the tilde operator (`~`) as follows:

|Syntax|Equivalent|
|------|----------|
|`constraint ~ 444`|`constraint.priority = 444`|
|`constraint ~ "sample"`|`constant.identifier = "sample"`|
|`constraint ~ nil`|`contraint.identifier = nil`|


## View Enhancements and Utilities

### Turning Off Translation

Tired of calling `setTranslatesAutoresizingMaskIntoConstraints(false)` on so many views when writing Auto Layout code?  Do a bunch at once with a variadic list or array of views:

 - `DoNotTranslateMasks(...)`


And for good measure, a method to remove all of a view's constraints without having to use this cumbersome one-liner:

```swift
view.removeConstraints(view.constraints)
```

This can now be written as:

```swift
view.clearConstraints()
```
### Constraint Activation

Convenience methods for activating and deactivating constraints:

 - `activate()`
 - `deactivate()`

Activate or deactivate multiple constraints in a single statement using a variadic list or array of constraints:

 - `ActivateConstraints(...)`
 - `DeactivateConstraints(...)`


 ### Constraint Search

 Don't clutter your view controller code trying to find a particular constraint to remove!   Finding constraints is much easier with these methods on `UIView`:

  - `constraintsForItem(AnyObject) -> [NSLayoutConstraint]`
  - `constraintsForAttribute(NSLayoutAttribute) -> [NSLayoutConstraint]`
  - `constraintsForAttributedItem(AutoLayoutAttributedItem) -> [NSLayoutConstraint]`
  - `constraintsForItems(AnyObject, AnyObject) -> [NSLayoutConstraint]`
  - `constraintsForItems(AutoLayoutAttributedItem, AutoLayoutAttributedItem) -> [NSLayoutConstraint]`

 Also, you can check for an active constraint (or equivalent) using this method:

  - `hasConstraint(NSLayoutConstraint) -> Bool`


### Alignment Functions

Common alignment tasks can be performed without creating constraints manually.  In each case, two or more items must be provided to automatically align views.  The produced constraints are defined with respect to the appropriate attribute of the first item listed.  Each method accepts a variadic list or array of items returns the constraints that it activates.
 - `AlignLeft(...) -> [NSLayoutConstraint]`
 - `AlignLeading(...) -> [NSLayoutConstraint]`
 - `AlignRight(...) -> [NSLayoutConstraint]`
 - `AlignTrailing(...) -> [NSLayoutConstraint]`
 - `AlignTop(...) -> [NSLayoutConstraint]`
 - `AlignBottom(...) -> [NSLayoutConstraint]`
 - `AlignHorizontally(...) -> [NSLayoutConstraint]`
 - `AlignVertically(...) -> [NSLayoutConstraint]`
 - `AlignCenters(...) -> [NSLayoutConstraint]`
 - `AlignBaselines(...) -> [NSLayoutConstraint]`


### Filling Methods

Constraints for pinning a view to any or all sides of its superview can be accomplished with various alignment function calls, but it is easier to ask a view to fill its superview.  Layout can be arranged relative to margins, horizontal or vertical directions can be specified, or edges can be excluded.

- `fillSuperview()`
- `fillSuperview(inDirections: LayoutDirection..., respectMargins: Bool)`
- `fillSuperview(excludeEdges: LayoutEdges..., respectMargins: Bool)`

> When the `respectMargins` flag is not provided, the default behavior is to not create constraints relative to the superview's margins.

> When a horizontal direction is used but unspecified, the default value is `.LeadingToTrailing`.

> When edges are excluded, the horizontal direction is inferred from the first horizontal edge provided.

>  Mixing horizontal directions is not allowed.

#### Layout Direction

In order to specify a horizontal or vertical direction with left/right and leading/trailing variations, a new enumerated type is available called `LayoutDirection`.  Each direction has an integer equivalent that is the negative of its opposite direction.

```swift
enum LayoutDirection: Int {
    case LeftToRight = 1
    case RightToLeft = -1
    case LeadingToTrailing = 2
    case TrailingToLeading = -2
    case TopToBottom = 3
    case BottomToTop = -3
}
```

#### Layout Edges

Layout edges are similar to layout anchors except that they only encompass the extents of a view.

```swift
public enum LayoutEdge {
    case Leading, Trailing
    case Left, Right
    case Top, Bottom
}
```


### Distribution Functions

Common distribution tasks can be performed without creating constraints manually.  In each case, two or more items must be provided to automatically distribute views.  Functions that accept a numeric argument use the provided value for spacing between items.  The produced constraints are defined with respect to the appropriate attribute of the first item listed.  All of these functions accept a number and a variadic list or array of views and return the constraints that they activate.

 - `DistributeLeftToRight(...) -> [NSLayoutConstraint]`
 - `DistributeLeadingToTrailing(...) -> [NSLayoutConstraint]`
 - `DistributeTopToBottom(...) -> [NSLayoutConstraint]`


### Dimensions

#### Single Dimension

Restricting a view's width or height to a constant or range is easy enough and the returned constraints are automatically activated:

 - `constrainWidth(160)`
 - `constrainWidth(120 ... 160)`
 - `constrainWidth(120.12 ... 160.8)`
 - `constrainHeight(44)`
 - `constrainHeight(22 ... 44)`
 - `constrainHeight(22.1 ... 44.1)`


#### Aspect Ratios

The dimensions of a view can be constrained to a particular aspect ratio with or without an offset.  These functions create and activate the necessary constraints, then return them to the caller for use as variables.

Methods on NSLayoutConstraint:
 - `constrainWidthToHeight(CGFloat, CGFloat) -> NSLayoutConstraint`
 - `constrainHeightToWidth(CGFloat, CGFloat) -> NSLayoutConstraint`

Global top-level functions (the produced constraints are defined with respect to the appropriate attribute of the first item listed or the provided constant/interval).  These functions accept a variadic list or array of items:
 - `MatchWidths(...) -> [NSLayoutConstraint]`
 - `ConstrainWidths(...) -> [NSLayoutConstraint]`
 - `MatchHeights(...) -> [NSLayoutConstraint]`
 - `ConstrainHeights(...) -> [NSLayoutConstraint]`
 - `MatchSizes(...) -> [NSLayoutConstraint]`
