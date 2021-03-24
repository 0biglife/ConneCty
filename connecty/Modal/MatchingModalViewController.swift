////
////  MatchingModalViewController.swift
////  connecty
////
////  Created by 공대생 on 2021/02/23.
////
//
//import UIKit
//
//class MatchingModalViewController: UIViewController{
//    
//    private let titleText: UILabel = {
//        let label = UILabel()
//        label.text = "매칭 신청하시겠습니까?"
//        label.font = UIFont.boldSystemFont(ofSize: 18)
//        return label
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configure()
//    }
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
//        let touch = touches.first
//        if touch?.view != self {
//            self.dismiss(animated: true , completion: nil)
//        }
//    }
//    
//    func configure() {
//
//        let xCoord = self.view.bounds.width / 2 - 135
//        let yCoord = self.view.bounds.height / 2 - 200
//        let centerView = UIView(frame: CGRect(x: xCoord, y: yCoord, width: 270, height: 258))
//        
//        centerView.backgroundColor = .white
//        centerView.layer.cornerRadius = 20
//        
//        self.view.addSubview(centerView)
//        
//        view.addSubview(titleText)
//        titleText.anchor(top: centerView.topAnchor, paddingTop: 20)
//        titleText.centerX(inView: centerView)
//    }
//    
//}
