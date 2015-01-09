### Managing button state configuration

There are six "configuration" properties on `UIButton` that are captured in a single encapsulated type called `UIButtonStateConfiguration`:

```swift
struct UIButtonStateConfiguration: Equatable {
    var title: String?
    var attributedTitle: NSAttributedString?
    var titleColor: UIColor?
    var titleShadowColor: UIColor?
    var image: UIImage?
    var backgroundImage: UIImage?
}
```
