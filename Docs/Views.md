Working with Views
==================

### Subscripting

Shorten the syntax for finding and altering views in a view's hierarchy.

**Subviews** (non-negative integer indices)

|Syntax|Result|
|------|------|
|`view[index]`|returns `view.subviews[index]` or `nil` for an out-of-bounds index instead of raising an exception|
|`view[index] = otherSubview`|replaces the subview at `index` with `otherSubview`|
|`view[index] = nil`|simply removes the subview at `index`|

**Superviews** (negative integer indices)

|Syntax|Result|
|------|------|
|`view[-1]`|returns `view.superview`|
|`view[-2]`|returns `view.superview.superview`, etc.|
|`view[-1] = otherView`|moves `view` from `view.superview.subviews` to `otherView.subviews` (as will any other negative value of `index`)|

Not sure where to add constraints for two items?  It's always the first common ancestor!
> `func firstCommonAncestor(view: UIView) -> UIView?`

Find `exchangeSubviewAtIndex(_: Int, withSubviewAtIndex: Int)` to be too wordy?  Try this UIView method instead!
> `func swap(Int, Int)` instead!


### Showing or hiding multiple views

A few simple functions for hiding or showing views in a single statement are provided:
 - `func HideViews(UIView...)`
 - `func HideViews([UIView])`
 - `func ShowViews(UIView...)`
 - `func ShowViews([UIView])`


### Adding and removing things

If UIView has an `add...` method for something, then you can use the `+=` syntax to add it and the `-=` syntax to remove it.  This includes subviews, auto layout constraints, motion effects and gesture recognizers.

As such, the empty protocol `UIViewAddable` exists and has declared conformance from `UIView`, `NSLayoutConstraint`, `UIMotionEffect` and `UIGestureRecognizer`.  For purity, a type alias has been created for the same items when being removed: `typealias UIViewRemovable = UIViewAddable`

```swift
view -= someSubview
view += someConstraint
view -= aMotionEffect
view += myTapGetureRecognizer
```

Not only can you add and remove individual addables, you can also provide an array of just one type of addable or any mix of addables to be added or removed in one step.

```swift
view -= [pinnedToLeft, rotationRecognizer, wobbler, marginAlignment1 ,marginAlignment2]
view += [subview, button, centeringConstraint, tapper, wiggler]
```

When mixed addables are added, the views are added before the constraints to ensure that the view is ready for the constraints.  When removables are being removed, the constraints are removed before the views for similar reasons.
