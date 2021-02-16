//
//  PofileCell.swift
//  connecty
//
//  Created by 공대생 on 2021/02/15.
//

import UIKit

class ProfileCell: UICollectionViewListCell{
    
    // MARK: Properties
    
    private var postImageView : UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "postTest")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    // MARK: LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(postImageView)
        postImageView.fillSuperview()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
