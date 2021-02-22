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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {

        let xCoord = self.view.bounds.width / 2 - 135
        let yCoord = self.view.bounds.height / 2 - 200
        let centerView = UIView(frame: CGRect(x: xCoord, y: yCoord, width: 270, height: 258))
        
        centerView.backgroundColor = .white
        centerView.layer.cornerRadius = 20
        
        self.view.addSubview(centerView)
        
        view.addSubview(titleText)
        titleText.anchor(top: centerView.topAnchor, paddingTop: 20)
        titleText.centerX(inView: centerView)
    }
    
    override func touchesBegan(_ touches: Set, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let touch = touches.first , touch.view == self.view {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
