//
//  CollectinHeaderCell.swift
//  connecty
//
//  Created by 공대생 on 2021/02/05.
//

import UIKit
//인스타 피드 맨위 계정 설명란
protocol HomePostCellHeaderDelegate{
    func didTapUser()
}
class HomePostCellHeader :UICollectionReusableView{
    
    static let identifier = "HomePostCellHeaderID"
    
    var delegate: HomePostCellHeaderDelegate?
    
    let postHeader: UIView = {
        let vi = UIView()
        return vi
    }()
    let profileImage: UIImageView = {
        let img = UIImageView(frame: CGRect())
        img.image = UIImage(named: "1p.png")
        img.layer.cornerRadius = 20
        img.clipsToBounds = true
        img.layer.borderWidth = 3
        img.layer.borderColor = UIColor.red.cgColor
        return img
    }()
    
    let userName: UIButton = {
        let label = UIButton(type: .system)
        label.backgroundColor = .yellow
        label.setTitle("ArtistName", for: .normal)
        label.setTitleColor(.black, for: .normal)
        label.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        label.addTarget(self, action: #selector(userNameTap), for: .touchUpInside)
        return label
    }()
    
    @objc func userNameTap(){
        delegate?.didTapUser()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(){
        backgroundColor = .white
        addSubview(postHeader)
        
        addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        addSubview(userName)
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        userName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60).isActive = true
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        postHeader.frame = bounds
    }
}

/*
 let imageV = UIImageView(frame: CGRect(x: 50, y: 100, width: 100, height: 100))
 imageV.image = UIImage(named: "test.png", in: Bundle(for: type(of: self)), compatibleWith: nil)
 imageV.center = view.center
 imageV.layer.cornerRadius = 50
 imageV.clipsToBounds = true
 imageV.layer.borderWidth = 5
 imageV.layer.borderColor = UIColor.white.cgColor
 view.addSubview(imageV)
 */
