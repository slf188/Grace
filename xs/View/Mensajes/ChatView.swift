//
//  ChatView.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI

// contiene la vista de lo que se mostrara en un nuevo mensaje
struct ChatView: View {
    @State var textoMensaje: String = ""
    
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
