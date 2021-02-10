//
//  CollectionCell.swift
//  connecty
//
//  Created by 공대생 on 2021/02/05.
//

import UIKit

class HomePostCell: UICollectionViewCell{
    
    static let identifier = "HomePostCellID"
    
    private let profileImage: UIImageView = {
        let img = UIImageView(frame: CGRect())
        img.image = UIImage(named: "1p.png")
        img.layer.cornerRadius = 20
        img.clipsToBounds = true
        img.layer.borderWidth = 3
        img.layer.borderColor = UIColor.red.cgColor
        return img
    }()
    
    private let userName: UIButton = {
        let label = UIButton(type: .system)
        label.backgroundColor = .yellow
        label.setTitle("ArtistName", for: .normal)
        label.setTitleColor(.black, for: .normal)
        label.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        label.addTarget(self, action: #selector(userNameTap), for: .touchUpInside)
        return label
    }()
    
    @objc func userNameTap(){
        
    }
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect())
        imageView.image = UIImage(named: "1p.png")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "message"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "message"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "message"), for: .normal)
        button.tintColor = .black
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder){fatalError("init(coder:) has not been implemented")}
    
    func configure(){
        backgroundColor = .systemOrange
    }
}
