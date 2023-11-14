//
//  TextArea.swift
//  xs
//
//  Created by Felipe Vallejo on 13/11/23.
//

import SwiftUI

// area de texto que debemos pasar a newpostview para que se pueda escibir en la nueva publicacion
struct TextArea: View {
    @Binding var texto: String
    let descripcion: String
    
    init(_ descripcion: String, texto: Binding<String>){
        self._texto = texto
        self.descripcion = descripcion
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if texto.isEmpty {
                Text(descripcion)
                    .foregroundColor(Color(.placeholderText))
                padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            TextEditor(text: $texto)
                .padding(4)
        }.font(.body)
    }
}
