Working with Views
==================

### Subscripting

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


### Showing or hiding multiple views

A few simple functions for hiding or showing views in a single statement are provided:
 - `func HideViews(UIView...)`
 - `func HideViews([UIView])`
 - `func ShowViews(UIView...)`
 - `func ShowViews([UIView])`
