import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel = LoginViewModel()
    
    private let iconImage: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "co_img_connecty_logo_noslogan"))
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var emailTF: CustomTextField = {
        let tf = CustomTextField(placeholder: "Email")
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    lazy var passwordTF: CustomTextField = {
        let tf = CustomTextField(placeholder: "password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "아직 계정이 없으신가요?", secondPart: "회원가입")
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).withAlphaComponent(0.5)
        button.isEnabled = false
        button.layer.cornerRadius = 5
        button.setHeight(40)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    private let forgotAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let boldAtts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white : 1, alpha: 0.7), .font: UIFont.boldSystemFont(ofSize: 12)]
        let attributedTitle = NSMutableAttributedString(string: "아이디 찾기", attributes: boldAtts)
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleforgotAccount), for: .touchUpInside)
        return button
    }()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        let boldAtts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white : 1, alpha: 0.7), .font: UIFont.boldSystemFont(ofSize: 12)]
        let attributedTitle = NSMutableAttributedString(string: "비밀번호 찾기", attributes: boldAtts)
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handlePasswordButton), for: .touchUpInside)
        return button
    }()
   
    private let typingStack : UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 25
        return stack
    }()
    
    private let forgotStack : UIStackView = {
        var stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        return stack
    }()

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        
        configureNotificationObservers()
        
        moveViewWithKeyboard()
        hideKeyboardWhenTappedAround()
    }
    override func didReceiveMemoryWarning() {super.didReceiveMemoryWarning()}
    
    // MARK: - Actions
    
    @objc func handleforgotAccount(){
    }
    
    @objc func handlePasswordButton(){
    }
    
    @objc func handleLogin(){
        let tabBarVC = MainTabBarController()
        tabBarVC.modalPresentationStyle = .fullScreen
        self.present(tabBarVC, animated: true, completion: nil)
        //신동규 강의 : https://www.youtube.com/watch?v=Znx6o_QKP1s&list=PLG9rdv7aU2N4-nuDqAUtfDlKs4iRJaiu7&index=8
        //navigationController?.pushViewController(/*다음 진행할 뷰 이름*/, animated: true)
    }

    @objc func handleSignUp(){
        let signupVC = RegistrationController()
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
    
    @objc func textDidChange(sender: UITextField){
        if sender == emailTF{
            viewModel.email = sender.text
        }else{
            viewModel.password = sender.text
        }
        updateForm()
    }
    
    func setupUI(){
        self.view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.white.cgColor, UIColor.systemPink.cgColor]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
        
        forgotStack.addArrangedSubview(forgotPasswordButton)
        forgotStack.addArrangedSubview(forgotAccountButton)
        typingStack.addArrangedSubview(passwordTF)
        typingStack.addArrangedSubview(emailTF)
                                       
        view.addSubview(iconImage)
        view.addSubview(typingStack)
        view.addSubview(signupButton)
        view.addSubview(forgotStack)
        view.addSubview(loginButton)
        
    }
    
    func setupConstraints(){
        
        iconImage.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.width.equalTo(65)
            $0.height.equalTo(278)
        }
        
        typingStack.snp.makeConstraints {
            $0.top.equalTo(iconImage.snp.bottom).offset(100)
            $0.left.equalTo(view.snp.left).offset(32)
            $0.right.equalTo(view.snp.right).offset(-32)
        }
        
        signupButton.snp.makeConstraints {
            $0.top.equalTo(typingStack.snp.bottom).offset(20)
            $0.left.equalTo(typingStack.snp.left)
            $0.right.equalTo(typingStack.snp.right)
        }
        
        forgotStack.snp.makeConstraints {
            $0.top.equalTo(signupButton.snp.bottom).offset(5)
            $0.centerX.equalTo(view.snp.centerX)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(forgotStack.snp.bottom).offset(100)
            $0.left.equalTo(view).offset(32)
            $0.right.equalTo(view).offset(-32)
            $0.centerX.equalToSuperview()
        }
        
    }
    
    func configureNotificationObservers(){
        emailTF.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTF.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}

// MARK: - FormViewModel

extension LoginViewController: FormViewModel{
    func updateForm() {
        loginButton.backgroundColor = viewModel.buttonBackgroundColor
        loginButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        loginButton.isEnabled = viewModel.formIsValid
    }
}
/*
 //SnapKit 적용 전 Layout
 
 typingStack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 100, paddingLeft: 32, paddingRight: 32)
 
 signupButton.anchor(top: typingStack.bottomAnchor,left: typingStack.leftAnchor, right: typingStack.rightAnchor, paddingTop: 20)
 
 forgotStack.anchor(top: signupButton.bottomAnchor, paddingTop: 5)
 forgotStack.centerX(inView: view)
 
 loginButton.anchor(top: forgotStack.bottomAnchor,left: view.leftAnchor, right: view.rightAnchor, paddingTop: 100, paddingLeft: 32, paddingRight: 32)
 loginButton.centerX(inView: view)
 
 
 */

/*
//then 적용
 
 class ViewController: UIViewController {

     let nameLabel = UILabel().then{
         $0.text = "LABEL"
         $0.textColor = .red
         $0.textAlignment = .center
         $0.font = UIFont.systemFont(ofSize: 18)
     }
     let nameTextField = UITextField().then{
         $0.backgroundColor = .gray
     }
     let changeButton = UIButton().then{
         $0.backgroundColor = .blue
         $0.setTitle("BUTTON", for: .normal)
     }
     
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .white
         
         self.setUpView()
     }

     func setUpView(){
         self.view.addSubview(self.nameLabel)
         self.view.addSubview(self.nameTextField)
         self.view.addSubview(self.changeButton)
         
         self.changeButton.snp.makeConstraints{
             $0.center.equalToSuperview()
         }
         self.nameLabel.snp.makeConstraints {
             $0.top.equalToSuperview().offset(80)
             $0.leading.equalToSuperview().offset(24)
             $0.trailing.equalToSuperview().offset(-24)
         }
         self.nameTextField.snp.makeConstraints {
             $0.top.equalTo(self.nameLabel.snp.bottom).offset(24)
             //$0.leading.equalTo(self.nameLabel) + $0.trailing.equalTo(self.nameLabel)
             $0.leading.trailing.equalTo(self.nameLabel)
         }
     }
 }
*/
