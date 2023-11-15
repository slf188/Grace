//
//  XSCell.swift
//  xs
//
//  Created by Felipe Vallejo on 8/11/23.
//

import SwiftUI

// aqui definimos las celdas de las publicaciones
struct GraceCell: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment:.top, spacing: 12){
                // imagen de usuario
                Image("venom-10")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56/2)
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4){
                    HStack {
                        // nombre
                        Text ("Brock")
                            .font(.system(size: 14, weight: .semibold))
                    
                        // usuario
                        Text ("@venom •")
                            .foregroundColor (.gray)
                    
                        // fecha
                        Text ("2w")
                            .foregroundColor (.gray)
                    }
                    // contenido de publicacion
                    Text("por ser amable me tachan de mujeriego")
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

struct XSCell_Previews: PreviewProvider {
    static var previews: some View {
        GraceCell()
    }
}
