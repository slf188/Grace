//
//  UserProfileView.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    //  45
//    @ObservedObject var viewModel: ProfileViewModel
    @State var filtroSeleccionado: OpcionesFiltro = .publicaciones
    
//    init(user: User){
//        self.user = user
//        self.viewModel = ProfileViewModel(user: user)
//    }
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(user: user)
                    .padding()
                
                // opciones, publicacion, replicas, likes
                FilterButtonView(opcionSeleccionada: $filtroSeleccionado)
                    .padding()
                
                // celdas de publicaciones
                ForEach(0..<9) { publicacion in
                    GraceCell()
                }
            }
            .navigationTitle("batman")
        }
    }
}
