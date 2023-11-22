//
//  Post.swift
//  xs
//
//  Created by Felipe Vallejo on 22/11/23.
//

import Firebase

// aqui vamos hacer un fetch de lo que tenemos en la carpeta "posts" en firestore
struct Post: Identifiable {
    // obligatoriamente necesitamos tener la propiedad id ya que Post es identifiable
    let id: String
    let username: String
    let profileImageUrl:String
    let fullname: String
    let caption: String
    let likes: Int
    let uid: String
    let timeStamp: Timestamp
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profilelmageUrl"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.caption = dictionary["caption"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.uid = dictionary["uid"] as? String ?? ""
        self.timeStamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
    }
}

