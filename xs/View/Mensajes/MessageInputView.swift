//
//  MessageInputView.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI

struct MessageInputView: View {
    let viewModel: ChatViewModel
    // variable para almacenar el mensaje
    // una variable que posee el atributo @Binding significa que esta enlazada a algo mas
    // en este caso esta enlazada al mensaje que se va a enviar, al textfield
    @Binding var textoMensaje: String
    
    var action: () -> Void
    
    var body: some View {
        HStack {
            // textfield para que el usuario pueda ingresar su mensaje
            TextField("Mensaje...", text: $textoMensaje)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight:30)
            // que se va a realizar cuando se presione en enviar el mensaje
            Button(action: action) {
                Text("Enviar")
                    .bold()
                    .foregroundColor(.black)
            }
        }
    }
}
