//
//  SignUpViewController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/06.
//
import UIKit
import SnapKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController, UITextFieldDelegate{
    
    let remoteConfig = RemoteConfig.remoteConfig()
    var color : String?
    
    lazy var emailTF: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        tf.autocorrectionType = UITextAutocorrectionType.no
        tf.keyboardType = UIKeyboardType.default
        tf.returnKeyType = UIReturnKeyType.done
        tf.clearButtonMode = UITextField.ViewMode.whileEditing
        tf.delegate = self
        return tf
    }()
    
    lazy var nameTF: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        tf.autocorrectionType = UITextAutocorrectionType.no
        tf.keyboardType = UIKeyboardType.default
        tf.returnKeyType = UIReturnKeyType.done
        tf.clearButtonMode = UITextField.ViewMode.whileEditing
        tf.delegate = self
        return tf
    }()
    
    lazy var passwordTF: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        tf.autocorrectionType = UITextAutocorrectionType.no
        tf.keyboardType = UIKeyboardType.default
        tf.returnKeyType = UIReturnKeyType.done
        tf.clearButtonMode = UITextField.ViewMode.whileEditing
        tf.delegate = self
        return tf
    }()
    
    lazy var signupButton:UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 24
        return button
    }()
    
    lazy var cancelButton:UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 24
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let statusBar = UIView()
//        self.view.addSubview(statusBar)
//        statusBar.snp.makeConstraints{(m) in
//            m.right.top.left.equalTo(self.view)
//            m.height.equalTo(20)
//        }
//        color = remoteConfig["splash_background"].stringValue
//        statusBar.backgroundColor = UIColor(hex: color!)
//        signup.backgroundColor = UIColor(hex: color!)
//        cancel.backgroundColor = UIColor(hex: color!)
        signupButton.addTarget(self, action: #selector(signupEvent), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelEvent), for: .touchUpInside)
    }
    
    @objc func signupEvent(){
        Auth.auth().createUser(withEmail: emailTF.text!, password: passwordTF.text!){ (user, err) in
            guard let uid = user?.user.uid else { return }
//            Database.database().reference().child("users").child(uid).setValue(["name": self.name.text!])
            
        }
    }
    @objc func cancelEvent(){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

