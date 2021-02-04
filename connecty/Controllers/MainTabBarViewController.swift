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
        
        homeVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: .history , tag: 1)
        searchVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: .search , tag: 2)
        //homeVC.tabBarItem = UITabBarItem.init(title: "Home", image: UIIMage(named: "~"), tag : 3)
        viewControllers = [homeVC,searchVC]
        
        guard let items = tabBar.items else {return}
        for item in items{
            item.imageInsets = UIEdgeInsets(top: 10,left: 0,bottom: -10,right: 0)
        }
    }
}

