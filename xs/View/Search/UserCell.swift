//
//  UserCell.swift
//  xs
//
//  Created by Felipe Vallejo on 8/11/23.
//

import SwiftUI
// kingfisher es la libreria que nos permitira render imagenes en la aplicacion
import KingfisherSwiftUI

struct UserCell: View {
    // para que nosotros podamos hacer un fetch y poder poblar el nombre del usuario y su nombre
    // para que se muestre en el tab de busqueda de usuarios
    let user: User
    var body: some View {
        HStack(spacing: 12) {
            // icono del usuario
            // para pasar la imagen del usuario vamos a utilizar la libreria kingfisher
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width:56,height: 56)
                .cornerRadius(28)
            
            VStack(alignment:.leading, spacing: 4) {
                // username
                Text (user.username)
                    .font(.system(size: 14, weight: .semibold))
                // nombre del usuario
                Text (user.fullname)
                    .font(.system(size: 14))
            }
            .foregroundColor(.black)
        }
    }
}
