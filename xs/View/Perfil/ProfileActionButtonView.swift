//
//  ProfileActionButtonView.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI

struct ProfileActionButtonView: View {
    // variable que nos va ayudar a mostrar correctamente ya sea el boton de seguir o editar perfil
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        if viewModel.user.isCurrentUser {
            // boton de editar
            Button(action: {}, label: {
                Text ("Editar Perfil")
                    .frame(width: 360, height: 40)
                    .background(.black)
                    .foregroundColor(.white)
            })
            .cornerRadius (20)
        } else {
            HStack {
                Button(action: {
                    viewModel.user.isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text (viewModel.user.isFollowed ? "Siguiendo" : "Seguir")
                        .frame (width: 180, height: 40)
                        .background (.black)
                        .foregroundColor (.white)
                })
                .cornerRadius (20)
                
                NavigationLink(destination: ChatView(), label: {
                    Text ("Mensajear")
                        .frame(width: 180, height: 40)
                        .background (.black)
                        .foregroundColor(.white)
                })
                .cornerRadius (20)
            }
        }
    }
}
