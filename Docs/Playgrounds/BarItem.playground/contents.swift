//: # Enabling/Disable Bar Items

import UIKitSwagger

let frame = CGRect(x: 0, y: 0, width: 320, height: 44)
var toolbar = UIToolbar(frame: frame)
let cancelButton = UIBarButtonItem(barButtonSystemItem: .Cancel, target: nil, action: nil)
let spacer = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
let doneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: nil, action: nil)

toolbar.items = [cancelButton, spacer, doneButton]
toolbar

cancelButton.disable()
toolbar

cancelButton.enable()
doneButton.disable()
toolbar

