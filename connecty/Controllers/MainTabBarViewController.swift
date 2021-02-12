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
        
        let homeVC = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "icons8-lumpy-space-princess-80"), selectedImage: #imageLiteral(resourceName: "icons8-lumpy-space-princess-80"), rootViewController: HomeViewController(collectionViewLayout : layout))
        let searchVC = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "icons8-lumpy-space-princess-80"), selectedImage: #imageLiteral(resourceName: "icons8-lumpy-space-princess-80"), rootViewController: SearchViewController())
        let matchVC = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "icons8-lumpy-space-princess-80"), selectedImage: #imageLiteral(resourceName: "icons8-lumpy-space-princess-80"), rootViewController: matchViewController())
        let practiceVC = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "icons8-lumpy-space-princess-80"), selectedImage: #imageLiteral(resourceName: "icons8-lumpy-space-princess-80"), rootViewController: practiceViewController())
        let profileVC = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "icons8-lumpy-space-princess-80"), selectedImage: #imageLiteral(resourceName: "icons8-lumpy-space-princess-80"), rootViewController: profileViewController())
        
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

