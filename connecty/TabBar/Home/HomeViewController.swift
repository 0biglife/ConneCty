//
//  HomeViewController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/04.
//

import UIKit

class HomeViewController: UIViewController{
    
//    lazy var scrollView:UIScrollView = {
//        let v = UIScrollView()
//        v.backgroundColor = .systemBackground
//        v.contentSize = CGSize(width: view.frame.width, height: 2000)
//        return v
//    }()
    
    //let items = ["1","2","3","4","5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //CollectionView Setting Starts.
    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return items.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CollectionCell
//        cell.item = items[indexPath.row]
//        return cell
//    }
    
    func configure(){
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Home"
        
//        collectionView?.backgroundColor = .systemBackground
//        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: "cellID")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "message"), style: .plain, target: self, action: #selector(goToMessage))
    }
    
    @objc fileprivate func goToMessage(){
        let messageVC = MessageViewController()
        self.navigationController?.pushViewController(messageVC, animated: true)
    }
}

//extension HomeViewController: UICollectionViewDelegateFlowLayout{
//    //cell 하나당 사이즈
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: view.frame.width)
//    }
//    //간격조절
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 1
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 1
//    }
//}
