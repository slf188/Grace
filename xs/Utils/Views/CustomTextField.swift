//
//  CustomTextField.swift
//  xs
//
//  Created by Felipe Vallejo on 14/11/23.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var texto: String
    let descripcion: Text
    let nombreImagen: String
    
    var body: some View {
        ZStack(alignment:.leading) {
            // la descripcion solo aparece si esta vacia
            if texto.isEmpty {
                descripcion
                    .foregroundColor(Color(.init (white: 1, alpha: 0.87)))
                    .padding (.leading, 40)
            }
            HStack(spacing: 16) {
                Image (systemName:nombreImagen)
                    .resizable()
                    .scaledToFit()
                    .frame (width: 20, height: 20)
                // textfield por que solo ingresaremos emails que si se pueden ver
                TextField("", text:$texto)
                    // para que no esten en mayuscula la primera letra que se escriba
                    // para que no exista autocorrector
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
            }
        }
    }
}
