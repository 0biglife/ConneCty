//
//  Post.swift
//  connecty
//
//  Created by 공대생 on 2021/03/01.
//

import Foundation

struct Post{
    var id: String
    let user: User
    let imageUrl: String
    let caption: String
    let creationDate: Date
    
    var likes: Int = 0
    var likedByCurrentUser = false /// 이건 뭐지
    
    init(user: User, dictionary: [String: Any]) {
        self.user = user
        self.imageUrl = dictionary["imgeUrl"] as? String ?? ""
        self.caption = dictionary["caption"] as? String ?? ""
        self.id = dictionary["id"] as? String ?? ""
        
        let timeNum = dictionary["creationDate"] as? Double ?? 0
        self.creationDate = Date(timeIntervalSince1970: timeNum)
    }
}
