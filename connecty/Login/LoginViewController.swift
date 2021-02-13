import UIKit
import SnapKit
//import Then

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    var color : String!
    
    private let iconImage: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "splash logo"))
        return iv
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .orange
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var signupButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .orange
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewComponent()
        moveViewWithKeyboard()
        hideKeyboardWhenTappedAround()
    }
    
    override func didReceiveMemoryWarning() {super.didReceiveMemoryWarning()}
    
    @objc func signupTap(){
        let signupVC = SignUpViewController()
        self.navigationController?.pushViewController(signupVC, animated: true)
    }

    @objc func loginTap(){
        let tabBarVC = MainTabBarController()
        tabBarVC.modalPresentationStyle = .fullScreen
        self.present(tabBarVC, animated: true, completion: nil)
        //신동규 강의 : https://www.youtube.com/watch?v=Znx6o_QKP1s&list=PLG9rdv7aU2N4-nuDqAUtfDlKs4iRJaiu7&index=8
        //navigationController?.pushViewController(/*다음 진행할 뷰 이름*/, animated: true)
    }
    
    func configureViewComponent(){
        self.view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemOrange.cgColor, UIColor.systemPink.cgColor]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
        
        signupButton.addTarget(self, action: #selector(signupTap), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginTap), for: .touchUpInside)
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.centerY(inView: view)
        iconImage.setDimensions(height: 65, width: 278)
        
        view.addSubview(signupButton)
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        signupButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        signupButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 240).isActive = true
        signupButton.widthAnchor.constraint(equalToConstant: 325).isActive = true
        signupButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: signupButton.bottomAnchor, constant: 20).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 325).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
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
