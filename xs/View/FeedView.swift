//
//  FeedView.swift
//  xs
//
//  Created by Felipe Vallejo on 8/11/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView {
                
            }
            // boton para agregar una publicacion
            Button(action: {}, label: {
                // icono
                Image(systemName: "plus")
                    .resizable()
                    // tamano
                    .frame(width: 32, height: 32)
                    .padding()
            })
            // color
            .background(Color(.systemGray))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
