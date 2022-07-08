//
//  ViewController.swift
//  UILabelAttribute
//
//  Created by yilmaz on 8.07.2022.
//

import UIKit

typealias Attribute = (key: NSAttributedString.Key, value: Any, range: NSRange)

class ViewController: UIViewController {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Hello Attribute"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen
        setupLayout()
        
        label.designAttribute(with: [Attribute(key: .font, value: UIFont.systemFont(ofSize: 30), NSRange(location: 0, length: 3)),
                                     Attribute(key: .foregroundColor, value: UIColor.red, NSRange(location: 2, length: 4)),
                                     Attribute(key: .backgroundColor, value: UIColor.blue, NSRange(location: 8, length: 4)),
                                     Attribute(key: .font, value: UIFont.systemFont(ofSize: 60), NSRange(location: 10, length: 2)),
                                     Attribute(key: .underlineColor, value: UIColor.purple, NSRange(location: 0, length: 4)),
                                     Attribute(key: .underlineStyle, value: NSUnderlineStyle.double.rawValue, NSRange(location: 0, length: 4))
                                    ])
    }
    
    private func setupLayout(){
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

extension UILabel {
    
    func designAttribute(with attributes: [Attribute]){
        let myMutableString = NSMutableAttributedString(string: self.text ?? "")
        
        for i in attributes {
            myMutableString.addAttribute(i.key,
                                         value: i.value,
                                         range: i.range)
        }
        self.attributedText = myMutableString
    }
}
