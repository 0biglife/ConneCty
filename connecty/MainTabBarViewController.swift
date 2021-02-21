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
        let homeVC = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "co_ic_tabBar_home_nor"), selectedImage: #imageLiteral(resourceName: "co_ic_tabBar_home_sel"), rootViewController: HomeViewController(collectionViewLayout : layout))
        let searchVC = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "co_ic_tabBar_search_nor"), selectedImage: #imageLiteral(resourceName: "co_ic_tabBar_search_sel"), rootViewController: SearchViewController())
        let matchVC = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "co_ic_tabBar_match_nor"), selectedImage: #imageLiteral(resourceName: "co_ic_tabBar_match_sel"), rootViewController: matchViewController())
        let practiceVC = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "co_ic_tabBar_practicing_nor"), selectedImage: #imageLiteral(resourceName: "co_ic_tabBar_practicing_sel"), rootViewController: practiceViewController())
        
        let profileLayout = UICollectionViewFlowLayout()
        let profileVC = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "co_ic_tabBar_profile_nor"), selectedImage: #imageLiteral(resourceName: "co_ic_tabBar_profile_sel"), rootViewController: profileViewController(collectionViewLayout : profileLayout))
//        #imageLiteral(resourceName: "co_ic_tabBar_search_nor")
//        #imageLiteral(resourceName: "co_ic_feed_like_nor")
//        #imageLiteral(resourceName: "co_ic_tabBar_home_nor")
//        #imageLiteral(resourceName: "co_ic_navigation_Hamburger_Bar")
//        #imageLiteral(resourceName: "co_ic_tabBar_home_nor")
        viewControllers = [homeVC,searchVC,matchVC,practiceVC,profileVC]
        
        tabBar.tintColor = .orange //icon select 시 컬러 지정
        
        
    }
    
    func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController)->UINavigationController{
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = UIColor(named: "oppositeColor")
        return nav
    }
}
