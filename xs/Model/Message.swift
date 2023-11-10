//
//  Message.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import Foundation

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
    .init(id: 2, nombreImagen: "batman", textoMensaje: "chi", esUsuarioActual: true),
    .init(id: 3, nombreImagen: "batman", textoMensaje: "noputa", esUsuarioActual: false)
]
