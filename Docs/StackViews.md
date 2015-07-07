Working with Stack Views
========================

### Builder Syntax

Shorten the syntax for creating stack views by using `StackHorizontally()` and `StackVertically()`:

```
func StackHorizontally(
    views: [UIView],
    alignment: UIStackViewAlignment,
    distribution: UIStackViewDistribution,
    spacing: CGFloat
)

func StackVertically(
    views: [UIView],
    alignment: UIStackViewAlignment,
    distribution: UIStackViewDistribution,
    spacing: CGFloat
)
```

As with stack views created using the system constructor, the default values for the various parameters remain the same and can be omitted in the function call:

| Parameter    | Type                    | Default Value |
|:------------:|:-----------------------:|:-------------:|
| alignment    | UIStackViewAlignment    | Fill          |
| distribution | UIStackViewDistribution | Fill          |
| spacing      | CGFloat                 | 0.0           |
