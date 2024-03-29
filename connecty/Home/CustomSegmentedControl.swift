//
//  collectionViewHeader.swift
//  Instegram-followers
//
//  Created by Mdo on 17/02/2021.
//

import UIKit

protocol CustomSegmentedControlDelegate: UIViewController{
    func change(to index: Int)
}

class CustomSegmentedControl: UIView{

    //MARK: - properties
    
    private var buttonTitles: [String]!
    private var buttons: [UIButton]!
    private var selectorView: UIView!
    
    var textColor: UIColor = UIColor(named: "black_white")!
//    var selectorViewColor:UIColor = UIColor(named: "connectyOrange")!
    var selectorTextColor:UIColor = UIColor(named: "connectyOrange")!
    
    var delegate: CustomSegmentedControlDelegate?
    
    var selectedIndex: Int = 0
    
    let stackLine1 : UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let stackLine2 : UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let bottomLine : UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    convenience init(frame: CGRect, buttonTitle: [String]) {
        self.init(frame:frame)
        self.buttonTitles = buttonTitle
    }
    
    //MARK: - draw
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.backgroundColor = UIColor.systemBackground
        updateView()
    }
    
    func setButtonTitles(buttonTitles: [String]){
        self.buttonTitles = buttonTitles
        self.updateView()
    }
    
    func setIndex(index: Int){
        buttons.forEach({$0.setTitleColor(textColor, for: .normal)})
        let button = buttons[index]
        selectedIndex = index
        button.setTitleColor(selectorTextColor, for: .normal)
        let selectorPosition = frame.width/CGFloat(buttonTitles.count) * CGFloat(index)
        UIView.animate(withDuration: 0.2){
            self.selectorView.frame.origin.x = selectorPosition
        }
    }
    
    @objc func buttonAction(sender: UIButton){
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender {
//                let selectorPosition = frame.width/CGFloat(buttonTitles.count) * CGFloat(buttonIndex)
                selectedIndex = buttonIndex
                delegate?.change(to: selectedIndex)
//                UIView.animate(withDuration: 0.3) {
//                    self.selectorView.frame.origin.x = selectorPosition
//                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
            
        }
    }
}

//Configuration View
extension CustomSegmentedControl {
    private func updateView() {
        createButton()
//        configSelectorView()
        setupStackView()
    }
    
    private func setupStackView() {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        
        addSubview(stackLine1)
        addSubview(stackLine2)
        addSubview(bottomLine)
        addSubview(stack)
        
        stackLine1.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.left.equalToSuperview().offset(74)
            $0.width.equalTo(0.2)
            $0.height.equalTo(12)
        }
        
        stackLine2.snp.makeConstraints {
            $0.top.equalToSuperview().offset(17)
            $0.left.equalToSuperview().offset(174)
            $0.width.equalTo(0.2)
            $0.height.equalTo(12)
        }
        
        bottomLine.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.left.right.equalToSuperview()
            $0.height.equalTo(0.2)
        }
        
        stack.snp.makeConstraints {
            $0.top.bottom.left.equalToSuperview()
            $0.width.equalTo(245)
        }
    }
    
//    private func configSelectorView() {
//        let selectorWidth = frame.width / CGFloat(self.buttonTitles.count)
//        selectorView = UIView(frame: CGRect(x: 0, y: self.frame.height, width: selectorWidth, height: 2))
//        selectorView.backgroundColor = selectorViewColor
//        addSubview(selectorView)
//    }
    
    private func createButton() {
        buttons = [UIButton]()
        buttons.removeAll()
        subviews.forEach({$0.removeFromSuperview()})
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            button.addTarget(self, action:#selector(CustomSegmentedControl.buttonAction(sender:)), for: .touchUpInside)
            button.setTitleColor(textColor, for: .normal)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
    }
}
