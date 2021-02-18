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

class HomeHeader :UICollectionReusableView{
    
    static let identifier = "HomePostCellHeaderID"
    
    var delegate: HomePostCellHeaderDelegate?
    
    private var stack = UIStackView()
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.borderWidth = 3
        iv.layer.borderColor = UIColor.lightGray.cgColor
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "giriboi")
        return iv
    }()
    
    private let trackAddButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Track", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleTrack), for: .touchUpInside)
        return button
    }()
    
    private let cameraAddButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Camera", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleCamera), for: .touchUpInside)
        return button
    }()
    
    private let galleryAddButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Gallery", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleGallery), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40/2
        
        let topDivider = UIView()
        topDivider.backgroundColor = .lightGray
        
        let firstDivider = UIView()
        firstDivider.backgroundColor = .lightGray
        
        let secondDivider = UIView()
        secondDivider.backgroundColor = .lightGray
        
        let buttonStack = UIStackView(arrangedSubviews: [trackAddButton,cameraAddButton,galleryAddButton])
        buttonStack.distribution = .fillEqually
        
        addSubview(buttonStack)
        addSubview(topDivider)
        addSubview(firstDivider)
        addSubview(secondDivider)
        
        buttonStack.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 30)
        topDivider.anchor(top: buttonStack.topAnchor, left: leftAnchor, right: rightAnchor, height: 0.5)
        firstDivider.anchor(top: topDivider.bottomAnchor,left: leftAnchor ,bottom: bottomAnchor, paddingLeft: self.frame.width / 3 )
        secondDivider.anchor(top: topDivider.bottomAnchor,bottom: bottomAnchor, right: rightAnchor, paddingRight: self.frame.width / 3 )
    }
    
    @objc func handleTrack(){
        
    }
    @objc func handleCamera(){
        
    }
    @objc func handleGallery(){
        
    }
}
