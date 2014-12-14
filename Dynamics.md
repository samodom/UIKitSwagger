UIKit Dynamics
==============

### Adding/removing behaviors to/from an animator

Use the `+=` and `-=` operators to add or remove behaviors one-at-a-time or as an array.

```swift
animator += collisionBehavior
animator += [gravityBehavior, pushBehavior, snapBehavior]
animator -= gravityBehavior
animator -= [collisionBehavior, snapBehavior]
```

---

### Adding/removing child behaviors to/from another behavior

Use the `+=` and `-=` operators to add or remove child behaviors one-at-a-time or as an array.

```swift
parentBehavior += collisionBehavior
parentBehavior += [gravityBehavior, pushBehavior, snapBehavior]
parentBehavior -= gravityBehavior
parentBehavior -= [collisionBehavior, snapBehavior]
```

---

### Adding/removing dynamic items to/from an applicable behavior

If you are working with an instance of `UIDynamicItemBehavior`, `UIGravityBehavior`, `UICollisionBehavior` or `UIPushBehavior`, then use the `+=` and `-=` operators to add or remove dynamic items one-at-a-time or as an array:

```swift
itemBehavior += box
gravityBehavior += [circle, line, star]
collisionBehavior -= circle
pushBehavior -= [line, box]
```

### `UIDynamicItemBehavior`

***Angular velocity***
Add angular velocity to a dynamic item attached to the behavior:

```swift
behavior <+ (box, 0.09)
behavior <+ (star, -0.12)
```

***Angular velocity***
Retrieve the angular velocity of a dynamic item attached to the behavior:

```swift
let boxRotation = behavior <? box
```


***Linear velocity***
Add linear velocity to a dynamic item attached to the behavior:

```swift
behavior -+ (circle, CGPoint(x: 3.0, y: 0.0))
behavior -+ (line, CGPoint(x: 1.5, y: 1.5))
```

***Linear velocity***
Retrieve the linear velocity of a dynamic item attached to the behavior:

```swift
let circleMovement = behavior -? circle
```
