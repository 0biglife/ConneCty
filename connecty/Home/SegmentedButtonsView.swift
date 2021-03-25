//
//  collectionViewHeader.swift
//  Instegram-followers
//
//  Created by Mdo on 17/02/2021.
//

import Foundation
import UIKit

protocol CollectionViewDidScrollDelegate:class {
    func collectionViewDidScroll(for x: CGFloat)
    
}
protocol SegmentedControlDelegate:class{
    func didIndexChanged(at index: Int)
}

class SegmentedButtonsView:UIView, CollectionViewDidScrollDelegate{

    //MARK: - properties
    
    lazy var selectorView1 = UIView()
    lazy var selectorView2 = UIView()
    lazy var selectorView3 = UIView()
    lazy var labels = [UILabel]()
    private var titles: [String]!
    var textColor = UIColor(named: "black_white")
    var selectorTextColor = UIColor(named: "connectyOrange")
    public private(set) var selectedIndex: Int = 0

    let firstLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let secondLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    weak var segmentedControlDelegate: SegmentedControlDelegate?
    
    convenience init(frame: CGRect, titles: [String]) {
        self.init(frame:frame)
        self.titles = titles
    }
    

    //MARK: - config selected Tap
    
    private func configSelectedTap(){
//        let segmentsCount = CGFloat(titles.count)
        let selectorWidth = [68,177,211]
        selectorView1 = UIView(frame: CGRect(x: 0, y: self.frame.height - 0.8, width: CGFloat(selectorWidth[0]), height: 0.5))
        selectorView2 = UIView(frame: CGRect(x: 0, y: self.frame.height - 0.8, width: CGFloat(selectorWidth[1]), height: 0.5))
        selectorView3 = UIView(frame: CGRect(x: 0, y: self.frame.height - 0.8, width: CGFloat(selectorWidth[2]), height: 0.5))
        addSubview(selectorView1)
        addSubview(selectorView2)
        addSubview(selectorView3)
//        selectorView.backgroundColor = .black
//        addSubview(selectorView)
    }
    
    //MARK: - updateView
    
    private func updateView(){
        createLabels()
        configSelectedTap()
        setupConstraints()
    }
    
    //MARK: - draw
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateView()
    }
    
    //MARK: - create labels
    
    private func createLabels(){
        
        labels.removeAll()
        subviews.forEach({$0.removeFromSuperview()})
        for labelTitle in titles{
            
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 13)
            label.text = labelTitle
            let tapGestureRecognizor = UITapGestureRecognizer(target: self, action: #selector(labelActionHandler(sender:)))
            tapGestureRecognizor.numberOfTapsRequired = 1
            label.addGestureRecognizer(tapGestureRecognizor)
            label.isUserInteractionEnabled = true
            
            label.textColor = textColor
            label.textAlignment = .center
            labels.append(label)
        }
        labels[0].textColor = selectorTextColor
    }
    
    //MARK: - set labels titles
    
    func setLabelsTitles(titles:[String]){
        self.titles = titles
        self.updateView()
    }
    
    //MARK: - config stackView
    
    private func setupConstraints(){
        
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [UIColor.black.cgColor, UIColor.clear.cgColor]
//        gradientLayer.locations = [1.0,0.0]
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
//        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.7)
//        gradientLayer.frame = bounds
//        self.layer.addSublayer(gradientLayer)
        
        let stackView = UIStackView(arrangedSubviews: labels)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 30
        
        addSubview(stackView)
        addSubview(firstLine)
        addSubview(secondLine)
        
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
            $0.width.equalTo(200)
            $0.height.equalTo(47)
        }
        
        firstLine.snp.makeConstraints {
            $0.centerY.equalTo(stackView)
            $0.left.equalTo(labels[0].snp.right).offset(15)
            $0.height.equalTo(12)
            $0.width.equalTo(0.5)
        }
        
        secondLine.snp.makeConstraints {
            $0.centerY.equalTo(stackView)
            $0.left.equalTo(labels[1].snp.right).offset(15)
            $0.height.equalTo(12)
            $0.width.equalTo(0.5)
        }
    }

    //MARK: - handler
    
    @objc private func labelActionHandler(sender:UITapGestureRecognizer){
        for (labelIndex, lbl) in labels.enumerated() {
            if lbl == sender.view{
                let selectorPosition1 = 177
                let selectorPosition2 = 211
                selectedIndex = labelIndex
                //todo set delegate
                segmentedControlDelegate?.didIndexChanged(at: selectedIndex)
                UIView.animate(withDuration: 0.1) {
                    self.selectorView2.frame.origin.x = CGFloat(selectorPosition1)
                    self.selectorView3.frame.origin.x = CGFloat(selectorPosition2)
                }
            }
        }
    }
}
extension SegmentedButtonsView{
    
    func collectionViewDidScroll(for x: CGFloat) {

        UIView.animate(withDuration: 0.1) { [self] in
            self.selectorView2.frame.origin.x = x
            for (_,view)in subviews.enumerated(){
                if view is UIStackView{
                    guard let stack = view as? UIStackView else { return }
                    for (_,label) in stack.arrangedSubviews.enumerated(){
                        guard let label = label as? UILabel else {
                            print("Error ")
                            return
                        }
                        if  (label.frame.width / 2  >= self.selectorView2.frame.origin.x && titles[0] == label.text! || label.frame.width / 2  <= self.selectorView3.frame.origin.x && titles[1] == label.text! ) {
                            label.textColor = selectorTextColor
                        }else{
                            label.textColor = textColor
                        }
                        
                    }
                }
            }
    
        }
    }
    
    func didIndexChanged(at index: Int) {
        
    }
}
