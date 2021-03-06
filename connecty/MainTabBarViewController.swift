//
//  HomeViewController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/04.
//
import UIKit
import LNPopupController

class MainTabBarController: UITabBarController, UITabBarControllerDelegate{
    
    private let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
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
        tabBar.barTintColor = UIColor(named: "white_black")
        tabBar.unselectedItemTintColor = UIColor(named: "gray_white")
        tabBar.tintColor = .orange //icon select 시 컬러 지정
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 6
        let homeVC = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "co_tabBar_home_nor"), selectedImage: #imageLiteral(resourceName: "co_tabBar_home_sel"), rootViewController: HomeViewController(collectionViewLayout : layout))
        let searchVC = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "co_tabBar_search_nor"), selectedImage: #imageLiteral(resourceName: "co_tabBar_search_sel"), rootViewController: SearchViewController())
        let matchVC = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "cell_match_nor"), selectedImage: #imageLiteral(resourceName: "co_tabBar_match_sel"), rootViewController: matchViewController())
        let practiceVC = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "co_tabBar_practice_nor"), selectedImage: #imageLiteral(resourceName: "co_tabBar_practice_sel"), rootViewController: practiceViewController())
        
        let profileLayout = UICollectionViewFlowLayout()
        let profileVC = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "co_tabBar_profile_nor"), selectedImage: #imageLiteral(resourceName: "co_tabBar_profile_sel"), rootViewController: profileViewController(collectionViewLayout : profileLayout))
        
        viewControllers = [homeVC,searchVC,matchVC,practiceVC,profileVC]
        
    }
    
    func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController)->UINavigationController{
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = UIColor(named: "black_white")
        return nav
    }
}
