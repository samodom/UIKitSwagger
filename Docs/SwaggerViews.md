Swagger Views
=============

Instead of reaching into the layer of your view through in order to manipulate properties related to things like corner rounding and border drawing, just use a `SwaggerView` in Interface Builder.  Internally, the view uses `CAShapeLayer` as its layer type.


## View Corners

Since the type `UIRectCorner` type has a case `.AllCorners` that is unequal to the set containing each individual corner, a new option

## Rounding Corners

`cornerRadius: CGFloat`
> Specifies the rounding radius for corners that are to be rounded.  This property is directly available in Interface Builder.

`roundedCorners: UIRectCorners`
> Uses any combination of corners to round the view using the provided corner radius.  No corners is equivalent to all corners since corners will only be rounded if there is a non-zero corner radius.  The default value is `.AllCorners`.
>
>  This property is indirectly available in Interface Builder through individual corner flags: `roundUpperLeftCorner`, `roundUpperRightCorner`, `roundLowerLeftCorner` and `roundLowerRightCorner`.  These flags are not available in code as they are internal and exist solely for exposing `roundedCorners` in Interface Builder.


## Drawing Borders

`borderWidth: CGFloat`

`borderColor: UIColor?`

`borderDashPattern: BorderDashPattern?`
`public typealias BorderDashPattern = [CGFloat]`
dashes type -- with phase

`borderJoinStyle: LineJoinStyle`
border line cap

```swift
public enum LineJoinStyle {
    case Miter, Round, Bevel
}
```

`borderStart: NormalizedDouble`

`borderEnd: NormalizedDouble`

`borderMiterLimit: CGFloat`

Added to `CALayer`:
`lineJoinStyle: LineJoinStyle`
