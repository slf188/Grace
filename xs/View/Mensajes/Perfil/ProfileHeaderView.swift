//
//  ProfileHeaderView.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack {
            // informacion del perfil
            Image("batman" )
                .resizable()
                .scaledToFill()
                .clipped()
                .frame (width: 120, height: 120)
                .cornerRadius (120 / 2)
                .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
            // nombre
            Text("Bruce Wayne")
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
            // usuario
            Text("batman")
                .font(.subheadline)
                .foregroundColor(.gray)
            // info
            Text("vamos a la baticueva")
                .font(.system(size: 14))
                .padding(.top, 8)
            HStack(spacing: 40) {
                VStack
                {
                    Text ("138M")
                        .font(.system(size: 16)).bold()
                    Text ("Seguidores")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                VStack
                {
                    Text ("12")
                        .font(.system(size: 16)).bold()
                    Text ("Siguiendo")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            Spacer()
        }
    }
}


struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
