# UILabelAttribute

## Code
```swift
extension UILabel {
    
    func designAttribute(with attributes: [Attribute]){
        let attributedText = NSMutableAttributedString(string: self.text ?? "")
        
        for i in attributes {
            attributedText.addAttribute(i.key,
                                         value: i.value,
                                         range: i.range)
        }
        self.attributedText = attributedText
    }
}

```
## Helper Tuple
```swift
typealias Attribute = (key: NSAttributedString.Key, value: Any, range: NSRange)
```

## Example
```swift
label.designAttribute(with: [Attribute(key: .font, value: UIFont.systemFont(ofSize: 30), NSRange(location: 0, length: 3)),
                             Attribute(key: .foregroundColor, value: UIColor.red, NSRange(location: 2, length: 4)),
                             Attribute(key: .backgroundColor, value: UIColor.blue, NSRange(location: 8, length: 4)),
                             Attribute(key: .font, value: UIFont.systemFont(ofSize: 60), NSRange(location: 10, length: 2)),
                             Attribute(key: .underlineColor, value: UIColor.purple, NSRange(location: 0, length: 4)),
                             Attribute(key: .underlineStyle, value: NSUnderlineStyle.double.rawValue, NSRange(location: 0, length: 4))
                            ])
```

## Demo

|  Goal Demo                |
|:-------------------------:|
<img src=img/demo.png width="214" height="463">  |
