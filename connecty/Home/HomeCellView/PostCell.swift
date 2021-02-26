//
//  CollectionCell.swift
//  connecty
//
//  Created by 공대생 on 2021/02/05.
//

import UIKit

protocol HomePostCellDelegate: class {
    func didTapUser()
    func didTapMatch()
    func didLike()
    func didTapComment()
    func didTapShare()
    func didTapPlay()
}

class PostCell: UICollectionViewCell{
    
    static let identifier = "HomePostCellID"
    
    var delegate: HomePostCellDelegate?
    
//    var viewModel: PostViewModel{
//        didSet{
//            configure()
//        }
//    }
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.borderWidth = 3
        iv.layer.borderColor = UIColor(named: "gray_white")?.cgColor
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "giriboi")
        return iv
    }()
    
    private lazy var userNameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor(named: "black_white"), for: .normal)
        button.setTitle("nameLabel", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(didTapUserName), for: .touchUpInside)
        return button
    }()
    
    private lazy var matchingLabel: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.lightGray, for: .normal)
        button.setTitle("매칭 요청하기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.addTarget(self, action: #selector(handleMatchIcon), for: .touchUpInside)
        return button
    }()
    
    private lazy var matchingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "cell_match_nor"), for: .normal)
        button.tintColor = UIColor(named: "gray_white")
        button.addTarget(self, action: #selector(handleMatchIcon), for: .touchUpInside)
        return button
    }()
    
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "postTest")
        return iv
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "cell_like"), for: .normal)
        button.tintColor = UIColor(named: "gray_white")
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "cell_comment"), for: .normal)
        button.tintColor = UIColor(named: "gray_white")
        button.addTarget(self, action: #selector(didTapComment), for: .touchUpInside)
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "cell_share"), for: .normal)
        button.tintColor = UIColor(named: "gray_white")
        return button
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.text = "1 like"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.text = "test-captionx for now  .. . .  ."
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private let postTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "2 days ago"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    private var stackView = UIStackView()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder){fatalError("init(coder:) has not been implemented")}
    
    func configure(){
        backgroundColor = UIColor(named: "white_black")
        //delegate = self
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40/2
        
        addSubview(userNameButton)
        userNameButton.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 12)
        
        addSubview(matchingButton)
        matchingButton.anchor(right: rightAnchor,paddingRight: 12)
        matchingButton.centerY(inView: profileImageView)
        
        addSubview(matchingLabel)
        matchingLabel.anchor(right: matchingButton.leftAnchor, paddingRight: 8)
        matchingLabel.centerY(inView: profileImageView)

        addSubview(postImageView)
        postImageView.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8)
        postImageView.setHeight(270)
        
        configureActionButtons()
        
        addSubview(likesLabel)
        likesLabel.anchor(top:likeButton.bottomAnchor, left: leftAnchor,paddingTop: -4, paddingLeft: 10)
        
        addSubview(captionLabel)
        captionLabel.anchor(top: likesLabel.bottomAnchor, left: leftAnchor, paddingTop: 9, paddingLeft: 10)
        
        addSubview(postTimeLabel)
        postTimeLabel.anchor(top: captionLabel.bottomAnchor,left: leftAnchor, bottom: bottomAnchor, paddingTop: 9, paddingLeft: 10, paddingBottom: 4)
    }
    
    // MARK: - Actions
    
    @objc func didTapUserName(){
        delegate?.didTapUser()
        print("tapped complete")
    }
    
    @objc func didTapComment(){
        delegate?.didTapComment()
    }
    
    @objc func handleMatchIcon(){
        delegate?.didTapMatch()
        let vc = MatchingModalViewController()
        vc.modalPresentationStyle = .formSheet
        vc.modalTransitionStyle = .crossDissolve
//        present(vc, animated: true, completion: nil)
    }
    
    // MARK: - Helpers ( Helper Function )
    func configureActionButtons(){
        stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.anchor(top: postImageView.bottomAnchor, width: 114, height: 40)
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
