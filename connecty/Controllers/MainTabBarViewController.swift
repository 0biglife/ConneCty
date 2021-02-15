//
//  HomeViewController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/04.
//
import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate{
    
    // MARK: - Liftcycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        configure()
//        if Auth.auth().currentUser == nil {
//            presentLoginController()
//        } else {
//            setupViewControllers()
//        }
    }
    
    // MARK: - Helpers
    
    func configure(){
        tabBar.barTintColor = .systemBackground
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 6
        let homeVC = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "home2-1"), selectedImage: #imageLiteral(resourceName: "co_ic_navigation_home_sel"), rootViewController: HomeViewController(collectionViewLayout : layout))
        let searchVC = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "co_ic_navigation_search_nor"), selectedImage: #imageLiteral(resourceName: "co_ic_navigation_search_sel"), rootViewController: SearchViewController())
        let matchVC = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "co_ic_navigation_match_nor"), selectedImage: #imageLiteral(resourceName: "co_ic_navigation_match_sel"), rootViewController: matchViewController())
        let practiceVC = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "co_ic_navigation_practicing_nor"), selectedImage: #imageLiteral(resourceName: "co_ic_navigation_practicing_sel"), rootViewController: practiceViewController())
        
        let profileLayout = UICollectionViewFlowLayout()
        let profileVC = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "co_ic_navigation_profile_nor"), selectedImage: #imageLiteral(resourceName: "co_ic_navigation_profile_sel"), rootViewController: profileViewController(collectionViewLayout : profileLayout))
        
        viewControllers = [homeVC,searchVC,matchVC,practiceVC,profileVC]
        
        tabBar.tintColor = .white //icon select 시 컬러 지정
        
        
    }
    
    func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController)->UINavigationController{
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        return nav
    }
}

