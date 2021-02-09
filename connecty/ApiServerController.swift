//
//  FirebaseController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/05.
//
import UIKit
import SnapKit
import Alamofire

class ApiServerController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func displayWelcome(){
        let loginVC = LoginViewController()
        let navController = UINavigationController(rootViewController: loginVC)
        self.present(navController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
