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

class HomeViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureCollectionView()
    }
    
    func configureNavigationBar(){
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Home"
        UINavigationBar.appearance().isTranslucent = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "message"), style: .plain, target: self, action: #selector(goToMessage))
    }
    
    func configureCollectionView(){
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {return}
        
        collectionView.register(NewPostCellHeader.self, forCellWithReuseIdentifier: NewPostCellHeader.identifier)
        
        collectionView.register(HomePostCell.self, forCellWithReuseIdentifier: HomePostCell.identifier)
        
        collectionView.register(HomePostCellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomePostCellHeader.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }
    
    @objc fileprivate func goToMessage(){
        let messageVC = MessageViewController()
        self.navigationController?.pushViewController(messageVC, animated: true)
    }
}

extension HomeViewController:UICollectionViewDataSource, UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    // MARK : CollectionViewCell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePostCell.identifier, for: indexPath)
        return cell
    }
    
    // MARK : Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomePostCellHeader.identifier, for: indexPath) as! HomePostCellHeader
        header.configure()
        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 60)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 270)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 0)
    }
}
