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

## Examples
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

### Enumerate Attribute
```swift
private func enumerateAttributeExample() {
    let sentence = "the cat sat on the mat"
    let regularAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]
    let largeAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 40)]
    let italicAttributes = [NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 24)]
    let attributedSentence = NSMutableAttributedString(string: sentence, attributes: regularAttributes)

    // Set bold
    attributedSentence.setAttributes(largeAttributes, range: NSRange(location: 0, length: 3))
    attributedSentence.setAttributes(largeAttributes, range: NSRange(location: 8, length: 3))
    attributedSentence.setAttributes(largeAttributes, range: NSRange(location: 15, length: 3))

    // Set italic
    attributedSentence.setAttributes(italicAttributes, range: NSRange(location: 4, length: 3))
    attributedSentence.setAttributes(italicAttributes, range: NSRange(location: 12, length: 2))
    attributedSentence.setAttributes(italicAttributes, range: NSRange(location: 19, length: 3))

    attributedSentence.enumerateAttribute(.font, in: NSRange(0..<attributedSentence.length)) { value, range, stop in

        guard let font = value as? UIFont else {
            return
        }

        // make sure this font is actually bold
        if font.fontDescriptor.symbolicTraits.contains(.traitBold) {
            // it's bold, so make it red too
            attributedSentence.addAttribute(.foregroundColor, value: UIColor.red, range: range)
        }

        // make sure this font is actually traitItalic
        if font.fontDescriptor.symbolicTraits.contains(.traitItalic) {
            // it's traitItalic, so make it systemBlue too
            attributedSentence.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: range)
        }
    }

    enumerateAttribute.attributedText = attributedSentence
}
```

### Placing Document
```swift
private func placingDocumentExample() {

    let fullString = NSMutableAttributedString(string: "My flag: ")

    let data = Data("<img src='https://flagcdn.com/w80/tr.png' />".utf8)

    if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
        // use your attributed string somehow

        fullString.append(attributedString)
        placingDocument.attributedText = fullString
    }
}
```

### Placing Hyperlink
```swift
private func placingHyperlinkExample() {

    let hyperlinkString = NSMutableAttributedString(string: "Want to learn iOS? Visit Me :D")
    let rangeLink = hyperlinkString.mutableString.range(of: "Me")
    hyperlinkString.addAttribute(.link, value: "https://github.com/yilmazedis",
                                  range: rangeLink)

    placingHyperlink.attributedText = hyperlinkString
    placingHyperlink.linkTextAttributes = [.foregroundColor: UIColor.red,
                                                  .underlineColor: UIColor.red,
                                                  .underlineStyle: NSUnderlineStyle.single.rawValue]
}
```

### Placing Image
```swift
private func placingImageExample() {

    let fullString = NSMutableAttributedString(string: "Your profile: ")

    let imageAttachment = NSTextAttachment()
    imageAttachment.image = UIImage(named: "Me")

    let imageString = NSAttributedString(attachment: imageAttachment)
    fullString.append(imageString)

    placingImage.attributedText = fullString
}
```

## Demo

|   Demo Ver-1              |  Demo ver-2               |        Demo ver-3         |
|:-------------------------:|:-------------------------:|:-------------------------:|
<img src=img/demoVer-1.png width="214" height="463"> | <img src=img/demoVer-2.png width="214" height="463">  | <img src=img/demoVer-3.png width="214" height="463">  |
