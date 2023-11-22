//
//  xsApp.swift
//  xs
//
//  Created by Felipe Vallejo on 7/11/23.
//

import SwiftUI
import Firebase

@main
struct GraceApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            // cuando iniciamos un proyecto en swiftui inicialmente nos muestra ContentView()
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
