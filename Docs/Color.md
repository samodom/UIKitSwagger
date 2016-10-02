Color Components
================

The `ColorComponents` and accompanying protocols create an interface between different color representations -- all integrated with `UIColor`.  Component value types are provided for several commonly used color models.  All are `Equatable` types and all conform to each of the listed protocols.


```swift
public protocol ColorComponents {
    var uiColor: UIColor { get }
}

public protocol RGBConvertible 
    var rgbComponents: RGBComponents { get }
}

public protocol HSBConvertible 
    var hsbComponents: HSBComponents { get }
}

public protocol CMYKConvertible 
    var cmykComponents: CMYKComponents { get }
}

public protocol GrayscaleConvertible 
    var grayscaleComponents: GrayscaleComponents { get }
}
```

### Common Models

```swift
struct RGBComponents {
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    let alpha: CGFloat
}
```

```swift
struct HSBComponents {
    let hue: CGFloat
    let saturation: CGFloat
    let brightness: CGFloat
    let alpha: CGFloat
}
```

```swift
struct GrayscaleComponents {
    let white: CGFloat
    let alpha: CGFloat
}
```

```swift
struct CMYKComponents {
    let cyan: CGFloat
    let magenta: CGFloat
    let yellow: CGFloat
    let key: CGFloat
    let alpha: CGFloat
}
```

In addition, `UIColor` has a convenience initializer for creating colors using CMYK values and a component value retrieval method to match the system API.

```swift
init(
	cyan: CGFloat,
	magenta: CGFloat,
	yellow: CGFloat,
	key: CGFloat,
	alpha: CGFloat
)

func getCyan(
	inout _ cyan: CGFloat,
	inout magenta: CGFloat,
	inout yellow: CGFloat,
	inout key: CGFloat,
	inout alpha: CGFloat
) -> Bool
```


## Individual `UIColor` Component Values

These values are properties of `UIColor`:

 - `var redValue: CGFloat`
 - `var greenValue: CGFloat`
 - `var blueValue: CGFloat`
 - `var whiteValue: CGFloat`
 - `var cyanValue: CGFloat`
 - `var magentaValue: CGFloat`
 - `var yellowValue: CGFloat`
 - `var keyValue: CGFloat`
 - `var alpha: CGFloat`
 - `var hue: CGFloat`
 - `var saturation: CGFloat`
 - `var brightness: CGFloat`
