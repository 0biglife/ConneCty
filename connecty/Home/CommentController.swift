//
//  CommentController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/17.
//

import UIKit

private let reuseIndentifier = "CommentCell"

class CommentController:UICollectionViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure(){
        collectionView.backgroundColor = .white
        collectionView.register(CommentCell.self, forCellWithReuseIdentifier: reuseIndentifier)
    }
}

// MARK: CollectionView DataSource

extension CommentController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIndentifier, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

// MARK: CollectionView FlowLayout

extension CommentController: UICollectionViewDelegateFlowLayout{
    func collectionView( _collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 80)
    }
}

