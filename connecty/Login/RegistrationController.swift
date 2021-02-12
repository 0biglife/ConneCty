//
//  RegistrationController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/12.
//
import UIKit

class RegistrationController: UIViewController{
    
    // MARK: Properties
    
    private let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "icons8-plus-100"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    lazy var emailTF: CustomTextField = {
        let tf = CustomTextField(placeholder: "E-mail")
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    lazy var passwordTF: CustomTextField = {
        let tf = CustomTextField(placeholder: "password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var passwordAgainTF: CustomTextField = {
        let tf = CustomTextField(placeholder: "password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var nameTF: CustomTextField = CustomTextField(placeholder: "Full name")
    lazy var userNameTF: CustomTextField = CustomTextField(placeholder: "User Name")
    
    private let signUpButton:UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up" , for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 5
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: Helpers
    
    func configure(){
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemOrange.cgColor, UIColor.systemGreen.cgColor]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.setDimensions(height: 140, width: 140)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stack = UIStackView(arrangedSubviews: [emailTF,passwordTF,passwordAgainTF,nameTF,userNameTF])
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
    }
}
