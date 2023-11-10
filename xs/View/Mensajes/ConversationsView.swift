//
//  ConversationsView.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI

struct ConversationsView: View {
    // variable que va a ayudar a que se muestre con logica el view de mensajes
    @State var estaMostrandoMessageView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView {
                VStack{
                    ForEach(0..<20) { _ in
                        // para hacer un link de navegacion que nos lleve a una pagina para ver la conversacion con otro usuario
                        NavigationLink(
                            destination: Text("H"),
                            label: {
                                ConversationCell()
                            }
                        )
                    }
                }.padding()
            }
            // boton para agregar una publicacion
            // cuando toquemos el boton se hara un toggle de la variable estaMostrandoMessageView
            Button(action: {self.estaMostrandoMessageView.toggle()}, label: {
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
            .sheet(isPresented: $estaMostrandoMessageView, content: {
                SearchView()
            })
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
