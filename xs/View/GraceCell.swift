//
//  XSCell.swift
//  xs
//
//  Created by Felipe Vallejo on 8/11/23.
//

import SwiftUI
import KingfisherSwiftUI

// aqui definimos las celdas de las publicaciones
struct GraceCell: View {
    let post: Post
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment:.top, spacing: 12){
                // imagen de usuario
                KFImage(URL(string: post.profileImageUrl))
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
                    
                        // usuario
                        Text("@\(post.username) •")
                            .foregroundColor (.gray)
                    
                        // fecha
                        Text("2w")
                            .foregroundColor (.gray)
                    }
                    // contenido de publicacion
                    Text(post.caption)
                }
            }
            .padding(.bottom)
            .padding(.trailing)
            
            // todos los botones y las acciones que se pueden hacer en una publicacion
            HStack {
                Button(action: {}, label: {
                    Image (systemName:"bubble.left")
                        .font(.system(size: 16))
                        .frame (width: 32, height: 32)
                })
                
                
                Spacer ()
                
                Button(action: {}, label: {
                    Image (systemName:"arrow.2.squarepath")
                        .font(.system(size: 16))
                        .frame (width: 32, height: 32)
                    
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName:"heart")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
                    
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    Image (systemName:"bookmark")
                        .font(.system(size: 16))
                        .frame (width: 32, height: 32)
                })
            }
            .foregroundColor (.gray)
            .padding(.horizontal)
            Divider()
        }
        .padding(.leading, -16)
    }
}
