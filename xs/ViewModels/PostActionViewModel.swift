//
//  PostActionViewModel.swift
//  xs
//
//  Created by Felipe Vallejo on 22/11/23.
//

import SwiftUI
import Firebase

class PostActionViewModel: ObservableObject {
    let post: Post
    @Published var didlike = false
    
    init(post: Post) {
        self.post = post
        // para que persistan los likes que dimos en las publicaciones
        checkIfUserLikedPost()
    }
    
    func likePost() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let postLikesRef = COLLECTION_POSTS.document(post.id).collection("post-likes")
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes")
        
        COLLECTION_POSTS.document(post.id).updateData(["likes": post.likes + 1]) { _ in
            postLikesRef.document(uid).setData([:]) { _ in
                userLikesRef.document(self.post.id).setData([:]) { _ in
                    self.didlike = true
                }
            }
        }
    }
    
    func unlikePost() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let postLikesRef = COLLECTION_POSTS.document(post.id).collection("post-likes")
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes")
        
        COLLECTION_POSTS.document(post.id).updateData(["likes": post.likes - 1]) { _ in
            postLikesRef.document(uid).delete { _ in
                userLikesRef.document(self.post.id).delete { _ in
                    self.didlike = false
                }
            }
        }
    }
    
    func checkIfUserLikedPost(){
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes").document(post.id)
        
        userLikesRef.getDocument { snapshot, _ in
            guard let didlike = snapshot?.exists else { return }
            self.didlike = didlike
        }
    }
}
