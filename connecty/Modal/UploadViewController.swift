//
//  uploadPopoverViewController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/22.
//

import UIKit

class UploadViewController: UIViewController{
    
    private let titleText: UILabel = {
        let label = UILabel()
        label.text = "File Upload"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let subtitleText: UILabel = {
        let label = UILabel()
        label.text = "  업로드할 파일 형식을 골라주세요"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        let touch = touches.first
        if touch?.view != self {
            self.dismiss(animated: true , completion: nil)
        }
    }
    
    func configure() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        //autoLayout으로.(!!)
        
        let xCoord = self.view.bounds.width / 2 - 135
        let yCoord = self.view.bounds.height / 2 - 200
        let centerView = UIView(frame: CGRect(x: xCoord, y: yCoord, width: 270, height: 258))
        
        centerView.backgroundColor = .white
        centerView.layer.cornerRadius = 20
        
        self.view.addSubview(centerView)
        
        view.addSubview(titleText)
        titleText.anchor(top: centerView.topAnchor, paddingTop: 20)
        titleText.centerX(inView: centerView)
        
        view.addSubview(subtitleText)
        subtitleText.anchor(top: titleText.bottomAnchor, paddingTop: 2)
        subtitleText.centerX(inView: titleText)
        
        let firstLine = UIView()
        let secondLine = UIView()
        let thirdLine = UIView()
        let fourthLine = UIView()
        
        firstLine.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        secondLine.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        thirdLine.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        fourthLine.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        
        view.addSubview(firstLine)
        view.addSubview(secondLine)
        view.addSubview(thirdLine)
        view.addSubview(fourthLine)
        
        firstLine.anchor(top: centerView.topAnchor, left: centerView.leftAnchor, right: centerView.rightAnchor, paddingTop: 82, height: 0.5)
        secondLine.anchor(top: firstLine.bottomAnchor, left: centerView.leftAnchor, right: centerView.rightAnchor, paddingTop: 44, height: 0.5)
        thirdLine.anchor(top: secondLine.bottomAnchor, left: centerView.leftAnchor, right: centerView.rightAnchor, paddingTop: 44, height: 0.5)
        fourthLine.anchor(top: thirdLine.bottomAnchor, left: centerView.leftAnchor, right: centerView.rightAnchor, paddingTop: 44, height: 0.5)
    }
    
}
