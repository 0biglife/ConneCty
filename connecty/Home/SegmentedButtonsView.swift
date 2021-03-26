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
    
    let bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    weak var segmentedControlDelegate: SegmentedControlDelegate?
    
    convenience init(frame: CGRect, titles: [String]) {
        self.init(frame:frame)
        self.titles = titles
    }
    
    //MARK: - updateView
    
    private func updateView(){
        createLabels()
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
                let selectorPosition = frame.width/CGFloat(titles.count) * CGFloat(labelIndex)
                selectedIndex = labelIndex
                //todo set delegate
                segmentedControlDelegate?.didIndexChanged(at: selectedIndex)
                UIView.animate(withDuration: 0.1) {
                    self.selectorView1.frame.origin.x = CGFloat(selectorPosition)
                    if labelIndex == 0 {
                        self.labels[0].textColor = UIColor(named: "connectyOrange")
                        self.labels[1].textColor = .black
                        self.labels[2].textColor = .black
                    }else if labelIndex == 1{
                        self.labels[0].textColor = .black
                        self.labels[1].textColor = UIColor(named: "connectyOrange")
                        self.labels[2].textColor = .black
                    }else if labelIndex == 2{
                        self.labels[0].textColor = .black
                        self.labels[1].textColor = .black
                        self.labels[2].textColor = UIColor(named: "connectyOrange")
                    }
                }
            }
        }
    }
}
extension SegmentedButtonsView{
    
    func collectionViewDidScroll(for x: CGFloat) {

        UIView.animate(withDuration: 0.1) { [self] in
            self.selectorView1.frame.origin.x = x
            for (_,view)in subviews.enumerated(){
                if view is UIStackView{
                    guard let stack = view as? UIStackView else { return }
                    for (_,label) in stack.arrangedSubviews.enumerated(){
                        guard let label = label as? UILabel else {
                            print("Error ")
                            return
                        }
                        if  (label.frame.width / 2  >= self.selectorView1.frame.origin.x && titles[0] == label.text! || label.frame.width / 2  <= self.selectorView1.frame.origin.x && titles[1] == label.text! ) {
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
