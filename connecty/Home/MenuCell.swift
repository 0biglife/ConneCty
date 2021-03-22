//
//  MenuCell.swift
//  connecty
//
//  Created by 공대생 on 2021/03/18.
//

import UIKit
import PagingKit
import SnapKit

let identifier = "MenuCell"

class MenuCell: PagingMenuViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    override var isSelected: Bool {
        didSet{
            if isSelected{
                titleLabel.textColor = UIColor(named: "black_white")
            }else{
                titleLabel.textColor = .lightGray
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
//        setupConstraints()
    }
    
    required init?(coder: NSCoder){fatalError("init(coder:) has not been implemented")}
    
    func setupUI(){
        addSubview(titleLabel)
    }
    
//    func setupConstraints(){
//        titleLabel.snp.makeConstraints {
//            $0.
//        }
//    }
}
