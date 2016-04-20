UIKitSwagger
============


* ![](https://img.shields.io/badge/platform-_iOS_8,_9-lightgrey.svg?style=flat-square)
* ![](https://img.shields.io/badge/language-Swift_2.2-orange.svg?style=flat-square)
* ![](https://img.shields.io/badge/version-0.8.0-green.svg?style=flat-square)


 - [Working with Views](Docs/Views.md) and [Stack Views](Docs/StackViews.md) in particular
 - [Auto Layout Convenience](Docs/AutoLayout.md)
 - [Concurrency](Docs/Concurrency.md)
 - [Character Attributes](Docs/CharacterAttributes.md) with [Attributed Strings](Docs/AttributedStrings.md)
 - [Working with Alert Controllers](Docs/Alerts.md)
 - [Switch Toggling Convenience](Docs/Switch.md)
 - [Working with Sliders](Docs/Slider.md)
 - [Working with Steppers](Docs/Stepper.md)
 - [Color Convenience](Docs/Color.md) and a [ColorPalette](Docs/ColorPalette.md) class
 - [UIKit Dynamics](Docs/Dynamics.md)
 - [Enabling/Disabling Various Items](Docs/EnableDisable.md)
 - [Managing An Activity Indicator View](Docs/SpinnerStateManager.md)


Available as a [CocoaPod](http://cocoapods.org)

---

Tests run successfully on iOS 9 simulators, but since the `@available` syntax does not appear to currently work in test suites, tests will not run on iOS 8 simulators.  In order to run all of the tests available for iOS 8, you will need to disable all of the following tests:

- `LayoutGuideLayoutAttributesTests` (entire test class)
- `StackViewSyntaxTests` (entire test class)
- `ViewAddableSyntaxTests.testAddingLayoutGuideArrayWithOperator()`
- `ViewAddableSyntaxTests.testAddingLayoutGuideWithOperator()`
- `ViewAddableSyntaxTests.testCannotRemoveLayoutGuideNotInView()`
- `ViewAddableSyntaxTests.testRemovingLayoutGuideArrayWithOperator()`
- `ViewAddableSyntaxTests.testRemovingLayoutGuideWithOperator()`
