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

components = UIColorHSBComponents(hue: 0.5, saturation: 0.4, brightness: 0.6, alpha: 0.99)
color = components.color()


//: These component structures can be retrieved from existing colors using the following properties of `UIColor`:

components = color.rgbComponents
components = color.hsbComponents
components = color.grayscaleComponents



//: ### Component Values
//: Each component value is now available as a property of `UIColor`

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


//: ## Color Palette
//: This class provides a simple interface for storing and retrieving commonly used colors by name.  You can create an empty palette or provide a dictionary of colors.
//: * `var numberOfColors: Int`
//: * `func addColor(color: UIColor, named: String)`
//: * `func colorNamed(name: String) -> UIColor?`
//: * `func removeColorNamed(name: String)`
//: * `func removeAllColors()`
//: Subscripting is also available for added convenience.

var palette = ColorPalette(colors: ["badgeBackground": Orange])
palette.addColor(Red, named: "warningText")
palette.addColor(Blue, named: "linkText")
palette.numberOfColors

let badgeBackgroundColor = palette["badgeBackground"]
palette["warningText"] = nil
palette.numberOfColors

palette.removeAllColors()
palette.numberOfColors

