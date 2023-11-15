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
                    .padding(.bottom, 32)
                // vstack que vamos a utilizar para reutilizar dos textfields para ingresar el email y la contrasena del usuario
                VStack(spacing: 20) {
                    CustomTextField(texto: $email, descripcion: Text("Email"), nombreImagen: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomSecureField(texto: $contraseña, descripcion: Text("Contraseña"))
                        .padding ()
                        .background(Color(.init(white: 1, alpha:0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 32)
                
                HStack {
                    Spacer()
                    Button(action: {}, label: {
                        Text ("Olvidaste tu contraseña?")
                            .font(.footnote)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.top, 16)
                            .padding(.trailing, 32)
                    })
                }
                Button(action: {}, label: {
                    Text ("Iniciar Sesion")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(width: 360, height: 50)
                        .background (Color.white)
                        .clipShape(Capsule())
                        .padding ()
                })
                Spacer ()
                HStack {
                    Text("No tienes una cuenta?")
                        .font(.system(size: 14))
                    
                    Text("Registrate aqui")
                        .font(.system(size: 14, weight: .semibold))
                }
                .foregroundColor(.white)
                .padding(.bottom, 40)
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
