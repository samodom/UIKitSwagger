`ColorPalette`
=============

This class provides a simple interface for storing and retrieving commonly used colors by name.  You can create an empty palette or provide a dictionary of colors.

> The typealias `ColorDictionary` has been created for convenience to represent `[String:UIColor]`

 - `var numberOfColors: Int`
 - `var allColors: ColorDictionary`
 - `func addColor(color: UIColor, named: String)`
 - `func replaceColor(color: UIColor, named: String)`
 - `func colorNamed(name: String) -> UIColor?`
 - `func removeColorNamed(name: String)`
 - `func removeAllColors()`


Subscripting is also available for added convenience:

```swift
palette["warningText"] = UIColor.redColor()
let badgeColor = palette["badgeBackground"]
palette["warningText"] = nil
```
