//
//  RegistrationView.swift
//  xs
//
//  Created by Felipe Vallejo on 14/11/23.
//

import SwiftUI

struct RegistrationView: View {
    // variables que debemos guardar al registrar un nuevo usuario
    @State var email = ""
    @State var contraseña = ""
    @State var nombre = ""
    @State var usuario = ""
    // para mostrar la pantalla para elegir la foto
    @State var imagenUISeleccionada: UIImage?
    @State var imagen: Image?
    @State var mostrarImagePicker = false
    // para cerrar una pantalla vamos a utilizar la siguiente variable
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject var viewModel = AuthViewModel()
    
    // funcion que va a transformar la imagen seleccionada a una SwiftUIImage
    func cargarImagen(){
        guard let imagenSeleccionada = imagenUISeleccionada else { return }
        imagen = Image(uiImage: imagenSeleccionada)
    }
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: { mostrarImagePicker.toggle() }, label: {
                    ZStack {
                        if let imagen = imagen {
                            imagen
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .clipped()
                                .cornerRadius(70)
                                .padding(.top, 88)
                                .padding(.bottom, 16)
                        } else {
                            Image ("plus_photo" )
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .padding(.top, 88)
                                .padding(.bottom, 16)
                                .foregroundColor(.white)
                        }
                    }
                }).sheet(isPresented: $mostrarImagePicker, onDismiss: cargarImagen, content: {
                    ImagePicker(imagen: $imagenUISeleccionada)
                })
                // vstack que vamos a utilizar para reutilizar dos textfields para ingresar el email y la contrasena del usuario
                VStack(spacing: 20) {
                    CustomTextField(texto: $nombre, descripcion: Text("Nombre"), nombreImagen: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(texto: $usuario, descripcion: Text("Usuario"), nombreImagen: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
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
                
                Button(action: {
                    guard let image = imagenUISeleccionada else { return }
                    viewModel.registerUser(email: email, password: contraseña, username: usuario, fullname: nombre, profileImage: image)
                }, label: {
                    Text ("Registrar")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(width: 360, height: 50)
                        .background (Color.white)
                        .clipShape(Capsule())
                        .padding ()
                })
                Spacer ()
                HStack {
                    Text("Ya tienes una cuenta?")
                        .font(.system(size: 14))
                    
                    Text("Inicia sesión aqui")
                        .font(.system(size: 14, weight: .semibold))
                }
                .foregroundColor(.white)
                .padding(.bottom, 40)
                .onTapGesture {
                    mode.wrappedValue.dismiss()
                }
            }
        }
        .background (Color(.black))
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
