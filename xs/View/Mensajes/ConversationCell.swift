//
//  ConversationCell.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI
import KingfisherSwiftUI

struct ConversationCell: View {
    let message: Message
    
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                // icono del usuario
                KFImage(URL(string: message.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width:56,height: 56)
                    .cornerRadius(28)
                
                VStack(alignment:.leading, spacing: 4) {
                    // username
                    Text(message.user.fullname)
                        .font(.system(size: 14, weight: .semibold))
                    // nombre del usuario
                    Text(message.text)
                        .font(.system(size: 14))
                    // para que se muestre el texto de los mensajes
                        .lineLimit(2)
                }
                .foregroundColor(.black)
                .padding(.trailing)
                Spacer()
            }
            Divider()
        }
    }
}
