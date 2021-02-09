//
//  CollectionCell.swift
//  connecty
//
//  Created by 공대생 on 2021/02/05.
//

import UIKit

class HomePostCell: UICollectionViewCell{
    
    static let identifier = "HomePostCellID"
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "1p.png")
        imageView.backgroundColor = .red
        return imageView
    }()
    
    lazy var testLabel: UILabel = {
        let label = UILabel()
        label.text = "POST TESTING"
        label.backgroundColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
        contentView.addSubview(testLabel)
        contentView.addSubview(postImageView)
    }
    required init?(coder: NSCoder){fatalError("init(coder:) has not been implemented")}
}
