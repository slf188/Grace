//
//  ProfileHeaderView.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI
import Kingfisher
import URLImage

struct ProfileHeaderView: View {
    @State var filtroSeleccionado: OpcionesFiltro = .publicaciones
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            KFImage(URL(string: viewModel.user.profileImageUrl))
                .onSuccess({ result in
                    print("este es el url de la imagen \(String(describing: URL(string: viewModel.user.profileImageUrl)))", result)
                })
                .resizable()
                .scaledToFill()
                .clipped()
                .frame (width: 120, height: 120)
                .cornerRadius (120 / 2)
//                .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
            
            // nombre
            Text(viewModel.user.fullname)
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
            // usuario
            Text("\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            //            // info
            //            Text("vamos a la baticueva")
            //                .font(.system(size: 14))
            //                .padding(.top, 8)
            HStack(spacing: 40) {
                VStack
                {
                    Text("\(viewModel.user.stats.seguidores)")
                        .font(.system(size: 16)).bold()
                    Text("Seguidores")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                VStack
                {
                    Text("\(viewModel.user.stats.siguiendo)")
                        .font(.system(size: 16)).bold()
                    Text("Siguiendo")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            
            ProfileActionButtonView(viewModel: viewModel)
            
            Spacer()
        }
    }
}
