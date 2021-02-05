//
//  CollectinHeaderCell.swift
//  connecty
//
//  Created by 공대생 on 2021/02/05.
//

import UIKit
//인스타 피드 맨위 계정 설명란
class CollectionHeaderCell:UICollectionReusableView{
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 40)
        label.text = "HEADER"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(){
        backgroundColor = .systemBackground
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
