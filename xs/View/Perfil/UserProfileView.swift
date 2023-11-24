//
//  UserProfileView.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    @State var filtroSeleccionado: OpcionesFiltro = .publicaciones
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user: User){
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(viewModel: viewModel, isFollowed: $viewModel.isFollowed)
                    .padding()
                
                FilterButtonView(opcionSeleccionada: $filtroSeleccionado)
                    .padding()
                
                // celdas de publicaciones
                ForEach(viewModel.posts(forFilter: filtroSeleccionado)) { post in
                    GraceCell(post: post)
                        .padding()
                }
            }
            .navigationTitle(user.username)
        }
    }
}
