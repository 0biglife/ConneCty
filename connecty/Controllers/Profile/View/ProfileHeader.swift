//
//  ProfileHeader.swift
//  connecty
//
//  Created by 공대생 on 2021/02/15.
//

import UIKit

class ProfileHeader: UICollectionReusableView{
    
    // MARK: Properties
    
    private var topBGImage: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "bgtest")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
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
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    private lazy var firstButton :UIButton = {
        let button = UIButton()
        button.setTitle("Insight", for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleFirstButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondButton:UIButton = {
        let button = UIButton()
        button.setTitle("Edit Profile", for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleSecondButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var followingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.attributedText = attributedStatText(value: 1, label: "Following")
        return label
    }()
    
    private lazy var followersLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.attributedText = attributedStatText(value: 13, label: "Follower")
        return label
    }()
    
    private lazy var postsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.attributedText = attributedStatText(value: 4, label: "Posts")
        return label
    }()
    
    let trackGridButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Track", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleTrackButton), for: .touchUpInside)
        return button
    }()
    
    let infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Myinfo", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleInfoButton), for: .touchUpInside)
        return button
    }()
    
    let postGridButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Posts", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handlePostButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.09815724939, green: 0.09785347432, blue: 0.1108924821, alpha: 1)
        
        addSubview(topBGImage)
        topBGImage.anchor(top: topAnchor,left: leftAnchor,right: rightAnchor,height: 138)
        
        let bottomOfImage = UIView()
        bottomOfImage.backgroundColor = #colorLiteral(red: 0.9985190034, green: 0.5495392084, blue: 0, alpha: 1)
        
        addSubview(bottomOfImage)
        bottomOfImage.anchor(top:topBGImage.bottomAnchor, left: leftAnchor,right: rightAnchor, height: 3)
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 78, paddingLeft: 20)
        profileImageView.layer.borderWidth = 5
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.setDimensions(height: 100, width: 100)
        profileImageView.layer.cornerRadius = 100/2
        
        addSubview(firstButton)
        firstButton.anchor(top: profileImageView.bottomAnchor, left: leftAnchor,paddingTop: 20, paddingLeft: 24, width: 145, height: 26)
        
        addSubview(secondButton)
        secondButton.anchor(left: firstButton.rightAnchor, right: rightAnchor, paddingLeft: 24, paddingRight: 24, width: 145, height: 26)
        secondButton.centerY(inView: firstButton)
        
        let stack = UIStackView(arrangedSubviews:  [followingLabel,followersLabel,postsLabel])
        stack.distribution = .fillEqually
        
        addSubview(stack)
        stack.anchor(top: bottomOfImage.bottomAnchor, left: profileImageView.rightAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 12, paddingRight: 12, height: 50)
        
        let topDivider = UIView()
        topDivider.backgroundColor = .lightGray
        
        let bottomDivider = UIView()
        bottomDivider.backgroundColor = .lightGray
        
        let buttonStack = UIStackView(arrangedSubviews: [trackGridButton,infoButton,postGridButton])
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
    
    @objc func handleFirstButton(){
        
    }
    
    @objc func handleSecondButton(){
        
    }
    
    @objc func handleTrackButton(){
        
    }
    
    @objc func handleInfoButton(){
        
    }
    
    @objc func handlePostButton(){
        
    }
    
    // MARK: Helpers
    
    func attributedStatText(value: Int, label: String) -> NSAttributedString{
        let attributedText = NSMutableAttributedString(string: "\(value)\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: label,attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.lightGray]))
        return attributedText
    }
}
