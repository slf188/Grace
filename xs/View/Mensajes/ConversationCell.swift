//
//  ConversationCell.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                // icono del usuario
            Image ("venom-10")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width:56,height: 56)
                .cornerRadius(28)
            
            VStack(alignment:.leading, spacing: 4) {
                // username
                Text ("venom")
                    .font(.system(size: 14, weight: .semibold))
                    // nombre del usuario
                    Text ("Un mensaje mas largo para ver que es lo que esta pasando perrita")
                    .font(.system(size: 14))
                    // para que se muestre el texto de los mensajes
                    .lineLimit(2)
                }
            .padding(.trailing)
            }
            Divider()
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
