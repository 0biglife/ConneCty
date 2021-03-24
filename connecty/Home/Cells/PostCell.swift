//
//  CollectionCell.swift
//  connecty
//
//  Created by 공대생 on 2021/02/05.
//

import UIKit
import SnapKit

class PostCell: UICollectionViewCell{
    
    static let identifier = "HomePostCellID"
    
    var post: Post?{
        didSet{
            configurePost()
        }
    }
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.borderWidth = 3
        iv.layer.borderColor = UIColor(named: "gray_white")?.cgColor
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.layer.cornerRadius = 40/2
        iv.image = #imageLiteral(resourceName: "giriboi")
        return iv
    }()
    
    lazy var userNameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor(named: "black_white"), for: .normal)
        button.setTitle("nameLabel", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    lazy var matchingLabel: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.lightGray, for: .normal)
        button.setTitle("매칭 요청하기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return button
    }()
    
    lazy var matchingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "cell_match_nor"), for: .normal)
        button.tintColor = UIColor(named: "gray_white")
        return button
    }()
    
    lazy var postImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "postTest")
        return iv
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "cell_like"), for: .normal)
        button.tintColor = UIColor(named: "gray_white")
        return button
    }()
    
    lazy var commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "cell_comment"), for: .normal)
        button.tintColor = UIColor(named: "gray_white")
        return button
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "cell_share"), for: .normal)
        button.tintColor = UIColor(named: "gray_white")
        return button
    }()
    
    let likesLabel: UILabel = {
        let label = UILabel()
        label.text = "1 like"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    let captionLabel: UILabel = {
        let label = UILabel()
        label.text = "test-captionx for now  .. . .  ."
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let postTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "2 days ago"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    let iconStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    required init?(coder: NSCoder){fatalError("init(coder:) has not been implemented")}
    
    private func configurePost(){
//        guard let post = post else { return }
//        header.user = post.user
//        photoImageView.loadImage(urlString: post.imageUrl)
//        likeButton.setImage(post.likedByCurrentUser == true ? #imageLiteral(resourceName: "like_selected").withRenderingMode(.alwaysOriginal) : #imageLiteral(resourceName: "like_unselected").withRenderingMode(.alwaysOriginal), for: .normal)
//        setLikes(to: post.likes)
//        setupAttributedCaption()
    }
    
    func setupUI(){
        backgroundColor = UIColor(named: "white_black")
        //delegate = self
        
        iconStack.addArrangedSubview(likeButton)
        iconStack.addArrangedSubview(commentButton)
        iconStack.addArrangedSubview(shareButton)
        
        addSubview(profileImageView)
        addSubview(userNameButton)
        addSubview(matchingButton)
        addSubview(matchingLabel)
        addSubview(postImageView)
        addSubview(iconStack)
        addSubview(likesLabel)
        addSubview(captionLabel)
        addSubview(postTimeLabel)
    }
    
    func setupConstraints(){
        
        profileImageView.snp.makeConstraints {
            $0.top.left.equalToSuperview().offset(8)
            $0.size.width.height.equalTo(40)
        }
        
        userNameButton.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView.snp.centerY)
            $0.left.equalTo(profileImageView.snp.right).offset(12)
        }
        
        matchingButton.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-12)
            $0.centerY.equalTo(profileImageView.snp.centerY)
        }
        
        matchingLabel.snp.makeConstraints {
            $0.right.equalTo(matchingButton.snp.left).offset(-8)
            $0.centerY.equalTo(profileImageView.snp.centerY)
        }
        
        postImageView.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(8)
            $0.left.right.equalToSuperview()
            $0.size.height.equalTo(270)
        }
        
        iconStack.snp.makeConstraints {
            $0.top.equalTo(postImageView.snp.bottom)
            $0.width.equalTo(114)
            $0.height.equalTo(40)
        }
        
        likesLabel.snp.makeConstraints {
            $0.top.equalTo(likeButton.snp.bottom).offset(-4)
            $0.left.equalToSuperview().offset(10)
        }
        
        captionLabel.snp.makeConstraints {
            $0.top.equalTo(likesLabel.snp.bottom).offset(9)
            $0.left.equalToSuperview().offset(10)
        }
        
        postTimeLabel.snp.makeConstraints {
            $0.top.equalTo(captionLabel.snp.bottom).offset(9)
            $0.left.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-4)
        }
    }
}

/*
 //내가 꾸민 버튼들,,기억
 
 private let profileImage: UIImageView = {
     let img = UIImageView(frame: CGRect())
     img.image = UIImage(named: "1p.png")
     img.translatesAutoresizingMaskIntoConstraints = false
     img.widthAnchor.constraint(equalToConstant: 40).isActive = true
     img.heightAnchor.constraint(equalTo : img.widthAnchor).isActive = true
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
 
 lazy var matchButton: UIButton = {
     let button = UIButton(type: .system)
     button.setImage(UIImage(systemName: "message.fill"), for: .normal)
     button.tintColor = .orange
     button.imageView?.contentMode = .scaleAspectFill
     button.widthAnchor.constraint(equalToConstant: 34).isActive = true
     button.addTarget(self, action: #selector(matchButtonTapped), for: .touchUpInside)
     return button
 }()
 
 @objc func matchButtonTapped(){
     
 }
 
 private let postImageView: UIImageView = {
     let img = UIImageView(frame: CGRect())
     img.image = UIImage(named: "1p.png")
     img.contentMode = .scaleAspectFit
     img.translatesAutoresizingMaskIntoConstraints = false
     return img
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
 
 //StackView 를 이용한 Cell UI
 
 fileprivate func configure(){
     backgroundColor = .systemOrange
     
     let topStackView = UIStackView(arrangedSubviews: [profileImage,userName,matchButton])
     topStackView.axis = .horizontal
     topStackView.alignment = .center
     topStackView.spacing = 12
     
     profileImage.translatesAutoresizingMaskIntoConstraints = false
     
     let mainStackView = UIStackView(arrangedSubviews: [topStackView, postImageView])
     mainStackView.axis = .vertical
     mainStackView.spacing = 12
     
     addSubview(mainStackView)
     
     mainStackView.translatesAutoresizingMaskIntoConstraints = false
     mainStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
     mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
     mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
     mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
 }
 
 */
