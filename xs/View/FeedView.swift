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
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView {
                VStack{
                    ForEach(0..<20) { _ in
                        GraceCell()
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
                    .frame(width: 32, height: 32)
                    .padding()
            })
            // color
            .background(Color(.black))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            // aqui se utiliza el componente fullscreencover para mostrar el view NewPost cuando se cambia a true la variable
            .fullScreenCover(isPresented: $estaMostrandoNuevaPublicacion) {
                NewPostView(sePresenta: $estaMostrandoNuevaPublicacion)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
