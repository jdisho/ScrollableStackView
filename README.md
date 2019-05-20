# ScrollableStackView
A simple class that leverages the power of Auto Layout to make `UIStackView` scrollable.

- 📚 Acts as a normal `UIStackView`, but scrollable.
- 📖 Subclassed from `UIScrollView` and uses `UIStackView` under the hood.
- 👶 Easy-to-understand codebase (~ 100 lines of code) 
- 🎉 No external dependencies.

## ⚙️ Installation 
Download [ScrollableStackView](https://github.com/jdisho/ScrollableStackView/blob/master/ScrollableStackView/ScrollableStackView.swift) and manually import the file into your project.

## 📚 Usage
- Initializing
```swift 
  let stackView = ScrollableStackView(frame: CGRect)
  // or
  let stackView = ScrollabelStackView(arrangedSubviews: [UIView]) // returns a new stack view object that manages the provided views
```

- Manage arranged subviews
```swift 
 var arrangedSubviews: [UIView] // list of views arranged by the stack view
 
 func addArrangedSubview(UIView) // adds *a view* to the end of the arrangedSubviews

 func addArrangedSubviews([UIView]) // adds *views* to the end of the arrangedSubviews
 
 func insertArrangedSubview(UIView, at: Int) // adds the provided view to the array of arranged subviews at the specified index
 
 func removeArrangedSubview(UIView) // removes the provided *view* from the stack’s array of arranged subviews
 
 func removeArrangedSubviews([UIView]) // removes the provided *views* from the stack’s array of arranged subviews
 
```
  
 - Configure the layout
```swift 
  var axis: NSLayoutConstraint.Axis // default .horizontal
   
  var distribution: UIStackView.Distribution // default .fill
  
  var aligment: UIStackView.Distribution // default .fill
  
  var spacing: CGFloat // default 0.0
  
  var insets: UIEdgeInsets // default .zero
```

*I intent to keep this code base as simple as possible. Just as normal `UIStackView`, which scrolls. If you are interested in a scrollable `UIStackView` on steroids, check out [AloeStackView](https://github.com/airbnb/AloeStackView) by [Airbnb](https://github.com/airbnb).*

## 🙏 Acknowledgements
- Inspired from [Agnes Vasarhelyi](https://twitter.com/vasarhelyia)'s [Scrollable UIStackView](https://blog.alltheflow.com/scrollable-uistackview/)
- Official `UIStackView` [documentation](https://developer.apple.com/documentation/uikit/uistackview?changes=latest_minor)
- Created by [Joan Disho](twitter.com/_disho)
