//
//  FeedView.swift
//  xs
//
//  Created by Felipe Vallejo on 8/11/23.
//

import SwiftUI

struct FeedView: View {
    // para mostrar o no mostrar el NewPostView
    @State var estaMostrandoNuevaPublicacion = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView {
                LazyVStack{
                    ForEach(viewModel.posts) { post in
                        NavigationLink(destination: PostDetailView(post: post)) {
                            GraceCell(post: post)
                        }
                    }
                }.padding()
            }
            // boton para agregar una publicacion
            // toggle de la variable estaMostrandoNuevaPublicacion
            Button(action: {
                estaMostrandoNuevaPublicacion.toggle()
            }, label: {
                // icono
                Image(systemName: "plus")
                    .resizable()
                    .renderingMode(.template)
                    // tamano
                    .frame(width: 28, height: 28)
                    .padding()
            })
            // color
            .background(Color(.black))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            // aqui se utiliza el componente fullscreencover para mostrar el view NewPost cuando se cambia a true la variable
            .fullScreenCover(isPresented: $estaMostrandoNuevaPublicacion) {
                NewPostView(isPresented: $estaMostrandoNuevaPublicacion)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
