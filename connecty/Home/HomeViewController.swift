//
//  HomeViewController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/04.
//

import UIKit

//protocol HomePostCellDelegate {
//    func didTapComment(post: Post)
//    func didTapUser(user: User)
//    func didTapOptions(post: Post)
//    func didLike(for cell: HomePostCell)
//}

class HomeViewController: UICollectionViewController {
    
    private let popularUser: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("인기 아티스트", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.tintColor = .red
        return button
    }()
    
    private let bulletinBoard: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("게시판", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.tintColor = .red
        return button
    }()
    
    private let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTopStackView()
        configureNavigationBar()
        configureCollectionView()
    }
    
    func configureTopStackView(){
        view.addSubview(topView)
        topView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: collectionView.topAnchor, right: view.rightAnchor)
        topView.setHeight(100)
    }
    
    func configureNavigationBar(){
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Home"
        UINavigationBar.appearance().isTranslucent = false
        
        let uplaodButton = UIBarButtonItem(image: #imageLiteral(resourceName: "home_navigation_upload") ,style: .plain , target: self, action: #selector(goToUpload))
        let alarmButton = UIBarButtonItem(image: #imageLiteral(resourceName: "home_navigation_bell") ,style: .plain , target: self, action: #selector(goToAlarm))
        
        navigationItem.rightBarButtonItems = [alarmButton,uplaodButton]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "home_navigation_message") ,style: .plain , target: self, action: #selector(goToAlarm))
    }
    
    // MARK: - Helpers
    
    func configureCollectionView(){
        
//        collectionView.backgroundColor = .
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: view.frame.height ), collectionViewLayout: layout)
//        collectionView.contentInset.top = 47
        
        guard let collectionView = collectionView else {return}
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PostCell.self, forCellWithReuseIdentifier: PostCell.identifier)
        collectionView.register(TrackCell.self, forCellWithReuseIdentifier: TrackCell.identifier)
//        collectionView.register(HomeHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeHeader.identifier)
        
        view.addSubview(collectionView)
//        collectionView.frame = view.bounds
    }
    
    @objc func goToAlarm(){
        let messageVC = homeSettingViewController()
        self.navigationController?.pushViewController(messageVC, animated: true)
    }
    
    @objc func goToUpload(){
        let vc = UploadViewController()
        vc.modalPresentationStyle = .formSheet
        vc.accessibilityViewIsModal = true
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    
    @objc func goToMessage(){
        let messageVC = homeSettingViewController()
        self.navigationController?.pushViewController(messageVC, animated: true)
    }
}

// MARK: - UICollectionView DataSource

extension HomeViewController{
    /*
    // MARK: - Header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeHeader.identifier, for: indexPath) as! HomeHeader
        header.configure()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 83)
    }*/
    
    // MARK: - PostCell
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let postCell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCell.identifier, for: indexPath) as! PostCell
        let trackCell = collectionView.dequeueReusableCell(withReuseIdentifier: TrackCell.identifier, for: indexPath) as! TrackCell
        
        if (indexPath.row % 2) == 0 {
            return postCell
        }else{
            return trackCell
        }
    }
}

// MARK: - Size of each Cell

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        
        if (indexPath.row % 2) == 0 {
            var height = 270 + 8 + 40 + 8
            height += 50
            height += 60
            return CGSize(width: width, height: 56 + 270 + 110)
        }else{
            return CGSize(width: width, height: 56 + 12 + 100 + 12 + 10 + 12 + 10) 
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
