//
//  NewPostView.swift
//  xs
//
//  Created by Felipe Vallejo on 13/11/23.
//

import SwiftUI
import KingfisherSwiftUI

struct NewPostView: View {
    // para trackear si se esta presentando o no newpostview
    @Binding var sePresenta: Bool
    @State var textoDescripcion: String = ""
    @ObservedObject var viewModel: UploadPostViewModel
    
    init(isPresented: Binding<Bool>){
        self._sePresenta = isPresented
        self.viewModel = UploadPostViewModel(isPresented: isPresented)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    if let user = AuthViewModel.shared.user {
                        KFImage(URL(string:user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 64, height: 64)
                            .cornerRadius(32)
                    }
                    
                    TextArea("hey", texto: $textoDescripcion)
                    
                    Spacer()
                }
                .padding()
                .navigationBarItems(leading: Button(action: {
                    sePresenta.toggle()
                }, label: {
                    Text ("Cancel")
                        .foregroundColor(.black)
                }), trailing: Button(action: {
                    viewModel.uploadPost(caption: textoDescripcion)
//                    viewModel.uploadPost(caption: textoDescripcion) { _ in
//                        sePresenta.toggle()
//                    }
                }, label: {
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
        NewPostView(isPresented: .constant(false))
    }
}
