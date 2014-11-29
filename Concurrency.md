Concurrency
===========

As we all know, updates to user interface elements should be made on the main thread for them to take effect in real-time.  The conventional GCD syntax is a bit cumbersome in the middle of code that simply might be running on an inconvenient thread.

```swift
dispatch_async(dispatch_get_main_queue()) {
    button.enabled = false
    imageView.image = newImage
}
```

This is especially ugly if all that you want to do is invoke a single method that has no arguments or return type

```swift
dispatch_async(dispatch_get_main_queue()) {
    imageView.startAnimating()
}
```


In order to clean up the syntax and to emphasize the importance of the code that is being executed, the exclamation point (!) is used as a prefix operator to a closure.  The provided closure will be executed on the main thread.

```swift
!{
    button.enabled = false
    imageView.image = newImage
}
```
```swift
!imageView.startAnimating
```

> Notice that the final example does not use parentheses.
