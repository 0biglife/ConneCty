//
//  CollectionViewController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/05.
//

import UIKit

private let collectionCellIdentifier = "cell"
private let collectionHeaderCellIdentifier = "header"

class CollectionViewController: UICollectionViewController{
    
    let items = ["1","2","3","4","5","6","7","8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure(){
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: collectionCellIdentifier)
        collectionView.register(CollectionHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: collectionHeaderCellIdentifier)
    }
}
//수량 지정
extension CollectionViewController{
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentifier, for: indexPath) as! CollectionCell
        cell.item = items[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: collectionHeaderCellIdentifier, for: indexPath) as! CollectionHeaderCell
        return cell
    }
}
//규격 지정
extension CollectionViewController: UICollectionViewDelegateFlowLayout{
    //cell 하나당 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 3) - 2, height: (view.frame.width / 3) - 2)
    }
    //간격조절
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: view.frame.width, height: ((view.frame.width/3)*2))
    }
}
