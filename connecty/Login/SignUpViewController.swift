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
    
    private let loginButton:UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 5
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    // 클릭하면 글자 자체가 버튼역할을 해서 넘어가도록 하는 것.
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.7), .font: UIFont.systemFont(ofSize: 12)]
        let attributedTitle = NSMutableAttributedString(string: "Forgot your password?  ", attributes: atts)
        let boldAtts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white : 1, alpha: 0.7), .font: UIFont.boldSystemFont(ofSize: 12)]
        attributedTitle.append(NSAttributedString(string: "Can help Signing in", attributes: boldAtts))
        button.setAttributedTitle(attributedTitle, for: .normal)
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
        
        let stack = UIStackView(arrangedSubviews: [emailTF, passwordTF,forgotPasswordButton,loginButton])
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 500, paddingLeft: 32, paddingRight: 32)
        
//        view.addSubview(loginButton)
//        loginButton.anchor(top: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: -80 ,paddingLeft: 32, paddingRight: 32)
//        loginButton.addTarget(self, action: #selector(signupEvent), for: .touchUpInside)
    }
    
    @objc func signupEvent(){
        let tabBarVC = MainTabBarController()
        tabBarVC.modalPresentationStyle = .fullScreen
        self.present(tabBarVC, animated: true, completion: nil)
        
    }
}
