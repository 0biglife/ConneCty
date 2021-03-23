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
    
    private let buttonStack : UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moveViewWithKeyboard()
        hideKeyboardWhenTappedAround()
        
        setupUI()
        setupConstraints()
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
    
    func setupUI(){
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemOrange.cgColor, UIColor.systemRed.cgColor]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
        
        buttonStack.addArrangedSubview(passwordTF)
        buttonStack.addArrangedSubview(emailTF)
        buttonStack.addArrangedSubview(loginButton)
        buttonStack.addArrangedSubview(forgotPasswordButton)
        
        view.addSubview(buttonStack)
    }
    
    func setupConstraints(){
        buttonStack.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(500)
            $0.left.equalTo(view.snp.left).offset(32)
            $0.right.equalTo(view.snp.right).offset(-32)
        }
    }

    @objc func signupEvent(){
        let tabBarVC = MainTabBarController()
        tabBarVC.modalPresentationStyle = .fullScreen
        self.present(tabBarVC, animated: true, completion: nil)
    }
}
