//
//  SearchViewController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/04.
//

import UIKit

class SearchViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Search"
    }
}