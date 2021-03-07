//
//  profileViewController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/05.
//
import UIKit

private let cellIdentifier = "ProfileCell"
private let headerIdentifier = "ProfileHeader"

class profileViewController: UICollectionViewController{
    
    // MARK: Properties
    
    static let identifier = "profileViewControllerID"
    
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: Helpers
    
    func configure(){
        navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "userName"
        
        view.backgroundColor = UIColor(named: "white_black")
        
        let uplaodButton = UIBarButtonItem(image: #imageLiteral(resourceName: "home_navigation_upload") ,style: .plain , target: self, action: #selector(goToUpload))
        let alarmButton = UIBarButtonItem(image: #imageLiteral(resourceName: "home_navigation_bell") ,style: .plain , target: self, action: #selector(goToAlarm))
        
        navigationItem.rightBarButtonItems = [alarmButton,uplaodButton]
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {return}
        
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
    }
    
    
    @objc func handleSetting(){
        let vc = profileSettingViewController()
        navigationItem.backButtonTitle = ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goToAlarm(){
        let messageVC = homeSettingViewController()
        navigationItem.backButtonTitle = ""
        self.navigationController?.pushViewController(messageVC, animated: true)
    }
    
    @objc func goToUpload(){
        let vc = UploadViewController()
        vc.modalPresentationStyle = .formSheet
        vc.accessibilityViewIsModal = true
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
}

// MARK: DataSource

extension profileViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ProfileCell
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! ProfileHeader
        
        return header
    }
}

// MARK: Section

extension profileViewController{
    
}

// MARK: Layout

extension profileViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 2) / 3
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 265)
    }
}
