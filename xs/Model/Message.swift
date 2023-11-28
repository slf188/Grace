//
//  Message.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import Firebase

struct Message: Identifiable {
    let text: String
    let user: User
    let toId: String
    let fromId: String
    let isFromCurrentUser: Bool
    let timestamp: Timestamp
    let id: String
    
    var chatPartnerId: String { return isFromCurrentUser ? toId : fromId }
    
    init(user: User, dictionary: [String: Any]) {
        self.user = user
        
        self.text = dictionary["text"] as? String ?? ""
        self.toId = dictionary["toId"] as? String ?? ""
        self.fromId = dictionary["fromId"] as? String ?? ""
        self.isFromCurrentUser = fromId == Auth.auth().currentUser?.uid
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.id = dictionary["id"] as? String ?? ""
    }
}

// estructura se lo que debe contener un mensaje
struct Mensaje: Identifiable {
    let id: Int
    let nombreImagen: String
    let textoMensaje: String
    let esUsuarioActual: Bool
}

let MENSAJES: [Mensaje] = [
    .init(id: 0, nombreImagen: "venom-10", textoMensaje: "hey", esUsuarioActual: true),
    .init(id: 1, nombreImagen: "spiderman", textoMensaje: "hola", esUsuarioActual: false),
    .init(id: 2, nombreImagen: "batman", textoMensaje: "sii", esUsuarioActual: true),
    .init(id: 3, nombreImagen: "batman", textoMensaje: "no", esUsuarioActual: false)
]
