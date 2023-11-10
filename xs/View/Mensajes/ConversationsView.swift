//
//  ConversationsView.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI

struct ConversationsView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView {
                VStack{
                    ForEach(0..<20) { _ in
                        ConversationCell()
                    }
                }.padding()
            }
            // boton para agregar una publicacion
            Button(action: {}, label: {
                // icono
                Image(systemName: "plus")
                    .resizable()
                    // tamano
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            })
            // color
            .background(Color(.systemGray))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
