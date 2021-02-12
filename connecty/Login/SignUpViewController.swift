//
//  SignUpViewController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/06.
//
import UIKit
import SnapKit

class SignUpViewController: UIViewController, UITextFieldDelegate{
    
    var color : String?
    
    lazy var emailTF: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.textColor = .black
        tf.backgroundColor = .lightGray
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        tf.autocorrectionType = UITextAutocorrectionType.no
        tf.keyboardType = .emailAddress
        tf.returnKeyType = UIReturnKeyType.done
        tf.clearButtonMode = UITextField.ViewMode.whileEditing
        tf.keyboardAppearance = .dark
        tf.setHeight(50)
        tf.attributedPlaceholder = NSAttributedString(string: "E-mail", attributes: [.foregroundColor:UIColor(white:1, alpha:0.7)])
        tf.delegate = self
        return tf
    }()
    
    lazy var nameTF: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.textColor = .black
        tf.backgroundColor = .lightGray
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        tf.autocorrectionType = UITextAutocorrectionType.no
        tf.keyboardType = .emailAddress
        tf.returnKeyType = UIReturnKeyType.done
        tf.clearButtonMode = UITextField.ViewMode.whileEditing
        tf.keyboardAppearance = .dark
        tf.setHeight(50)
        tf.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [.foregroundColor:UIColor(white:1, alpha:0.7)])
        tf.delegate = self
        return tf
    }()
    
    lazy var passwordTF: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.textColor = .black
        tf.backgroundColor = .lightGray
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        tf.autocorrectionType = UITextAutocorrectionType.no
        tf.keyboardType = .emailAddress
        tf.returnKeyType = UIReturnKeyType.done
        tf.clearButtonMode = UITextField.ViewMode.whileEditing
        tf.keyboardAppearance = .dark
        tf.setHeight(50)
        tf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [.foregroundColor:UIColor(white:1, alpha:0.7)])
        tf.isSecureTextEntry = true
        tf.delegate = self
        return tf
    }()
    
    lazy var loginButton:UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 5
        button.setHeight(50)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moveViewWithKeyboard()
        hideKeyboardWhenTappedAround()
        
        configure()
//        signupButton.addTarget(self, action: #selector(signupEvent), for: .touchUpInside)
//        cancelButton.addTarget(self, action: #selector(cancelEvent), for: .touchUpInside)
    }
    override func didReceiveMemoryWarning() {super.didReceiveMemoryWarning()}
    
    func configure(){
        
        let stack = UIStackView(arrangedSubviews: [emailTF, passwordTF])
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 500, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(loginButton)
        loginButton.anchor(top: stack.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 32, paddingRight: 32)
        
    }
    
    @objc func signupEvent(){
    }
}
