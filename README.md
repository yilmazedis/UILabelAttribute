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
    
    func designAttributes(with attributes: [Attributes]){
        let attributedText = NSMutableAttributedString(string: self.text ?? "")
        
        for i in attributes {
            attributedText.addAttributes(i.keys,
                                         range: i.range)
        }
        self.attributedText = attributedText
    }
}   

```
## Helper Tuples
```swift
typealias Attribute = (key: NSAttributedString.Key, value: Any, range: NSRange)
typealias Attributes = (keys: [NSAttributedString.Key: Any], range: NSRange)
```

## Example
### DesignAttribute
```swift
labelAttribute.designAttribute(with: [Attribute(key: .font, value: UIFont.systemFont(ofSize: 30), range: NSRange(location: 0, length: 3)),
                                      Attribute(key: .foregroundColor, value: UIColor.red, range: NSRange(location: 2, length: 4)),
                                      Attribute(key: .backgroundColor, value: UIColor.blue, range: NSRange(location: 8, length: 4)),
                                      Attribute(key: .font, value: UIFont.systemFont(ofSize: 60), range: NSRange(location: 10, length: 2)),
                                      Attribute(key: .underlineColor, value: UIColor.purple, range: NSRange(location: 0, length: 4)),
                                      Attribute(key: .underlineStyle, value: NSUnderlineStyle.double.rawValue, range: NSRange(location: 0, length: 4))
                                     ])
```
### DesignAttributes

```swift
labelAttributes.designAttributes(with: [Attributes(keys: [.foregroundColor: UIColor.blue,
                                                          .backgroundColor: UIColor.yellow,
                                                          .underlineStyle: 1],
                                                   range: NSRange(location: 0, length: 5)),
                                        Attributes(keys: [.foregroundColor: UIColor.red,
                                                          .backgroundColor: UIColor.blue,
                                                          .strikethroughStyle: 1],
                                                    range: NSRange(location: 5, length: 5)),
                                        Attributes(keys: [.foregroundColor: UIColor.green,
                                                          .backgroundColor: UIColor.black,
                                                          .font: UIFont.systemFont(ofSize: 40)],
                                                    range: NSRange(location: 10, length: 6))

                                        ])
```

## Demo

|   Demo Ver-1              |  Demo ver-2               |        Demo ver-3         |
|:-------------------------:|:-------------------------:|:-------------------------:|
<img src=img/demoVer-1.png width="214" height="463"> | <img src=img/demoVer-2.png width="214" height="463">  | <img src=img/demoVer-3.png width="214" height="463">  |
