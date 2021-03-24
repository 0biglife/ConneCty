
import UIKit
import AVFoundation

//extension NSMutableAttributedString{
//    func appendImage(_ image: UIImage){
//        let imageAttchment: NSTextAttachment = NSTextAttachment()
//        imageAttchment.image = image
//        let strImage: NSAttributedString = NSAttributedString(attachment: imageAttchment)
//        self.append(strImage)
//    }
//}


class TrackCell: UICollectionViewCell{
    
    static let identifier = "TrackCellID"
    
    var player: AVAudioPlayer?
    
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
        iv.image = #imageLiteral(resourceName: "giriboi2")
        iv.layer.cornerRadius = 40 / 2
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
    
    
    let trackCellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let trackImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "testTrackImage")
        return iv
    }()
    
    lazy var playButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.white.withAlphaComponent(0.7)
        button.setImage(UIImage(systemName: "play"), for: .normal)
        button.addTarget(self, action: #selector(handlePlay), for: .touchUpInside)
        return button
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
    
    let topLine : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        return view
    }()
    
    let bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        return view
    }()
    
    var iconStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
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
        
        iconStack.addArrangedSubview(likeButton)
        iconStack.addArrangedSubview(commentButton)
        iconStack.addArrangedSubview(shareButton)
        
        addSubview(profileImageView)
        addSubview(userNameButton)
        addSubview(matchingButton)
        addSubview(matchingLabel)
        addSubview(trackImage)
        addSubview(topLine)
        addSubview(playButton)
        addSubview(trackUserName)
        addSubview(trackTitle)
        
        addSubview(trackInfoPlayIcon)
        addSubview(trackInfoPlayCount)
        addSubview(trackInfoLikeIcon)
        addSubview(trackInfoLikeCount)
        
        addSubview(iconStack)
        
        addSubview(bottomLine)
        addSubview(postTimeLabel)
    }
    
    func setupConstraints(){
        
        profileImageView.snp.makeConstraints {
            $0.top.left.equalToSuperview().offset(8)
            $0.size.width.height.equalTo(40)
        }
        
        userNameButton.snp.makeConstraints {
            $0.left.equalTo(profileImageView.snp.right).offset(12)
            $0.centerY.equalTo(profileImageView.snp.centerY)
        }
        
        matchingButton.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-12)
            $0.centerY.equalTo(profileImageView.snp.centerY)
        }
        
        matchingLabel.snp.makeConstraints {
            $0.right.equalTo(matchingButton.snp.left).offset(-8)
            $0.centerY.equalTo(profileImageView.snp.centerY)
        }
        
        topLine.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(8)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(0.5)
        }
        
        trackImage.snp.makeConstraints {
            $0.top.equalTo(topLine.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(8)
            $0.width.equalTo(120)
            $0.height.equalTo(120)
        }
//        trackImage.heightAnchor.constraint(equalTo: trackImage.widthAnchor, multiplier: 1.0).isActive = true
        
        playButton.snp.makeConstraints {
            $0.top.left.equalTo(trackImage)
            $0.centerX.centerY.equalTo(trackImage)
        }
        
        trackUserName.snp.makeConstraints {
            $0.top.equalTo(topLine.snp.bottom).offset(18)
            $0.left.equalTo(trackImage.snp.right).offset(21)
        }
        
        trackTitle.snp.makeConstraints {
            $0.top.equalTo(trackUserName.snp.bottom).offset(14)
            $0.left.equalTo(trackImage.snp.right).offset(21)
        }
        
        trackInfoPlayIcon.snp.makeConstraints {
            $0.top.equalTo(trackTitle.snp.bottom).offset(14)
            $0.left.equalTo(trackImage.snp.right).offset(21)
        }
        
        trackInfoPlayCount.snp.makeConstraints {
            $0.centerY.equalTo(trackInfoPlayIcon)
        }
        
        trackInfoPlayCount.snp.makeConstraints {
            $0.left.equalTo(trackInfoPlayIcon.snp.right).offset(6)
            $0.centerY.equalTo(trackInfoPlayIcon)
        }
        
        trackInfoLikeIcon.snp.makeConstraints {
            $0.left.equalTo(trackInfoPlayCount.snp.right).offset(14)
            $0.centerY.equalTo(trackInfoPlayIcon)
        }
        
        trackInfoLikeCount.snp.makeConstraints {
            $0.left.equalTo(trackInfoLikeIcon.snp.right).offset(6)
            $0.centerY.equalTo(trackInfoPlayIcon)
        }
        
        iconStack.snp.makeConstraints {
            $0.top.equalTo(trackInfoPlayIcon.snp.bottom).offset(10)
            $0.left.equalTo(trackImage.snp.right).offset(20)
        }
        
        bottomLine.snp.makeConstraints {
            $0.top.equalTo(trackImage.snp.bottom).offset(8)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(0.5)
        }
        
        postTimeLabel.snp.makeConstraints {
            $0.top.equalTo(bottomLine.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(8)
        }
    }
    
    // MARK: - Actions
    
    @objc func handlePlay(){
        if let player = player, player.isPlaying{
            //stop playback
            playButton.setImage(UIImage(systemName: "play"), for: .normal)
            player.stop()
        }else{
            //setup player, and play
            playButton.setImage(UIImage(systemName: "pause"), for: .normal)
            let urlString = Bundle.main.path(forResource: "memories (listen on spotify from 3am ep)", ofType: "mp3")
            
            do{
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else{
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else{
                    return
                }
                
                player.play()
            }
            catch{
                print("something went wrong")
            }
        }
    }
}
