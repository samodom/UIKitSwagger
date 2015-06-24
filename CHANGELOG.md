UIKitSwagger Changelog
======================

#### v0.7.0 ()
 - Updated for Swift 2
 - Updated for iOS 9
 - Layout constraint equivalence now accounts for priority
 - Constraint searches no longer return optional arrays of constraints.  Missing constraints will now yield an empty array.
 - The `Constraint` typealias has been removed
 - Making a positive constant constraint from one that is already non-negative will return the original constraint
 - Layout guides are now addable/removable to/from views using the `+=` and `-=` syntax.  The are added and remove along with views to make sure that modifier items make sense.


##### v0.6.1 (Sunday, March 22, 2015)
 - Added MatchSizes() method to Auto Layout


##### v0.6.0 (Saturday, March 7, 2015)
 - Added color count and color dictionary properties to `ColorPalette`
 - Added formal initializers for color component types
 - Removed component-type-based initializer on UIColor
 - Added component conversion methods
 - Added CMYK component structure at feature parity with all other component types
 - Removed `UIColor` component-based initializer
 - Added functions to easily turn off autoresizing-mask-to-constraint translation
 - Added methods and functions for constraining view dimensions to a constant or interval
 - Renamed equal-dimension constraint functions to 'Match' functions
 - Changed deployment target to 8.0


##### v0.5.2 (Tuesday, February 10, 2015)
 - Updated for Swift 1.2
 - Added a multi-client manager for a `UIActivityIndicatorView` called `SpinnerStateManager`
 - Made color aliases global constants instead of variables
 - Capitalized color alias names
