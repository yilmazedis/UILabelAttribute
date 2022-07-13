//
//  ViewController.swift
//  UILabelAttribute
//
//  Created by yilmaz on 8.07.2022.
//

import UIKit

typealias Attribute = (key: NSAttributedString.Key, value: Any, range: NSRange)
typealias Attributes = (keys: [NSAttributedString.Key: Any], range: NSRange)

class ViewController: UIViewController {
    
    lazy var labelAttribute: UILabel = {
        let label = UILabel()
        label.text = "Hello Attribute"
        return label
    }()
    
    lazy var labelAttributes: UILabel = {
        let label = UILabel()
        label.text = "Hello Attributes"
        return label
    }()
    
    lazy var placingDocument: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var placingImage: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var placingHyperlink: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var enumerateAttribute: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen
        setupLayout()
        
        labelAttribute.designAttribute(with: [Attribute(key: .font, value: UIFont.systemFont(ofSize: 30), range: NSRange(location: 0, length: 3)),
                                              Attribute(key: .foregroundColor, value: UIColor.red, range: NSRange(location: 2, length: 4)),
                                              Attribute(key: .backgroundColor, value: UIColor.blue, range: NSRange(location: 8, length: 4)),
                                              Attribute(key: .font, value: UIFont.systemFont(ofSize: 60), range: NSRange(location: 10, length: 2)),
                                              Attribute(key: .underlineColor, value: UIColor.purple, range: NSRange(location: 0, length: 4)),
                                              Attribute(key: .underlineStyle, value: NSUnderlineStyle.double.rawValue, range: NSRange(location: 0, length: 4))
                                             ])
        
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
        enumerateAttributeExample()
        placingDocumentExample()
        placingImageExample()
        placingHyperlinkExample()
    }
    
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
    
    private func placingDocumentExample() {
        
        let fullString = NSMutableAttributedString(string: "My flag: ")
        
        let data = Data("<img src='https://flagcdn.com/w80/tr.png' />".utf8)
        
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            // use your attributed string somehow
            
            fullString.append(attributedString)
            placingDocument.attributedText = fullString
        }
    }
    
    private func placingHyperlinkExample() {
        
        let hyperlinkString = NSMutableAttributedString(string: "Want to learn iOS? Visit Me :D")
        hyperlinkString.addAttribute(.link, value: "https://github.com/yilmazedis",
                                      range: NSRange(location: 25,
                                                     length: 2))

        placingHyperlink.attributedText = hyperlinkString
    }
    
    private func placingImageExample() {
        
        let fullString = NSMutableAttributedString(string: "My profile: ")
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "Me")
        
        let imageString = NSAttributedString(attachment: imageAttachment)
        fullString.append(imageString)
        
        placingImage.attributedText = fullString
    }
    
    private func setupLayout(){
        view.addSubview(labelAttribute)
        labelAttribute.translatesAutoresizingMaskIntoConstraints = false
        labelAttribute.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 240).isActive = true
        labelAttribute.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(labelAttributes)
        labelAttributes.translatesAutoresizingMaskIntoConstraints = false
        labelAttributes.centerYAnchor.constraint(equalTo: labelAttribute.bottomAnchor, constant: 50).isActive = true
        labelAttributes.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(placingDocument)
        placingDocument.translatesAutoresizingMaskIntoConstraints = false
        placingDocument.centerYAnchor.constraint(equalTo: labelAttributes.bottomAnchor, constant: 50).isActive = true
        placingDocument.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(placingImage)
        placingImage.translatesAutoresizingMaskIntoConstraints = false
        placingImage.centerYAnchor.constraint(equalTo: placingDocument.bottomAnchor, constant: 50).isActive = true
        placingImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(placingHyperlink)
        placingHyperlink.translatesAutoresizingMaskIntoConstraints = false
        placingHyperlink.centerYAnchor.constraint(equalTo: placingImage.bottomAnchor, constant: 50).isActive = true
        placingHyperlink.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(enumerateAttribute)
        enumerateAttribute.translatesAutoresizingMaskIntoConstraints = false
        enumerateAttribute.centerYAnchor.constraint(equalTo: placingHyperlink.bottomAnchor, constant: 50).isActive = true
        enumerateAttribute.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

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
