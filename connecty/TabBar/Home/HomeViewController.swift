//
//  HomeViewController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/04.
//

import UIKit

class HomeViewController: UIViewController{
    
    lazy var scrollView:UIScrollView = {
        let v = UIScrollView()
        v.backgroundColor = .systemBackground
        v.contentSize = CGSize(width: view.frame.width, height: 2000)
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Home"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "message"), style: .plain, target: self, action: #selector(goToMessage))
    }
    
    @objc fileprivate func goToMessage(){
        let messageVC = MessageViewController()
        self.navigationController?.pushViewController(messageVC, animated: true)
    }
}
