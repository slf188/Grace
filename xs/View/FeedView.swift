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
                viewModel.cerrarSesion()
//                estaMostrandoNuevaPublicacion.toggle()
            }, label: {
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
            // aqui se utiliza el componente sheet para mostrar el view NewPost cuando se cambia a true la variable
            .sheet(isPresented: $estaMostrandoNuevaPublicacion) {
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
