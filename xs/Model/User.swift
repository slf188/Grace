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
    let profileImageUrl: String
    let fullname: String
    let email: String
    let isCurrentUser: Bool
    var stats: StatsUsuario
    
    var isFollowed = false
    
//    var isCurrentUser = Bool { return Auth.auth().currentUser?.uid == self.id }
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        // por que aun existe el problema de cargar la imagen del usuario pondremos un icono de un perfil que no tiene imagen
        self.profileImageUrl = dictionary["profilelmageUrl"] as? String ?? "https://einercial.com/wp-content/uploads/2018/04/Facebook-no-profile-picture-icon-620x389.jpg"
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
