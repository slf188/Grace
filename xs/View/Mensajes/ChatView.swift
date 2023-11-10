//
//  ChatView.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI

struct ChatView: View {
    @State var textoMensaje: String = ""
    
    var body: some View {
        VStack{
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(MENSAJES) { message in
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
            }
            
            MessageInputView(textoMensaje: $textoMensaje)
                .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
