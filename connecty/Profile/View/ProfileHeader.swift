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
        iv.image = #imageLiteral(resourceName: "profileBackGroundTest")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .axial
        gradientLayer.frame = iv.bounds
        gradientLayer.colors = [UIColor.white.cgColor,UIColor.black
                                    .cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        iv.layer.addSublayer(gradientLayer)
        
        return iv
    }()
    
    private var profileImageView : UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "selfieTest")
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
        button.setTitle("팔로우", for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.setTitleColor(UIColor(named: "black_white"), for: .normal)
        button.addTarget(self, action: #selector(handleFirstButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondButton:UIButton = {
        let button = UIButton()
        button.setTitle("메세지", for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.setTitleColor(UIColor(named: "black_white"), for: .normal)
        button.addTarget(self, action: #selector(handleSecondButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var thirdButton:UIButton = {
        let button = UIButton()
        button.setTitle("매칭요청", for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.setTitleColor(UIColor(named: "black_white"), for: .normal)
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
        label.attributedText = attributedStatText(value: 30, label: "매칭 수")
        return label
    }()
    
    let trackGridButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tracks", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor(named: "black_white"), for: .normal)
        button.addTarget(self, action: #selector(handleTrackButton), for: .touchUpInside)
        return button
    }()
    
    let infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Info", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor(named: "black_white"), for: .normal)
        button.addTarget(self, action: #selector(handleInfoButton), for: .touchUpInside)
        return button
    }()
    
    let postGridButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Posts", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor(named: "black_white"), for: .normal)
        button.addTarget(self, action: #selector(handlePostButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(named: "white_black")
        
        addSubview(topBGImage)
        topBGImage.anchor(top: topAnchor,left: leftAnchor,right: rightAnchor,height: 148)
        
        let bottomOfImage = UIView()
        bottomOfImage.backgroundColor = UIColor(named: "connectyOrange")
        
        addSubview(bottomOfImage)
        bottomOfImage.anchor(top:topBGImage.bottomAnchor, left: leftAnchor,right: rightAnchor, height: 1)
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 78, paddingLeft: 20)
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.borderColor = UIColor(named: "connectyOrange")?.cgColor
        profileImageView.setDimensions(height: 104, width: 104)
        profileImageView.layer.cornerRadius = 104/2
        
        addSubview(firstButton)
        firstButton.anchor(top: profileImageView.bottomAnchor, left: leftAnchor,paddingTop: 20, paddingLeft: 21, width: 101, height: 25)
        
        addSubview(secondButton)
        secondButton.anchor(left: firstButton.rightAnchor ,paddingLeft: 15, width: 101, height: 25)
        secondButton.centerY(inView: firstButton)
        
        addSubview(thirdButton)
        thirdButton.anchor(left: secondButton.rightAnchor, right: rightAnchor, paddingLeft: 15, paddingRight: 21, width: 101, height: 25)
        thirdButton.centerY(inView: firstButton)
        
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
        
        topDivider.anchor(top: firstButton.bottomAnchor, left: leftAnchor, right: rightAnchor,paddingTop: 12, height: 0.5)
        buttonStack.anchor(top: topDivider.bottomAnchor, left: leftAnchor,right: rightAnchor,paddingTop: 7, height: 11)
        bottomDivider.anchor(top: buttonStack.bottomAnchor, left: leftAnchor, right: rightAnchor,paddingTop: 7, height: 0.5)
        
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
        let attributedText = NSMutableAttributedString(string: "\(value)\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 15)])
        attributedText.append(NSAttributedString(string: label,attributes: [.font: UIFont.systemFont(ofSize: 12), .foregroundColor : UIColor.black]))
//        attributedText.append(NSAttributedString(string: label,attributes: [.font: UIFont.systemFont(ofSize: 12), .foregroundColor : UIColor.lightGray]))
        return attributedText
    }
}
