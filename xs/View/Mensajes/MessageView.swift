//
//  MessageView.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI

struct MessageView: View {
    let message: Mensaje
    var body: some View {
        HStack {
            // si el mensaje es del usuario actual mostrar a la derecha
            if message.esUsuarioActual {
                Spacer()
                Text(message.textoMensaje)
                    .padding()
                    .background(Color.black)
                    .clipShape(ChatBubble(esUsuarioActual: true))
                    .foregroundColor(.white)
                    .padding(.horizontal)
            } else {
                // si el usuario no es el actual mostrar a la izquierda
                HStack(alignment: .bottom) {
                    Image(message.nombreImagen)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(message.textoMensaje)
                        .padding()
                        .background(Color(.systemGray5))
                        .clipShape(ChatBubble(esUsuarioActual: false))
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: MENSAJES[1])
    }
}
