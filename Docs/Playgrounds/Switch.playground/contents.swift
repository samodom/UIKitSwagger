//: # Switch Toggling Convenience
//: Although modifying the `on` property of `UISwitch` (with or without animation) is simple enough, sometimes it's nice to see more explicit actions in code.  Thus, the following property and methods are provided:


import UIKitSwagger

var toggle = UISwitch()
toggle.on
toggle.off
toggle.turnOn()
toggle.turnOff()
toggle.animateOn()
toggle.animateOff()
toggle.toggle()
toggle.toggle()
toggle.animateToggle()
toggle.on
toggle.setOff(true, animated: true)
toggle.off

