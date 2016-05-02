`SwaggerView`
===========

Instead of reaching into the layer of your view through in order to manipulate properties related to things like corner rounding and border drawing, just use a `SwaggerView` in Interface Builder.  Internally, the view uses `CAShapeLayer` as its layer type.


## View Corners

Since the type `UIRectCorner` type has a case `.AllCorners` that is unequal to the set containing each individual corner, a new option has been defined named `ViewCorner` with the same basic options.  The difference is that the option for all corners is equal to the sum of all corners as it should be.
