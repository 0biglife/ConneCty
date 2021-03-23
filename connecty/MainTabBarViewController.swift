//
//  HomeViewController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/04.
//
import UIKit
import PBPopupController

class MainTabBarController: UITabBarController, UITabBarControllerDelegate, PBPopupControllerDelegate, PBPopupBarDataSource{
    
    
    
    // MARK: - Liftcycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupUI()
        setMiniPlayer()
//        if Auth.auth().currentUser == nil {
//            presentLoginController()
//        } else {
//            setupViewControllers()
//        }
    }
    
    // MARK: - Helpers
    
    func setupUI(){
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
    
    func setMiniPlayer(){
        self.tabBarController?.popupController.delegate = self
        
        if (self.tabBarController?.popupBar) != nil{
            popupBar.dataSource = self
            
            popupBar.image = #imageLiteral(resourceName: "testTrackImage")
            popupBar.title = "Title"
            popupBar.subtitle = "Subtitle"
            popupBar.accessibilityLabel = "Testing ...."
            
            let popupPlayButtonItem = UIBarButtonItem(image: UIImage(systemName: "play"), style: .plain, target: self, action: #selector(TrackCell.handlePlay))
//            let popupNextButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "next-small"), style: .plain, target: self, action: #selector(nextAction(_:)))
            popupPlayButtonItem.accessibilityLabel = NSLocalizedString("Play", comment: "")
            
            popupBar.rightBarButtonItems = [popupPlayButtonItem]
            
            let popupContentVC = self.storyboard?.instantiateViewController(withIdentifier: "PopupContentViewController") as? PopupContentViewController
            self.tabBarController?.presentPopupBar(withPopupContentViewController: popupContentVC, animated: true, completion: {
                print("Presented")
            })
//            button.setImage(UIImage(systemName: "play"), for: .normal)
//            button.addTarget(self, action: #selector(handlePlay), for: .touchUpInside)
        }
    }
    
    func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController)->UINavigationController{
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = UIColor(named: "black_white")
        return nav
    }
    
    
}
