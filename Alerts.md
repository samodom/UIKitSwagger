Working with Alert Controllers
==============================

### Adding Alert Actions and Text Fields

Use the `+=` syntax to add alert actions to an alert controller:
 - `controller += cancelAction`
 - `controller += [sendAction, deleteAction, cancelAction]`

Use the `+=` syntax to text fields to an `Alert`-style alert controller.
One at a time:
```swift
controller += { (field: UITextField) -> Void in
    // configure text field here
}
```

Or as an array:
```swift
let field1Handler = { (field: UITextField) -> Void in
  // configure text field 1 here
}
let field2Handler = { (field: UITextField) -> Void in
  // configure text field 2 here
}
let field3Handler = { (field: UITextField) -> Void in
  // configure text field 3 here
}
controller += [field1Handler, field2Handler, field3Handler]
```

### Enabling/Disabling Alert Actions

Use these shortcuts to enable or disable an alert action:
 - `func enable()`
 - `func disable()`

> For convenience, the following type aliases are provided for easier declaration of alert action and text field configuration handlers:

> `typealias UIAlertTextFieldConfigurationHandler = (UITextField!) -> Void`

> `typealias UIAlertActionHandler = (UIAlertAction!) -> Void`
