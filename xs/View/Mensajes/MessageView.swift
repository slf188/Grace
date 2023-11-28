//
//  MessageView.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI
import KingfisherSwiftUI

struct MessageView: View {
    let message: Message
    
    var body: some View {
        HStack {
            // si el mensaje es del usuario actual mostrar a la derecha
            if message.isFromCurrentUser {
                Spacer()
                Text(message.text)
                    .padding()
                    .background(Color.black)
                    .clipShape(ChatBubble(esUsuarioActual: true))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.leading, 100)
                    .padding(.trailing, 16)
            } else {
                // si el usuario no es el actual mostrar a la izquierda
                HStack(alignment: .bottom) {
                    KFImage(URL(string: message.user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(message.text)
                        .padding()
                        .background(Color(.systemGray5))
                        .clipShape(ChatBubble(esUsuarioActual: false))
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                .padding(.leading, 100)
                .padding(.trailing, 16)
                Spacer()
            }
        }
    }
}
