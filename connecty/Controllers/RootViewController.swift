import UIKit
import SnapKit
//import Then

class RootViewController: UIViewController {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "HHHH"
        return label
    }()
    
    lazy var buttonTest: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var viewTest: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var textFieldTest: UITextField = {
        let tf = UITextField()
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewComponent()
        self.moveViewWithKeyboard()
        self.hideKeyboardWhenTappedAround()
        
        buttonTest.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton(){
        //탭바 만들기 + present 하기
        let tabbarVC = UITabBarController()
        tabbarVC.setViewControllers(<#T##viewControllers: [UIViewController]?##[UIViewController]?#>, animated: <#T##Bool#>)
    }
    
    func configureViewComponent(){
        self.view.backgroundColor = .systemBackground
        
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        //nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        //nameLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        
        view.addSubview(buttonTest)
        buttonTest.translatesAutoresizingMaskIntoConstraints = false
        buttonTest.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        buttonTest.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor).isActive = true
        buttonTest.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        
        view.addSubview(viewTest)
        viewTest.translatesAutoresizingMaskIntoConstraints = false
        viewTest.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        viewTest.topAnchor.constraint(equalTo: buttonTest.bottomAnchor, constant: 20).isActive = true
        viewTest.widthAnchor.constraint(equalToConstant: 100).isActive = true
        viewTest.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.addSubview(textFieldTest)
        textFieldTest.translatesAutoresizingMaskIntoConstraints = false
        textFieldTest.topAnchor.constraint(equalTo: viewTest.topAnchor).isActive = true
        textFieldTest.bottomAnchor.constraint(equalTo: viewTest.bottomAnchor).isActive = true
        textFieldTest.leftAnchor.constraint(equalTo: viewTest.leftAnchor, constant: 4).isActive = true
        textFieldTest.rightAnchor.constraint(equalTo: viewTest.rightAnchor, constant: -4).isActive = true
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
