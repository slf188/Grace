//
//  LoginView.swift
//  xs
//
//  Created by Felipe Vallejo on 14/11/23.
//

import SwiftUI

struct LoginView: View {
    // dos variables para contener la entrada del usuario
    @State var email = ""
    @State var contraseña = ""
    
    var body: some View {
        ZStack {
            VStack {
                Image ("GRACE1" )
                    .resizable()
                    .scaledToFill()
                    .frame(width: 220, height: 100)
                    .padding(.top, 88)
                // vstack que vamos a utilizar para reutilizar dos textfields para ingresar el email y la contrasena del usuario
                VStack {
                    CustomTextField(texto: $email, descripcion: Text("Email"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .padding()
                        .foregroundColor(.white)
                    
                    CustomTextField(texto: $contraseña, descripcion: Text("Contraseña"))
                        .padding ()
                        .background(Color(.init(white: 1, alpha:0.15)))
                    .cornerRadius(10)
                    .padding()
                    .foregroundColor(.white)
                }
                Spacer()
            }
        }
        .background (Color(.black))
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
