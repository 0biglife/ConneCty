//
//  RegistrationController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/12.
//
import UIKit

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
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
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
        
        let stack = UIStackView(arrangedSubviews: [emailTF,passwordTF,passwordAgainTF,nameTF,userNameTF,signUpButton])
        stack.axis = .vertical
        stack.spacing = 15
        
        view.addSubview(stack)
        stack.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(alreadyHaveAccount)
        alreadyHaveAccount.centerX(inView: view)
        alreadyHaveAccount.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
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
