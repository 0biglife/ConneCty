//
//  AuthenticationViewModel.swift
//  connecty
//
//  Created by 공대생 on 2021/02/13.
//

import UIKit

protocol FormViewModel {
    func updateForm()
}

protocol AuthenticationViewModel{
    var formIsValid: Bool{get}
    var buttonBackgroundColor: UIColor{get}
    var buttonTitleColor: UIColor{get}
        
}

struct LoginViewModel: AuthenticationViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool{
        return email?.isEmpty == false && password?.isEmpty == false
    }
    var buttonBackgroundColor: UIColor{
        return formIsValid ? #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1) : #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).withAlphaComponent(0.5)
    }
    var buttonTitleColor: UIColor{
        return formIsValid ? .white : UIColor(white : 1,alpha : 0.67)
    }
}

struct RegistrationViewModel : AuthenticationViewModel{
    
    var email: String?
    var password: String?
    var passwordAgain: String?
    var name: String?
    var userName: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false && passwordAgain?.isEmpty == false && name?.isEmpty == false && userName?.isEmpty == false
    }
    
    var buttonBackgroundColor: UIColor{
        return formIsValid ? #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1) : #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).withAlphaComponent(0.5)
    }
    
    var buttonTitleColor: UIColor{
        return formIsValid ? .white : UIColor(white : 1,alpha : 0.67)
    }
    
}
