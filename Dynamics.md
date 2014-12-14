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
