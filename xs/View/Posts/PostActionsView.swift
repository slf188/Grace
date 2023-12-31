//
//  PostActionsView.swift
//  xs
//
//  Created by Felipe Vallejo on 22/11/23.
//

import SwiftUI

struct PostActionsView: View {
    let post: Post
    @ObservedObject var viewModel: PostActionViewModel
    
    init(post: Post){
        self.post = post
        self.viewModel = PostActionViewModel(post: post)
    }
    
    var body: some View {
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
            
            Button(action: {
                // para dar like o no quitar el like
                viewModel.didlike ? viewModel.unlikePost() : viewModel.likePost()
            }, label: {
                // vamos a utilizar la var didLike de el viewmodel para poder mostrar likes
                Image(systemName: viewModel.didlike ? "heart.fill" : "heart")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
                    .foregroundColor(Color(viewModel.didlike ? .red : .gray))
                
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
    }
}
