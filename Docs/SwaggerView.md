`SwaggerView`
===========

Instead of reaching into the layer of your view through in order to manipulate properties related to things like corner rounding and border drawing, just use a `SwaggerView` in Interface Builder.  Internally, the view uses `CAShapeLayer` as its layer type.


## View Corners

Since the type `UIRectCorner` type has a case `.AllCorners` that is unequal to the set containing each individual corner, a new option has been defined named `ViewCorner` with the same basic options.  The difference is that the option for all corners is equal to the sum of all corners as it should be.


## Rounding View Corners

`cornerRadius: CGFloat`
> Specifies the rounding radius for corners that are to be rounded.  This property is directly available in Interface Builder.

`roundedCorners: ViewCorners`
> Uses any combination of corners to round the view using the provided corner radius.  The default value is `.None`, so no corners are rounded by default even if there is a non-zero corner radius.
>
>  This property is indirectly available in Interface Builder through individual corner flags: `upperLeft`, `upperRight`, `lowerLeft` and `lowerRight`.  These flags are not available in code as they are internal and exist solely for exposing `roundedCorners` in Interface Builder.


## Drawing View Borders

Borders can be drawn around a view - even with rounded corners.  The standard options of `borderWidth: CGFloat` and `borderColor: UIColor?` are available on instances of `SwaggeView` both in code and Interface Builder.

In addition, some public/internal mirrored property pairs are available to further configure the drawing of the border.

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
