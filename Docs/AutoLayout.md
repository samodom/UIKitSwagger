Auto Layout Convenience
=======================


## Enhancements to Constraints


### Equality

Compare two constraints with respect to the items and their attributes, the relation, the multiplier and the constant.  It even tries the reverse of one operand to truly determine equivalency.  Constraint identifiers, priority and activation status are not used in checking equivalence, but the `==*` operator can be used to compare constraints for identity by using normal equivalence *plus* priority and identifier equivalence.


### Swapping Subjects

Want to reearrang a constraint to produce an equivalent constraint in terms of the second item as opposed to the first?  Want a positive offset value instead of a negative one?
> Note: Some constraint items cannot be swapped.

- `swappedSubjectConstraint: NSLayoutConstraint?`
- `positiveConstantConstraint: NSLayoutConstraint`


## Real Auto Layout Syntax

You can now build your constraints in Swift with a real syntax the same way that you use the `init(item:attribute:relatedBy:toItem:attribute:multiplier:constant:)` initializer.  The `*` and `+` operators provide the scalar multiples and constant offsets, respectively.  The `=*`, `>=*` and `<=*` operators specify "equal", "greater than or equal" and "less than or equal" relations, respectively.  The syntax works with views and layout guides**.

```swift
let constraint1 = button.centerX =* ((2 * view.leftMargin) + 14.5)
let constraint2 = button.height <=* 20
let constraint3 = spacer.top >=* (controller.top + 4)
```

** *Including the top and bottom layout guides for a view controller; the other attributes use the root view's corresponding attributes. Layout guides use their bottom attribute for the baseline attributes and non-margin equivalents for margin attributes (i.e., left for left margin).  Layout guides are available in iOS 9 and later only.*


Additionally, the two modifiable attributes of a constraint can be manipulated with the tilde operator (`~`) as follows:

|Syntax|Equivalent|
|------|----------|
|`constraint ~ 444`|`constraint.priority = 444`|
|`constraint ~ "sample"`|`constant.identifier = "sample"`|
|`constraint ~ nil`|`contraint.identifier = nil`|


## View Enhancements and Utilities

### Turning Off Autoresize Mask Translation

Tired of using `setTranslatesAutoresizingMaskIntoConstraints(false)` on code-created views when writing Auto Layout code?  Use the more succinct `usesAutoLayout` property instead.  Do a bunch at once with any array or set of views using the `useAutoLayout()` method:

```swift
button.usesAutoLayout = true

view.subviews.useAutoLayout()
```


### Constraint Activation

Convenience methods for activating and deactivating constraints that work on single constraints *and* arrays/sets of constraints:

 - `NSLayoutConstraint.activate()`
 - `NSLayoutConstraint.deactivate()`


And for good measure, more succinct means of deactivating all of a view's constraints without having to use one of these cumbersome one-liners:

```swift
// The old view-centric way
view.removeConstraints(view.constraints)

// The new constraint-centric way
NSLayoutConstraint.deactivate(view.constraints)
```

This can now be written in either of the following ways:

```swift
// The old view-centric way
view.clearConstraints()

// The new constraint-centric way
view.constraints.deactivate()
```


### Constraint Search

Don't clutter your view controller code trying to find a particular constraint to remove!   Finding constraints is much easier with these methods on `UIView`:

- `constraintsForItem(AnyObject) -> Set<NSLayoutConstraint>`
- `constraintsForAttribute(NSLayoutAttribute) -> Set<NSLayoutConstraint>`
- `constraintsForAttributedItem(AutoLayoutAttributedItem) -> Set<NSLayoutConstraint>`
- `constraintsForItems(AnyObject, AnyObject) -> Set<NSLayoutConstraint>`
- `constraintsForItems(AutoLayoutAttributedItem, AutoLayoutAttributedItem) -> Set<NSLayoutConstraint>`

Also, you can check for an active constraint (or its equivalent) using this method:

 - `hasConstraint(NSLayoutConstraint) -> Bool`


### Alignment Functions

Common alignment tasks can be performed without creating constraints manually.  In each case, two or more items must be provided to automatically align views.  The produced constraints are defined with respect to the appropriate attribute of the first item listed.  Each method accepts a variadic list or array of items returns the constraints that it activates.

 - `AlignLeft(items: ...) -> [NSLayoutConstraint]`
 - `AlignLeading(items: ...) -> [NSLayoutConstraint]`
 - `AlignRight(items: ...) -> [NSLayoutConstraint]`
 - `AlignTrailing(items: ...) -> [NSLayoutConstraint]`
 - `AlignTop(items: ...) -> [NSLayoutConstraint]`
 - `AlignBottom(items: ...) -> [NSLayoutConstraint]`
 - `AlignHorizontally(items: ...) -> [NSLayoutConstraint]`
 - `AlignVertically(items: ...) -> [NSLayoutConstraint]`
 - `AlignCenters(items: ...) -> [NSLayoutConstraint]`
 - `AlignBaselines(items: ...) -> [NSLayoutConstraint]`


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

 - `DistributeLeftToRight(items: ...) -> [NSLayoutConstraint]`
 - `DistributeLeadingToTrailing(items: ...) -> [NSLayoutConstraint]`
 - `DistributeTopToBottom(items: ...) -> [NSLayoutConstraint]`


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

Global top-level functions where the produced constraints are defined with respect to the appropriate attribute of the first item listed or the provided constant/range.  These functions accept a variadic list or array of items and optionally a value or range of values:

 - `MatchWidths`
 - `ConstrainWidths`
 - `MatchHeights`
 - `ConstrainHeights`
 - `MatchSizes`
