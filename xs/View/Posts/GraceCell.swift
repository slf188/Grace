//
//  XSCell.swift
//  xs
//
//  Created by Felipe Vallejo on 8/11/23.
//

import SwiftUI
import Kingfisher

// aqui definimos las celdas de las publicaciones
struct GraceCell: View {
    let post: Post
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment:.top, spacing: 12){
                // imagen de usuario
                KFImage(URL(string: post.profileImageUrl))
                    .onSuccess({ result in
                        print("Imagen cargada exitosamente", result.image)
                    })
                    .onFailure({ err in
                        print("Error cargando imagen", err)
                    })
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56/2)
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4){
                    HStack {
                        // nombre
                        Text(post.fullname)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.black)
                    
                        // usuario
                        Text("@\(post.username) •")
                            .foregroundColor (.gray)
                    
                        // fecha
                        Text(post.timestampString)
                            .foregroundColor (.gray)
                    }
                    // contenido de publicacion
                    Text(post.caption)
                        .foregroundColor(.black)
                }
            }
            .padding(.bottom)
            .padding(.trailing)
            
            PostActionsView(post: post)
            
            Divider()
        }
        .padding(.leading, -16)
    }
}
