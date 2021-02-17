//
//  CollectinHeaderCell.swift
//  connecty
//
//  Created by 공대생 on 2021/02/05.
//

import UIKit

//인스타 피드 맨위 계정 설명란
protocol HomePostCellHeaderDelegate{
    func didTapUser()
}

class HomeHeader :UICollectionReusableView{
    
    static let identifier = "HomePostCellHeaderID"
    
    var delegate: HomePostCellHeaderDelegate?
    
//    let postHeader: UIView = {
//        let vi = UIView()
//        return vi
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
}
