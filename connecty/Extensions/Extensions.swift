//
//  Extensions.swift
//  connecty
//
//  Created by 공대생 on 2021/02/04.
//

import UIKit

extension UIViewController{
    
    //탭할 시 키보드 사라짐
    func hideKeyboardWhenTappedAround(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dissmissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dissmissKeyboard(){
        view.endEditing(true)
    }
    
    //키보드 올라올 때 뷰 조정
    @objc func keyboardWillShow(notification: NSNotification){
        //keyboard가 생길 때 뷰의 높이는 키보드 높이만큼 올려줘야 한다 // ?. = 존재한다면 cgRect값을 가져올것
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
            if self.view.frame.origin.y == 0{ //origin : 좌표0값(즉, 좌측상단 점)
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification){
        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y = 0
        }
    }
    func moveViewWithKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    
}
