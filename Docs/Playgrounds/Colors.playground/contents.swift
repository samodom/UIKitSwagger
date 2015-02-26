//: # Color Convenience
//: ---
//: ## Components
//: Getting color information from an instance of `UIColor` is as easy as it could possibly be.
//:
//: The following component structures are provided for convenience.  Each one conforms to `Equatable` and a protocol called `UIColorComponents` that has a single method for producing a color.
/*:
struct UIColorRGBComponents {
let red: CGFloat
let green: CGFloat
let blue: CGFloat
let alpha: CGFloat
}

struct UIColorHSBComponents {
let hue: CGFloat
let saturation: CGFloat
let brightness: CGFloat
let alpha: CGFloat
}

struct UIColorGrayscaleComponents {
let white: CGFloat
let alpha: CGFloat
}
*/


import UIKitSwagger


var components: UIColorComponents
components = UIColorRGBComponents(red: 0.8, green: 0.6255, blue: 0.342, alpha: 0.88)

//: `UIColor` has a convenience initializer for creating colors using any of the component structures.
//: * `convenience init(components: UIColorComponents)`

var color = UIColor(components: components)

//: Each component scheme also has a method to produce a color:
//: * `func color() -> UIColor`

components = UIColorHSBComponents(hue: 0.5, saturation: 0.4, brightness: 0.6, alpha: 0.99)
color = components.color()


//: These component structures can be retrieved from existing colors using the following properties of `UIColor`:
//: * `var rgbComponents: UIColorRGBComponents`
//: * `var hsbComponents: UIColorHSBComponents`
//: * `var grayscaleComponents: UIColorGrayscaleComponents`

components = color.rgbComponents
components = color.hsbComponents
components = color.grayscaleComponents



//: ### Component Values
//: Each component value is now available as a property of `UIColor`
//: * `var red: CGFloat`
//: * `var green: CGFloat`
//: * `var blue: CGFloat`
//: * `var alpha: CGFloat`
//: * `var hue: CGFloat`
//: * `var saturation: CGFloat`
//: * `var brightness: CGFloat`
//: * `var white: CGFloat`

color.red
color.green
color.blue
color.alpha
color.hue
color.saturation
color.brightness
color.white


//: ## Constants
//: All of the constant-color convenience methods on `UIColor` are now available as global constants.

Black
White
Gray
LightGray
DarkGray
Red
Green
Blue
Cyan
Magenta
Yellow
Orange
Purple
Brown
Clear
