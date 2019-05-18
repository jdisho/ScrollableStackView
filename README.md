# ScrollableStackView
A simple class that leverages the power of Auto Layout to make `UIStackView` scrollable.

- 📚 A normal `UIStackView`, but scrollable.
- 👶 Easy-to-understand codebase (< 100 lines of code) 
- 🎉 No external dependencies.

## ⚙️ Installation 
Download [ScrollableStackView](https://github.com/jdisho/ScrollableStackView/blob/master/ScrollableStackView/ScrollableStackView.swift) and manually import the file into your project.

## 📚 Usage
 
- Manage arranged subviews
  ```swift 
   let stackView: ScrollableStackView()
  stackView.stack(...)
  ```
 - Configure the layout
 ```swift 
  var axis: NSLayoutConstraint.Axis // default .horizontal
  
  var distribution: UIStackView.Distribution // default .fill
  
  var aligment: UIStackView.Distribution // default .fill
  
  var spacing: CGFloat // default 0.0
  
  var insets: UIEdgeInsets // default .zero
  ```

## 🙏 Acknowledgements
Inspired from [Agnes Vasarhelyi](https://twitter.com/vasarhelyia)'s [Scrollable UIStackView](https://blog.alltheflow.com/scrollable-uistackview/)
