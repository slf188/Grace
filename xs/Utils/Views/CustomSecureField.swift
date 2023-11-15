//
//  CustomSecureField.swift
//  xs
//
//  Created by Felipe Vallejo on 14/11/23.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var texto: String
    let descripcion: Text
    
    var body: some View {
        ZStack(alignment:.leading) {
            // la descripcion solo aparece si esta vacia
            if texto.isEmpty {
                descripcion
                    .foregroundColor(Color(.init (white: 1, alpha: 0.87)))
                    .padding (.leading, 40)
            }
            HStack(spacing: 16) {
                Image (systemName:"lock")
                    .resizable()
                    .scaledToFit()
                    .frame (width: 20, height: 20)
                // secure field esta vez por que vamos a ingresar contrasenas
                SecureField("", text:$texto)
            }
        }
    }
}
