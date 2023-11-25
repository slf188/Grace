//
//  ConversationsView.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI

struct ConversationsView: View {
    // variable que va a ayudar a que se muestre con logica el view de mensajes
    // las variables con @state nos permiten modificar los valores dentro de un struct
    @State var estaMostrandoMessageView = false
    @State var mostrarChat = false
    @State var user: User?
    @ObservedObject var viewModel = ConversationsViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){

            if let user = user {
                NavigationLink(
                    destination: ChatView(user: user),
                    isActive: $mostrarChat,
                    label: {}
                )
            }
            
            ScrollView {
                VStack{
                    ForEach(viewModel.recentMessages) { message in
                        // para hacer un link de navegacion que nos lleve a una pagina para ver la conversacion con otro usuario
                        NavigationLink(
                            destination: LazyView(ChatView(user: message.user)),
                            label: {
                                ConversationCell(message: message)
                            })
                    }
                }.padding()
            }
            
            HStack {
                Spacer()
                
                // boton para agregar una publicacion
                // cuando toquemos el boton se hara un toggle de la variable estaMostrandoMessageView
                Button(action: { self.estaMostrandoMessageView.toggle() }, label: {
                    // icono
                    Image(systemName: "envelope")
                        .resizable()
                    // tamano
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .padding()
                })
                // color
                .background(Color(.black))
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding()
                .sheet(isPresented: $estaMostrandoMessageView, content: {
                    NewMessageView(iniciarChat: $mostrarChat, mostrar: $estaMostrandoMessageView, user: $user)
                })
            }
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
