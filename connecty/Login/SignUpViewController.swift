//
//  SignUpViewController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/06.
//
import UIKit
import SnapKit

class SignUpViewController: UIViewController, UITextFieldDelegate{
    
    //private let viewModel = LoginViewModel()
    
    var color : String?
    
    lazy var emailTF: CustomTextField = {
        let tf = CustomTextField(placeholder: "E-mail")
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    lazy var nameTF: CustomTextField = {
        let tf = CustomTextField(placeholder: "User Name")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var passwordTF: CustomTextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
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
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    // 클릭하면 글자 자체가 버튼역할을 해서 넘어가도록 하는 것.
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Forgot you password", secondPart: "Get help Signing in.")
        button.addTarget(self, action: #selector(handlebutton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moveViewWithKeyboard()
        hideKeyboardWhenTappedAround()
        
        configure()
//        signupButton.addTarget(self, action: #selector(signupEvent), for: .touchUpInside)
//        cancelButton.addTarget(self, action: #selector(cancelEvent), for: .touchUpInside)
    }
    override func didReceiveMemoryWarning() {super.didReceiveMemoryWarning()}
    
    // MARK: - Actions
    
    @objc func handlebutton(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleShowSignUp(){
        let vc = RegistrationController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Helpers
    
    func configure(){
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemOrange.cgColor, UIColor.systemRed.cgColor]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
        
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
