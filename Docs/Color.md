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

 - `let Black` is defined as `UIColor.blackColor()`
 - `let White` is defined as `UIColor.whiteColor()`
 - `let Gray` is defined as `UIColor.grayColor()`
 - `let LightGray` is defined as `UIColor.lightGrayColor()`
 - `let DarkGray` is defined as `UIColor.darkGrayColor()`
 - `let Red` is defined as `UIColor.redColor()`
 - `let Green` is defined as `UIColor.greenColor()`
 - `let Blue` is defined as `UIColor.blueColor()`
 - `let Cyan` is defined as `UIColor.cyanColor()`
 - `let Magenta` is defined as `UIColor.magentaColor()`
 - `let Yellow` is defined as `UIColor.yellowColor()`
 - `let Orange` is defined as `UIColor.orangeColor()`
 - `let Purple` is defined as `UIColor.purpleColor()`
 - `let Brown` is defined as `UIColor.brownColor()`
 - `let Clear` is defined as `UIColor.clearColor()`
