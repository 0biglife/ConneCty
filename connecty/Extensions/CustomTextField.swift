//
//  CustomTextField.swift
//  connecty
//
//  Created by 공대생 on 2021/02/12.
//

import UIKit

class CustomTextField: UITextField{
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        let spacer = UIView()
        spacer.setDimensions(height: 40, width: 12)
        leftView = spacer
        leftViewMode = .always
        borderStyle = .roundedRect
        textColor = .black
        keyboardAppearance = .dark
        //keyboardType = .emailAddress
        backgroundColor = .lightText
        setHeight(40)
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor:UIColor(white:1, alpha:0.7)])
    }
    required init?(coder: NSCoder){fatalError("init(coder:) has not been implemented")}
    
}
