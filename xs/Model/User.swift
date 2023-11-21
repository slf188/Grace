//
//  User.swift
//  xs
//
//  Created by Felipe Vallejo on 21/11/23.
//

import Foundation

// aqui vamos hacer un fetch de lo que tenemos en la carpeta "user" en firestore
struct User: Identifiable {
    let id: String
    let username: String
    let profileImageUrl:String
    let fullname: String
    let email: String
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profilelmageUrl"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
    }
}
