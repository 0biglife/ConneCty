//
//  SearchViewController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/04.
//

import UIKit

class SearchViewController: UIViewController{
    
    private let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Search"
        
        view.addSubview(topView)
        topView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        topView.setHeight(50)
        
        
    }
}
