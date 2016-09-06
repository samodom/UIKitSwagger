//: # Color Convenience

import UIKitSwagger

import XCPlayground
import Playgrounds

//: ### Components
//:
//: Getting color information from an instance of `UIColor` is as easy as it could possibly be.
//:
//: **Component Structure**
//:
//: The following component structures are provided for convenience.  Each one conforms to `Equatable` and a protocol called `UIColorComponents`.


//: ### Aliases
//: Use these constant aliases for all of the preset component value methods on `UIColor`:

let colorTable = ColorTable()

XCPShowView("Color Aliases", view: colorTable)
