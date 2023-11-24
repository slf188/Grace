//
//  User.swift
//  xs
//
//  Created by Felipe Vallejo on 21/11/23.
//

import Firebase

// aqui vamos hacer un fetch de lo que tenemos en la carpeta "user" en firestore
struct User: Identifiable {
    let id: String
    let username: String
    let profileImageUrl:String
    let fullname: String
    let email: String
    let isCurrentUser: Bool
    var stats: StatsUsuario
    
    var isFollowed = false
    
//    var isCurrentUser = Bool { return Auth.auth().currentUser?.uid == self.id }
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profilelmageUrl"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.isCurrentUser = Auth.auth().currentUser?.uid == self.id
        self.stats = StatsUsuario(seguidores: 0, siguiendo: 0)
    }
}

struct StatsUsuario {
    let seguidores: Int
    let siguiendo: Int
}
