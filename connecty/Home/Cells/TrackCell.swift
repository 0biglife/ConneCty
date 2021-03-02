
import UIKit

//extension NSMutableAttributedString{
//    func appendImage(_ image: UIImage){
//        let imageAttchment: NSTextAttachment = NSTextAttachment()
//        imageAttchment.image = image
//        let strImage: NSAttributedString = NSAttributedString(attachment: imageAttchment)
//        self.append(strImage)
//    }
//}

extension HomePostCellDelegate {
    func didTapPlay(){
        
    }
}

class TrackCell: UICollectionViewCell{
    
    static let identifier = "TrackCellID"
    
    var delegate: HomePostCellDelegate?
    
    var post: Post?{
        didSet{
            configurePost()
        }
    }
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.borderWidth = 3
        iv.layer.borderColor = UIColor(named: "gray_white")?.cgColor
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "giriboi2")
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
        iv.image = #imageLiteral(resourceName: "testTrackImage")
        return iv
    }()
    
    private lazy var playButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.white.withAlphaComponent(0.7)
        button.setImage(UIImage(systemName: "play"), for: .normal)
        button.addTarget(self, action: #selector(handlePlay), for: .touchUpInside)
        return button
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "cell_like"), for: .normal)
        button.tintColor = UIColor(named: "gray_white")
        button.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
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
        button.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)
        return button
    }()
    
    private var stackView = UIStackView()
    
    private lazy var trackUserName: UILabel = {
        let label = UILabel()
        label.text = "Pizza boy, #Chicken, #Beer"
        label.tintColor = UIColor(named: "black_white")
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private lazy var trackTitle: UILabel = {
        let label = UILabel()
        label.text = "02.Life is Pizza(Feat.Chick..."
        label.tintColor = UIColor(named: "black_white")
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var trackInfoPlayIcon: UIButton = {
        var button = UIButton()
        button.setImage(#imageLiteral(resourceName: "trackCell_playIcon"), for: .normal)
        button.tintColor = .lightGray
        return button
    }()
    
    private lazy var trackInfoPlayCount: UILabel = {
        let label = UILabel()
        label.text = "1513"
        label.tintColor = UIColor(named: "gray_white")
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private lazy var trackInfoLikeIcon: UIButton = {
        var button = UIButton()
        button.setImage(#imageLiteral(resourceName: "trackCell_LikeIcon"), for: .normal)
        button.tintColor = .lightGray
        return button
    }()
    
    private lazy var trackInfoLikeCount: UILabel = {
        let label = UILabel()
        label.text = "356"
        label.tintColor = UIColor(named: "gray_white")
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let postTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "2 days ago"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
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
    
    func configure(){
        backgroundColor = UIColor(named: "white_black")
        
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
        
        let topLine = UIView()
        topLine.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        addSubview(topLine)
        topLine.anchor(top: profileImageView.bottomAnchor, left: leftAnchor,right: rightAnchor, paddingTop: 8, height: 0.5)
        
        addSubview(trackImage)
        trackImage.anchor(top: topLine.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8, height: 120)
        trackImage.heightAnchor.constraint(equalTo: trackImage.widthAnchor, multiplier: 1.0).isActive = true
        
        addSubview(playButton)
        playButton.anchor(top: trackImage.topAnchor, left: trackImage.leftAnchor)
        playButton.centerX(inView: trackImage)
        playButton.centerY(inView: trackImage)
        
        addSubview(trackUserName)
        trackUserName.anchor(top: topLine.bottomAnchor, left: trackImage.rightAnchor, paddingTop: 18, paddingLeft: 21)
        
        addSubview(trackTitle)
        trackTitle.anchor(top: trackUserName.bottomAnchor, left: trackImage.rightAnchor, paddingTop: 14, paddingLeft: 21)
        
        addSubview(trackInfoPlayIcon)
        addSubview(trackInfoPlayCount)
        addSubview(trackInfoLikeIcon)
        addSubview(trackInfoLikeCount)
        trackInfoPlayIcon.anchor(top: trackTitle.bottomAnchor, left: trackImage.rightAnchor, paddingTop: 14, paddingLeft: 21)
        trackInfoPlayCount.centerY(inView: trackInfoPlayIcon)
        trackInfoLikeCount.centerY(inView: trackInfoPlayIcon)
        trackInfoLikeIcon.centerY(inView: trackInfoPlayIcon)
        trackInfoPlayCount.anchor(left: trackInfoPlayIcon.rightAnchor, paddingLeft: 6)
        trackInfoLikeIcon.anchor(left: trackInfoPlayCount.rightAnchor, paddingLeft: 17)
        trackInfoLikeCount.anchor(left: trackInfoLikeIcon.rightAnchor, paddingLeft: 6)
        
        configureActionButtons()
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        addSubview(bottomLine)
        bottomLine.anchor(top: trackImage.bottomAnchor, left: leftAnchor,right: rightAnchor, paddingTop: 8, height: 0.5)
        
        addSubview(postTimeLabel)
        postTimeLabel.anchor(top: bottomLine.bottomAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 8)
    }
    
    // MARK: - Actions
    
    @objc func didTapUserName(){
        delegate?.didTapUser()
        print("protocol test")
    }
    
    @objc func handleMatchIcon(){
        delegate?.didTapMatch()
    }
    
    @objc func handlePlay(){
        delegate?.didTapPlay()
    }
    
    @objc func didTapLike(){
        delegate?.didLike()
    }
    
    @objc func didTapComment(){
        delegate?.didTapComment()
    }
    
    @objc func didTapShare(){
        delegate?.didTapShare()
    }
    
    // MARK: - Helpers ( Helper Function )
    func configureActionButtons(){
        stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        
        addSubview(stackView)
        stackView.anchor(top: trackInfoPlayIcon.bottomAnchor, left: trackImage.rightAnchor,paddingTop:12, paddingLeft: 21)
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
