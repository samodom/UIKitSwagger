UIKit Dynamics
==============

## Adding/removing behaviors to/from an animator

Use the `+=` and `-=` operators to add or remove behaviors one-at-a-time or as an array.

```swift
animator += collisionBehavior
animator += [gravityBehavior, pushBehavior, snapBehavior]
animator -= gravityBehavior
animator -= [collisionBehavior, snapBehavior]
```


## Adding/removing child behaviors to/from another behavior

Use the `+=` and `-=` operators to add or remove child behaviors one-at-a-time or as an array.

```swift
parentBehavior += collisionBehavior
parentBehavior += [gravityBehavior, pushBehavior, snapBehavior]
parentBehavior -= gravityBehavior
parentBehavior -= [collisionBehavior, snapBehavior]
```


## Adding/removing dynamic items to/from an applicable behavior

If you are working with an instance of `UIDynamicItemBehavior`, `UIGravityBehavior`, `UICollisionBehavior` or `UIPushBehavior`, then use the `+=` and `-=` operators to add or remove dynamic items one-at-a-time or as an array:

```swift
itemBehavior += box
gravityBehavior += [circle, line, star]
collisionBehavior -= circle
pushBehavior -= [line, box]
```
