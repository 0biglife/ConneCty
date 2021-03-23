//
//  RegistrationController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/12.
//
import UIKit
import SnapKit

class RegistrationController: UIViewController{
    
    // MARK: Properties
    
    private var viewModel = RegistrationViewModel()
    
    private let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "icons8-plus-100"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleProfilePhoto), for: .touchUpInside)
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
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 5
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    private let alreadyHaveAccount: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Already have account?", secondPart: "Sign Up")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    
    private let buttonStack : UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 15
        return stack
    }()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        
        configureNotificationObservers()
        
        moveViewWithKeyboard()
        hideKeyboardWhenTappedAround()
    }
    
    // MARK: Actions
    
    @objc func handleShowSignUp(){
        let vc = MainTabBarController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleShowLogin(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleProfilePhoto(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    @objc func textDidChange(sender: UITextField){
        if sender == emailTF{
            viewModel.email = sender.text
        }else if sender == passwordTF{
            viewModel.password = sender.text
        }else if sender == passwordAgainTF{
            viewModel.passwordAgain = sender.text
        }else if sender == nameTF{
            viewModel.name = sender.text
        }else if sender == userNameTF{
            viewModel.userName = sender.text
        }
        updateForm()
    }
    // MARK: Helpers
    
    func setupUI(){
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemOrange.cgColor, UIColor.systemGreen.cgColor]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
        
        buttonStack.addArrangedSubview(emailTF)
        buttonStack.addArrangedSubview(passwordTF)
        buttonStack.addArrangedSubview(passwordAgainTF)
        buttonStack.addArrangedSubview(nameTF)
        buttonStack.addArrangedSubview(userNameTF)
        buttonStack.addArrangedSubview(signUpButton)
        
        view.addSubview(plusPhotoButton)
        view.addSubview(buttonStack)
        view.addSubview(alreadyHaveAccount)
    }
    
    func setupConstraints(){
        
        plusPhotoButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            $0.size.width.height.equalTo(140)
            $0.centerX.equalTo(view.snp.centerX)
        }
        
        buttonStack.snp.makeConstraints {
            $0.top.equalTo(plusPhotoButton.snp.bottom).offset(32)
            $0.left.equalTo(view.snp.left).offset(32)
            $0.right.equalTo(view.snp.right).offset(-32)
        }
        
        alreadyHaveAccount.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.centerX.equalTo(view.snp.centerX)
        }
    }
    
    func configureNotificationObservers(){
        emailTF.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTF.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordAgainTF.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        nameTF.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        userNameTF.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
}

// MARK: - FormViewModel

extension RegistrationController: FormViewModel{
    func updateForm() {
        signUpButton.backgroundColor = viewModel.buttonBackgroundColor
        signUpButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        signUpButton.isEnabled = viewModel.formIsValid
    }
}

// MARK: - UIImagePickerControllerDelegate

extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else {return}
        plusPhotoButton.layer.cornerRadius = plusPhotoButton.frame.width / 2
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.layer.borderWidth = 2
        plusPhotoButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        self.dismiss(animated: true, completion: nil)
    }
}
