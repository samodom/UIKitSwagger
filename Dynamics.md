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

### `UIDynamicItemBehavior`

Use the `+=` and `-=` operators to add or remove dynamic items one-at-a-time or as an array:

```swift
itemBehavior += box
itemBehavior += [circle, line, star]
itemBehavior -= circle
itemBehavior -= [line, box]
```

Add angular velocity to a dynamic item attached to the behavior:

```swift
behavior <+ (box, 0.09)
behavior <+ (star, -0.12)
```

Add linear velocity to a dynamic item attached to the behavior:

```swift
behavior -+ (circle, CGPoint(x: 3.0, y: 0.0))
behavior -+ (line, CGPoint(x: 1.5, y: 1.5))
```
