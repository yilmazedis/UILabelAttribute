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
    }
    
    private func setupLayout(){
        view.addSubview(labelAttribute)
        labelAttribute.translatesAutoresizingMaskIntoConstraints = false
        labelAttribute.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        labelAttribute.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(labelAttributes)
        labelAttributes.translatesAutoresizingMaskIntoConstraints = false
        labelAttributes.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
        labelAttributes.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
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
