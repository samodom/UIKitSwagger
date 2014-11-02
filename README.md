UIKitSwagger
============

Extensions to UIKit for searching/manipulating view hierarchies, finding/comparing layout constraints and additional tasks related to UIKit.


### View Subscripting

Shorten the syntax for finding and altering views in a view's hierarchy.

**Subviews** (non-negative integer indices)
- `view[index]` returns `view.subviews[index]`
- `view[index]` will return nil for an out-of-bounds index instead of raising an exception
- `view[index] = otherSubview` replaces the subview at `index` with `otherSubview`
- `view[index] = nil` simply removes the subview at `index`

**Superviews** (negative integer indices)
- `view[-1]` is equivalent to `view.superview`
- `view[-2]` is equivalent to `view.superview.superview`, etc.
- `view[-1] = otherView` moves `view` from `view.superview.subviews` to `otherView.subviews` (as will any other negative value of `index`)

Not sure where to add constraints for two items?  It's always the first common ancestor!
- `func firstCommonAncestor(view: UIView) -> UIView?`


### View Show/Hide

A few simply functions for showing or hiding views in a single statement are provided:

- `func HideViews(views: UIView...)`
- `func HideViews(views: [UIView])`
- `func ShowViews(views: UIView...)`
- `func ShowViews(views: [UIView])`


### Auto Layout Constraints

Don't clutter your view controller code trying to find a particular constraint to remove!   Finding constraints is much easier with these methods:
- `func constraintsForItem(item: AnyObject) -> [Constraint]?`
- `func constraintsForAttribute(attribute: NSLayoutAttribute) -> [Constraint]?`
- `func constraintsForItem(item: AnyObject, attribute: NSLayoutAttribute) -> [Constraint]?`
- `func constraintsForItems(items: ItemPair) -> [Constraint]?`
- `func constraintsForItems(attributedItems: (AttributedItem, AttributedItem)) -> [Constraint]?`

In the source code and this documentation, the following type alias is used:
`typealias Constraint = NSLayoutConstraint`

**Reversal:**
Want to reverse the items in a constraint to produce an equivalent constraint?
`func reversed() -> Constraint?`


**Equality:**
Compare two constraints with respect to the items, attributes, relation, multiplier and constant.  It even tries the reverse of one operand to truly determine equivalency.
