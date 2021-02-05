//
//  HomeViewController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/04.
//

import UIKit
import Firebase
import FirebaseAuth

class MainTabBarController: UITabBarController, UITabBarControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = .white
        delegate = self
        configure()
        
//        if Auth.auth().currentUser == nil {
//            presentLoginController()
//        } else {
//            setupViewControllers()
//        }
    }
    
    func configure(){
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let matchVC = UINavigationController(rootViewController: matchViewController())
        let practiceVC = UINavigationController(rootViewController: practiceViewController())
        let profileVC = UINavigationController(rootViewController: profileViewController())
        
        homeVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: .history , tag: 1)
        searchVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: .search , tag: 2)
        matchVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: .more , tag: 3)
        practiceVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: .favorites , tag: 4)
        profileVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: .featured , tag: 5)
        //homeVC.tabBarItem = UITabBarItem.init(title: "Home", image: UIIMage(named: "~"), tag : 3)
        viewControllers = [homeVC,searchVC,matchVC,practiceVC,profileVC]
        
        guard let items = tabBar.items else {return}
        for item in items{
            item.imageInsets = UIEdgeInsets(top: 10,left: 0,bottom: -10,right: 0)
        }
    }
}

