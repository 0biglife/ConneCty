
import UIKit

class TrackCell: UICollectionViewCell{
    
    static let identifier = "TrackCellID"
    
    var playCount = 0
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.borderWidth = 3
        iv.layer.borderColor = UIColor.lightGray.cgColor
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "giriboi2")
        return iv
    }()
    
    private lazy var userNameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("nameLabel", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
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
        button.setImage(#imageLiteral(resourceName: "cell_match_light_nor"), for: .normal)
        button.tintColor = .gray
        button.addTarget(self, action: #selector(handleMatchIcon), for: .touchUpInside)
        return button
    }()
    
    
    private let trackCellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let trackImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "musicTestImage")
        return iv
    }()
    
    private lazy var playButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(UIImage(systemName: "play"), for: .normal)
        button.addTarget(self, action: #selector(handlePlay), for: .touchUpInside)
        return button
    }()
    
    private lazy var songTitle: UILabel = {
        let label = UILabel()
        label.text = "ON MY WAY(Prod.COLDE$T)"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "co_ic_feed_like_sel"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "cell_comment"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "cell_share_nor"), for: .normal)
        button.tintColor = .black
        return button
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
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40/2
        
        addSubview(userNameButton)
        userNameButton.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 8)
        
        addSubview(matchingButton)
        matchingButton.anchor(right: rightAnchor,paddingRight: 12)
        matchingButton.centerY(inView: profileImageView)
        
        addSubview(matchingLabel)
        matchingLabel.anchor(right: matchingButton.leftAnchor, paddingRight: 8)
        matchingLabel.centerY(inView: profileImageView)
        
//        addSubview(trackCellView)
//        trackCellView.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10)
        
        addSubview(trackImage)
        trackImage.anchor(top: profileImageView.bottomAnchor, left: leftAnchor,bottom: bottomAnchor, paddingTop: 8, paddingLeft: 8,paddingBottom: 8)
        trackImage.widthAnchor.constraint(equalTo: trackImage.heightAnchor, multiplier: 1.0).isActive = true
        
        addSubview(playButton)
        playButton.anchor(top: trackImage.topAnchor, left: trackImage.leftAnchor)
        playButton.centerX(inView: trackImage)
        playButton.centerY(inView: trackImage)
        
        addSubview(songTitle)
        songTitle.anchor(top: topAnchor, left: trackImage.rightAnchor,right: rightAnchor, paddingTop: 90, paddingLeft: 10)
        
        
        configureActionButtons()
        
//        addSubview(postTimeLabel)
//        postTimeLabel.anchor(top: trackImage.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
    }
    
    // MARK: - Actions
    
    @objc func didTapUserName(){
        print("tapped complete")
    }
    
    @objc func handleMatchIcon(){
        
    }
    
    @objc func handlePlay(){
    }
    
    // MARK: - Helpers ( Helper Function )
    func configureActionButtons(){
        stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 30
        
        addSubview(stackView)
        stackView.anchor(top: songTitle.bottomAnchor, left: trackImage.rightAnchor,paddingTop:0, paddingLeft: 10,height: 50)
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
