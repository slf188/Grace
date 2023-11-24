//
//  ChatView.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI

// contiene la vista de lo que se mostrara en un nuevo mensaje
struct ChatView: View {
    let user: User
    let viewModel: ChatViewModel
    @State var textoMensaje: String = ""
    
    init(user: User){
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    
    var body: some View {
        VStack{
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(MENSAJES) { message in
                        MessageView(message: message)
                    }
                }
            }
            .padding(.top)
            
            /// atencion::
            /// no deberiamos tener que pasar el argumento viewModel
            MessageInputView(viewModel: viewModel, textoMensaje: $textoMensaje, action: sendMessage)
                .padding()
        }
    }
    
    func sendMessage(){
        viewModel.sendMessage(textoMensaje)
    }
}
