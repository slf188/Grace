//
//  NewPostView.swift
//  xs
//
//  Created by Felipe Vallejo on 28/11/23. en realidad se creo el 13
//

import SwiftUI
import Kingfisher

struct NewPostView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image("venom-10")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 64, height: 64)
                        .cornerRadius(32)
                    
                    Text("whats")
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                .padding()
                .navigationBarItems(leading: Button(action: { isPresented.toggle() }, label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }),
                                    trailing: Button(action: {}, label: {
                    Text("Post")
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
        NewPostView(isPresented: .constant(true))
    }
}


//// para trackear si se esta presentando o no newpostview
//@Binding var sePresenta: Bool
//@State var textoDescripcion: String = ""
//@ObservedObject var viewModel: UploadPostViewModel
//
//init(isPresented: Binding<Bool>){
//    self._sePresenta = isPresented
//    self.viewModel = UploadPostViewModel(isPresented: isPresented)
//}
//
//var body: some View {
//    NavigationView {
//        VStack {
//            HStack(alignment: .top) {
//                if let user = AuthViewModel.shared.user {
//                    KFImage(URL(string:user.profileImageUrl))
//                        .resizable()
//                        .scaledToFill()
//                        .clipped()
//                        .frame(width: 64, height: 64)
//                        .cornerRadius(32)
//                }
//
//                TextArea("hey", texto: $textoDescripcion)
//
//                Spacer()
//            }
//            .padding()
//            .navigationBarItems(leading: Button(action: {
//                sePresenta.toggle()
//            }, label: {
//                Text ("Cancel")
//                    .foregroundColor(.black)
//            }), trailing: Button(action: {
//                viewModel.uploadPost(caption: textoDescripcion)
////                    viewModel.uploadPost(caption: textoDescripcion) { _ in
////                        sePresenta.toggle()
////                    }
//            }, label: {
//                Text ("Publicar")
//                    .padding(.horizontal)
//                    .padding(.vertical, 8)
//                    .background(.gray)
//                    .foregroundColor(.white)
//                    .clipShape(Capsule())
//            }))
//
//            Spacer()
//
//        }
//    }
//}
