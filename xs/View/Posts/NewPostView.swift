//
//  NewPostView.swift
//  xs
//
//  Created by Felipe Vallejo on 13/11/23.
//

import SwiftUI

struct NewPostView: View {
    // para trackear si se esta presentando o no newpostview
    @Binding var sePresenta: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image ("batman")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 64, height: 64)
                        .cornerRadius(32)
                    Text ("What's happening?")
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding()
                .navigationBarItems(leading: Button(action: {
                    sePresenta.toggle()
                }, label: {
                    Text ("Cancel")
                        .foregroundColor(.black)
                }),
                                    trailing: Button(action: {}, label: {
                    Text ("Publicar")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(.gray)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }))
                Spacer()
            }
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView(sePresenta: .constant(true))
    }
}