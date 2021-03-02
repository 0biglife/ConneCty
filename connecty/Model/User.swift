//
//  User.swift
//  connecty
//
//  Created by 공대생 on 2021/03/01.
//

import Foundation

struct User{
    
    let uid: String
    let username: String
    let profileImageUrl: String?
    
    init(uid: String, dictionary: [String:Any]) {
        self.uid = uid
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? nil
    }
}
