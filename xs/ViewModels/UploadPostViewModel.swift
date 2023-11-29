//
//  UploadPostViewModel.swift
//  xs
//
//  Created by Felipe Vallejo on 22/11/23.
//

import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject {
    
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>){
        self._isPresented = isPresented
    }
    
    func uploadPost(caption: String){
        guard let user = AuthViewModel.shared.user else {
            print("Error: user is nil")
            return
        }
        let docRef = COLLECTION_POSTS.document()
        let data: [String: Any] = ["uid": user.id,
                                   "caption": caption,
                                   "fullname": user.fullname,
                                   "timestamp": Timestamp(date: Date()),
                                   "username": user.username,
                                   "profileImageUrl": user.profileImageUrl,
                                   "likes": 0,
                                   "id": docRef.documentID]
        //        docRef.setData(data) { _ in
        //            print("exitosamente se publico el post")
        //            self.isPresented = false
        //        }
        docRef.setData(data) { error in
            if let error = error {
                print("Error uploading post: \(error.localizedDescription)")
            } else {
                print("Post successfully uploaded.")
                self.isPresented = false
            }
        }
    }
}
