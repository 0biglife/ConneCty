//
//  HomeViewController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/04.
//

import UIKit
import AVFoundation

class HomeViewController: UICollectionViewController, CustomSegmentedControlDelegate{
    
    func change(to index: Int) {
        print("segmentedControl index changed to \(index)")
        
    }
    
    var customSC: CustomSegmentedControl! = {
        let customSC = CustomSegmentedControl()
        customSC.setButtonTitles(buttonTitles: ["팔로잉","인기 아티스트","게시판"])
        customSC.backgroundColor = UIColor(named: "white_black")
//        customSC.selectorViewColor = UIColor(named: "connectyOrange")!
        customSC.selectorTextColor = UIColor(named: "connectyOrange")!
        return customSC
    }()
    
    var posts = [Post]()
    
    var miniPlayer : UIView = {
        let vi = UIView()
        vi.backgroundColor = #colorLiteral(red: 0.2705612183, green: 0.2706055045, blue: 0.2705515325, alpha: 1)
        vi.clipsToBounds = true
        vi.layer.cornerRadius = 15
        vi.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return vi
    }()
    
    var mP_playButton : UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.white
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        return button
    }()
    
    var mP_userName: UILabel = {
        let label = UILabel()
        label.text = "Pizza boy"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    var mP_title : UILabel = {
        let label = UILabel()
        label.text = "02.Life is Piazza(Feat.Chicken&Beer"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        return label
    }()
    
    var mP_likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "cell_like"), for: .normal)
        button.tintColor = UIColor.white
        return button
    }()
    
    var mP_shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "cell_share"), for: .normal)
        button.tintColor = UIColor.white
        return button
    }()
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customSC.delegate = self
        setupNavigationBar()
        setupCollectionView()
        setupSegmentedControl()
        setupMiniPlayer()
    }
    
    func setupMiniPlayer(){
        view.addSubview(miniPlayer)
        miniPlayer.addSubview(mP_playButton)
        miniPlayer.addSubview(mP_userName)
        miniPlayer.addSubview(mP_title)
        miniPlayer.addSubview(mP_shareButton)
        miniPlayer.addSubview(mP_likeButton)
        
        miniPlayer.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(56)
        }
        
        mP_playButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
        }
        
        mP_userName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.left.equalTo(mP_playButton.snp.right).offset(14)
        }
        
        mP_title.snp.makeConstraints {
            $0.top.equalTo(mP_userName.snp.bottom).offset(8)
            $0.left.equalTo(mP_userName.snp.left)
        }
        
        mP_shareButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-24)
        }
        
        mP_likeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalTo(mP_shareButton.snp.left).offset(-14)
        }
    }
    
    func setupSegmentedControl(){
        view.addSubview(customSC)
        customSC.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.left.right.equalToSuperview()
            $0.size.height.equalTo(47)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupNavigationBar(){
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Home"
        self.navigationController?.navigationBar.isTranslucent = false
        
        let uplaodButton = UIBarButtonItem(image: #imageLiteral(resourceName: "home_navigation_upload") ,style: .plain , target: self, action: #selector(goToUpload))
        let alarmButton = UIBarButtonItem(image: #imageLiteral(resourceName: "home_navigation_bell") ,style: .plain , target: self, action: #selector(goToAlarm))
//        let fixedSpace:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
//        fixedSpace.width = -10
        navigationItem.rightBarButtonItems = [alarmButton,uplaodButton]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "home_navigation_message") ,style: .plain , target: self, action: #selector(goToAlarm))
    }
    
    // MARK: - Helpers
    
    func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 47, left: 0, bottom: 0, right: 0)
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height), collectionViewLayout: layout)
        
//        guard let collectionView = collectionView else {return}
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(PostCell.self, forCellWithReuseIdentifier: PostCell.identifier)
        collectionView.register(TrackCell.self, forCellWithReuseIdentifier: TrackCell.identifier)
        
        view.addSubview(collectionView)
    }
    
    @objc func goToAlarm(){
        let messageVC = homeSettingViewController()
        self.navigationController?.pushViewController(messageVC, animated: true)
    }
    
    @objc func goToUpload(){
        let vc = UploadViewController()
        vc.modalPresentationStyle = .overCurrentContext
        vc.accessibilityViewIsModal = true
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    
    @objc func goToMessage(){
        let messageVC = homeSettingViewController()
        self.navigationController?.pushViewController(messageVC, animated: true)
    }
    
    @objc func didTapMatch(){
        let alert = UIAlertController(title: "매칭 요청하기", message: "상대방에게 매칭을 요청하시겠습니까?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        self.present(alert, animated: false)
    }
    
    @objc func didTapUser() {
        //uid 같을 시, 내 프로필 이동의 경우 If로 나눠서 구현.
        let vc = profileViewController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationItem.backButtonTitle = ""
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapComment() {
        let vc = CommentController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationItem.backButtonTitle = ""
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapShare() {
        let alert = UIAlertController(title: "Share sheet Test", message: "text zone", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
                
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        self.present(alert, animated: false)
    }
    
}


// MARK: - UICollectionView DataSource

extension HomeViewController{
    
    // MARK: - PostCell
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let postCell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCell.identifier, for: indexPath) as! PostCell
        let trackCell = collectionView.dequeueReusableCell(withReuseIdentifier: TrackCell.identifier, for: indexPath) as! TrackCell
        
        postCell.matchingButton.addTarget(self, action: #selector(didTapMatch), for: .touchUpInside)
        postCell.matchingLabel.addTarget(self, action: #selector(didTapMatch), for: .touchUpInside)
        postCell.userNameButton.addTarget(self, action: #selector(didTapUser), for: .touchUpInside)
        postCell.commentButton.addTarget(self, action: #selector(didTapComment), for: .touchUpInside)
        postCell.shareButton.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)
        trackCell.matchingButton.addTarget(self, action: #selector(didTapMatch), for: .touchUpInside)
        trackCell.matchingLabel.addTarget(self, action: #selector(didTapMatch), for: .touchUpInside)
        trackCell.userNameButton.addTarget(self, action: #selector(didTapUser), for: .touchUpInside)
        trackCell.commentButton.addTarget(self, action: #selector(didTapComment), for: .touchUpInside)
        trackCell.shareButton.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)
        
        if (indexPath.row % 2) == 0 {
            return postCell
        }else{
            return trackCell
        }
    }
}

// MARK: - Size of each Cell

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        delegate = segmentedButtonsView
//        delegate?.collectionViewDidScroll(for: scrollView.contentOffset.x / 2)
    }
    
    func scrollToFrame(scrollOffset : CGFloat) {
                guard scrollOffset <= collectionView.contentSize.width - collectionView.bounds.size.width else { return }
                guard scrollOffset >= 0 else { return }
        collectionView.setContentOffset(CGPoint(x: scrollOffset, y: collectionView.contentOffset.y), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        
        if (indexPath.row % 2) == 0 {
            var height = 270 + 8 + 40 + 8
            height += 50
            height += 60
            return CGSize(width: width, height: 56 + 270 + 110)
        }else{
            return CGSize(width: width, height: 56 + 12 + 100 + 12 + 10 + 12 + 10) 
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
