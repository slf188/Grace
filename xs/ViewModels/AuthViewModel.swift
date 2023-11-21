//
//  AuthViewModel.swift
//  xs
//
//  Created by Felipe Vallejo on 20/11/23.
//

import SwiftUI
import Firebase
import FirebaseStorage

class AuthViewModel: ObservableObject {
    // necesitaremos de dos variables para poder verificar si el usuario ha sido autenticado o no
    @Published var userSession: FirebaseAuth.User?
    // para ver si el proceso de autenticar esta aun ejecutandose
    @Published var isAuthenticating = false
    // para mostrar si hubo un error al momento de autenticar
    @Published var error: Error?
    @Published var user: User?
    
    // un bloque init para cuando instanciemos el AuthViewModel
    init(){
        // verificar si el usuario esta logueado o no:
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        // para crear un usuario no necesitamos mas que utilizar la funcion signIn!
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to login: \(error.localizedDescription)")
                return
            }
            // la variable que va a trackear que ya esta logueado el usuario
            self.userSession = result?.user
        }
    }
    
    func registerUser(email: String, password: String, username: String, fullname: String, profileImage: UIImage) {
        // antes de registrar al usuario necesito primero procesar la imagen que esta subiendo:
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        
        let filename = NSUUID().uuidString
        
        let storageRef = Storage.storage().reference().child(filename)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            print("Exitosamente se guardo la foto del usuario")
            
            
            storageRef.downloadURL { url, _ in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                // ahora que ya se ha procesado correctamente la imagen del usuario procedemos a llamar
                // la funcion createUser de firebase para registrar un nuevo usuario
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print("DEBUG: Error \(error.localizedDescription)")
                        return
                    }
                    guard let user = result?.user else { return }
                    
                    let data = ["email": email,
                                "username": username,
                                "fullname": fullname,
                                "profileImageUrl": profileImageUrl,
                                "uid": user.uid]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        self.userSession = user
                    }
                }
            }
        }
    }
    
    func cerrarSesion(){
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    // funcion actual que nos ayudara a retrieve informacion acerca del usuario logueado
    func fetchUser(){
        guard let uid = userSession?.uid else { return }
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else { return }
            let user = User(dictionary: data)
            print("DEBUG: User is \(user.username)")
        }
    }
}
