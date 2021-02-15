//
//  ProfileHeader.swift
//  connecty
//
//  Created by 공대생 on 2021/02/15.
//

import UIKit

class ProfileHeader: UICollectionReusableView{
    
    // MARK: Properties
    
    private var profileImageView : UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "1p")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Artist_Name"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var editProfileFollowButton:UIButton = {
        let button = UIButton()
        button.setTitle("Edit Profile", for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleEditProfileFollow), for: .touchUpInside)
        return button
    }()
    
    private lazy var postsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.attributedText = attributedStatText(value: 4, label: "posts")
        return label
    }()
    
    private lazy var followersLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.attributedText = attributedStatText(value: 13, label: "follower")
        return label
    }()
    
    private lazy var followingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.attributedText = attributedStatText(value: 1, label: "following")
        return label
    }()
    
    let postGridButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "swift"), for: .normal)
        return button
    }()
    
    let trackGridButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "swift"), for: .normal)
        button.tintColor = UIColor(white: 0, alpha: 0.2)
        return button
    }()
    
    let infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "swift"), for: .normal)
        button.tintColor = UIColor(white: 0, alpha: 0.2)
        return button
    }()
    
    // MARK: LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 78, paddingLeft: 20)
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.borderColor = UIColor.systemGray.cgColor
        profileImageView.setDimensions(height: 100, width: 100)
        profileImageView.layer.cornerRadius = 100/2
        
        addSubview(nameLabel)
        nameLabel.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 27)
        nameLabel.centerX(inView: profileImageView)
        
        addSubview(editProfileFollowButton)
        editProfileFollowButton.anchor(top: nameLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 24, paddingRight: 24)
        
        let stack = UIStackView(arrangedSubviews:  [postsLabel,followersLabel,followingLabel])
        stack.distribution = .fillEqually
        
        addSubview(stack)
        stack.centerY(inView: profileImageView)
        stack.anchor(left: profileImageView.rightAnchor, right: rightAnchor, paddingLeft: 12, paddingRight: 12, height: 50)
        
        let topDivider = UIView()
        topDivider.backgroundColor = .lightGray
        
        let bottomDivider = UIView()
        bottomDivider.backgroundColor = .lightGray
        
        let buttonStack = UIStackView(arrangedSubviews: [postGridButton,trackGridButton,infoButton])
        buttonStack.distribution = .fillEqually
        
        addSubview(buttonStack)
        addSubview(topDivider)
        addSubview(bottomDivider)
        
        buttonStack.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 50)
        topDivider.anchor(top: buttonStack.topAnchor, left: leftAnchor, right: rightAnchor, height: 0.5)
        bottomDivider.anchor(top: buttonStack.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 0.5)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Actions
    
    @objc func handleEditProfileFollow(){
        
    }
    
    // MARK: Helpers
    
    func attributedStatText(value: Int, label: String) -> NSAttributedString{
        let attribuitedText = NSMutableAttributedString(string: "\(value)\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        attribuitedText.append(NSAttributedString(string: label,attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.lightGray]))
        return attribuitedText
    }
}
