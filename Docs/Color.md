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

Use these constant aliases for all of the preset component value methods on `UIColor`:

 - `let Black` returns `UIColor.blackColor()`
 - `let White` returns `UIColor.whiteColor()`
 - `let Gray` returns `UIColor.grayColor()`
 - `let LightGray` returns `UIColor.lightGrayColor()`
 - `let DarkGray` returns `UIColor.darkGrayColor()`
 - `let Red` returns `UIColor.redColor()`
 - `let Green` returns `UIColor.greenColor()`
 - `let Blue` returns `UIColor.blueColor()`
 - `let Cyan` returns `UIColor.cyanColor()`
 - `let Magenta` returns `UIColor.magentaColor()`
 - `let Yellow` returns `UIColor.yellowColor()`
 - `let Orange` returns `UIColor.orangeColor()`
 - `let Purple` returns `UIColor.purpleColor()`
 - `let Brown` returns `UIColor.brownColor()`
 - `let Clear` returns `UIColor.clearColor()`
