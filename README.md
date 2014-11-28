UIKitSwagger
============

Extensions to UIKit for working with view hierarchies, layout constraints and additional tasks related to UIKit.


### View Subscripting

Shorten the syntax for finding and altering views in a view's hierarchy.

**Subviews** (non-negative integer indices)

> Syntax|Result
> ------|------
> `view[index]`|returns `view.subviews[index]` or `nil` for an out-of-bounds index instead of raising an exception
> `view[index] = otherSubview`|replaces the subview at `index` with `otherSubview`
> `view[index] = nil`|simply removes the subview at `index`

**Superviews** (negative integer indices)
> Syntax|Result
> ------|------
> `view[-1]`|returns `view.superview`
> `view[-2]`|returns `view.superview.superview`, etc.
> `view[-1] = otherView`|moves `view` from `view.superview.subviews` to `otherView.subviews` (as will any other negative value of `index`)

Not sure where to add constraints for two items?  It's always the first common ancestor!
> `func firstCommonAncestor(view: UIView) -> UIView?`

Find `exchangeSubviewAtIndex(_: Int, withSubviewAtIndex: Int)` to be too wordy?  Try this instead!
> `func swap(Int, Int)` instead!


### View Show/Hide

A few simple functions for hiding or showing views in a single statement are provided:
> `func HideViews(UIView...)`

> `func HideViews([UIView])`

> `func ShowViews(UIView...)`

> `func ShowViews([UIView])`


## Auto Layout

> In the source code and this documentation, the following type alias is used:
>
> `typealias Constraint = NSLayoutConstraint`

> In addition, `AutoLayoutAttributedItem` represents a pair consisting of an Auto Layout item (view or view controller layout guide) and an `NSLayoutAttribute`

### Constraint Search

Don't clutter your view controller code trying to find a particular constraint to remove!   Finding constraints is much easier with these methods:

> `func constraintsForItem(AnyObject) -> [Constraint]?`

> `func constraintsForAttribute(NSLayoutAttribute) -> [Constraint]?`

> `func constraintsForAttributedItem(AutoLayoutAttributedItem) -> [Constraint]?`

> `func constraintsForItems(AnyObject, AnyObject) -> [Constraint]?`

> `func constraintsForItems(AutoLayoutAttributedItem, AutoLayoutAttributedItem) -> [Constraint]?`


**Reversal:**
Want to reverse the items in a constraint to produce an equivalent constraint?
> `func reversed() -> Constraint?`


**Equality:**
Compare two constraints with respect to the items, attributes, relation, multiplier and constant.  It even tries the reverse of one operand to truly determine equivalency.  In addition, the `==*` operator can be used to compare constraints for extended equivalency by comparing constraint priorities and identifiers.


### Real Auto Layout Syntax

You can now build your constraints in Swift with a real syntax the same way that you use the `init(item:attribute:relatedBy:toItem:attribute:multiplier:constant:)` initializer.  The `*` and `+` operators provide the scalar multiples and constant offsets, respectively.  The `=*`, `>=*` and `<=*` operators specify "equal", "greater than or equal" and "less than or equal" relations, respectively.

> ```swift
> let constraint1 = button.centerX =* 2 * view.leftMargin + 14.5
> let constraint2 = button.height <=* 20
> let constraint3 = button.width >=* button.height + 4
> ```

Additionally, the two modifiable attributes of a constraint can be manipulated with the tilde operator (`~`) as follows:

> Syntax|Equivalent
> ------|----------
> `constraint ~ 444`|`constraint.priority = 444`
> `constraint ~ "sample"`|`constant.identifier = "sample"`
> `constraint ~ nil`|`contraint.identifier = nil`


### Blindly Apply/Remove Constraints


Instead of figuring out where to add constraints, just apply them!  And instead of figuring out where they are applied before removing them, just remove them!  The correct view is figured out for you automatically - even if a view controller layout guide is involved.
> `func apply()`

> `func remove()`
