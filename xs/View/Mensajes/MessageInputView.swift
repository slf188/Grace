//
//  MessageInputView.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI

struct MessageInputView: View {
    // variable para almacenar el mensaje
    // una variable que posee el atributo @Binding significa que esta enlazada a algo mas
    // en este caso esta enlazada al mensaje que se va a enviar, al textfield
    @Binding var messageText: String
    var body: some View {
        HStack {
            // textfield para que el usuario pueda ingresar su mensaje
            TextField("Mensaje...", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight:30)
            // que se va a realizar cuando se presione en enviar el mensaje
            Button(action: {}, label: {
                Text("Enviar")
            })
        }
    }
}

struct MessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        MessageInputView(messageText: .constant("Mensaje..."))
    }
}
