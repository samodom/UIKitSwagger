Working with Sliders
====================

As a convenience, the minimum and maximum values for the slider can be get and set via a closed interval property called `interval`.

```swift
slider.minimumValue = 2
slider.maximumValue = 99
//  slider.interval equals 2 ... 9

slider.interval = -20 ... 1.1
//  minimumValue now equals -20
//  maximumValue now equals 1.1
```
