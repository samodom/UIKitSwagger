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

 - `var Black` returns `UIColor.blackColor()`
 - `var White` returns `UIColor.whiteColor()`
 - `var Gray` returns `UIColor.grayColor()`
 - `var LightGray` returns `UIColor.lightGrayColor()`
 - `var DarkGray` returns `UIColor.darkGrayColor()`
 - `var Red` returns `UIColor.redColor()`
 - `var Green` returns `UIColor.greenColor()`
 - `var Blue` returns `UIColor.blueColor()`
 - `var Cyan` returns `UIColor.cyanColor()`
 - `var Magenta` returns `UIColor.magentaColor()`
 - `var Yellow` returns `UIColor.yellowColor()`
 - `var Orange` returns `UIColor.orangeColor()`
 - `var Purple` returns `UIColor.purpleColor()`
 - `var Brown` returns `UIColor.brownColor()`
 - `var Clear` returns `UIColor.clearColor()`
