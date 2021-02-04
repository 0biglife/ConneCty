//
//  HomeViewController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/04.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = .white
        delegate = self
        configure()
    }
    
    func configure(){
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        
        homeVC.tabBarItem.image = UIImage(systemName: "Home")
        homeVC.tabBarItem.selectedImage = UIImage(systemName: "Home")
        searchVC.tabBarItem.image = UIImage(systemName: "Search")
        searchVC.tabBarItem.selectedImage = UIImage(systemName: "Search")
        
        viewControllers = [homeVC,searchVC]
    }
}

