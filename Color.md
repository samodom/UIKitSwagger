Color Convenience
=================

### Components

Getting color information from an instance of `UIColor` is as easy as it could possibly be.

**Component Structure**

The following component structures are provided for convenience.  Each one conforms to `Equatable` and a protocol called `UIColorComponents`.

```swift
struct UIColorRGBComponents {
  let red: CGFloat
  let green: CGFloat
  let blue: CGFloat
  let alpha: CGFloat
}
```

```swift
struct UIColorHSBComponents {
  let hue: CGFloat
  let saturation: CGFloat
  let brightness: CGFloat
  let alpha: CGFloat
}
```

```swift
struct UIColorGrayscaleComponents {
  let white: CGFloat
  let alpha: CGFloat
}
```

These component structures can be retrieved using the following properties:
 - `var rgbComponents: UIColorRGBComponents`
 - `var hsbComponents: UIColorHSBComponents`
 - `var grayscaleComponents: UIColorGrayscaleComponents`

Each component scheme also has a method to produce a color:
 - `func color() -> UIColor`

In addition, `UIColor` has a corresponding convenience initializer for creating colors that match exactly the system-provided initializers except for their use of these structures.
 - `convenience init(components: UIColorComponents)`


**Component Values**

Want individual component values?  Here they are as properties!
 - `var red: CGFloat`
 - `var green: CGFloat`
 - `var blue: CGFloat`
 - `var alpha: CGFloat`
 - `var hue: CGFloat`
 - `var saturation: CGFloat`
 - `var brightness: CGFloat`
 - `var white: CGFloat`


### Aliases

Use these aliases for all of the `*Color()` factory methods on `UIColor`:

 - `var black` returns `UIColor.blackColor()`
 - `var white` returns `UIColor.whiteColor()`
 - `var gray` returns `UIColor.grayColor()`
 - `var lightGray` returns `UIColor.lightGrayColor()`
 - `var darkGray` returns `UIColor.darkGrayColor()`
 - `var red` returns `UIColor.redColor()`
 - `var green` returns `UIColor.greenColor()`
 - `var blue` returns `UIColor.blueColor()`
 - `var cyan` returns `UIColor.cyanColor()`
 - `var magenta` returns `UIColor.magentaColor()`
 - `var yellow` returns `UIColor.yellowColor()`
 - `var orange` returns `UIColor.orangeColor()`
 - `var purple` returns `UIColor.purpleColor()`
 - `var brown` returns `UIColor.brownColor()`
 - `var clear` returns `UIColor.clearColor()`
