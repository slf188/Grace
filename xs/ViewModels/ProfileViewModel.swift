//
//  ProfileViewModel.swift
//  xs
//
//  Created by Felipe Vallejo on 21/11/23.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    @Published var user: User
    // para crear funciones que van hacer fetch de los likes que tiene un post y los posts
    @Published var userPosts = [Post]()
    @Published var likedPosts = [Post]()
    
    init(user: User){
        self.user = user
        checkIfUserIsFollowed()
        fetchUserPosts()
        fetchLikedPosts()
        fetchUserStats()
    }
    
    func posts(forFilter filter: OpcionesFiltro) -> [Post] {
        switch filter {
        case .publicaciones: return userPosts
        case .likes: return likedPosts
        }
    }
}

// extension para que no quede muy aglomerado el profileviewmodel
/// API
extension ProfileViewModel {
    func follow() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(user.id).setData([:]) { _ in
            COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers").document(currentUid).setData([:]) { _ in
                self.user.isFollowed = true
            }
        }
    }
    
    func unfollow() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        let followersRef = COLLECTION_FOLLOWERS.document(user.id).collection("user-followers")
        
        followingRef.document(user.id).delete { _ in
            followersRef.document(currentUid).delete { _ in
                self.user.isFollowed = false
            }
        }
    }
    
    func checkIfUserIsFollowed(){
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        guard !user.isCurrentUser else { return }
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        
        followingRef.document(user.id).getDocument { snapshot, _ in
            guard let isFollowed = snapshot?.exists else { return }
            self.user.isFollowed = isFollowed
        }
    }
    
    func fetchUserPosts() {
        COLLECTION_POSTS.whereField("uid", isEqualTo: user.id).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.userPosts = documents.map({ Post(dictionary: $0.data()) })
        }
    }
    
    func fetchLikedPosts() {
        // para contar los likes que tiene cada post utilizamos la siguiente variable
        var posts = [Post]()
        COLLECTION_USERS.document(user.id).collection("user-likes").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let postIDs = documents.map({ $0.documentID })
            
            postIDs.forEach { id in
                COLLECTION_POSTS.document(id).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else { return }
                    let post = Post(dictionary: data)
                    posts.append(post)
                    guard posts.count == postIDs.count else { return }
                    self.likedPosts = posts
                }
            }
        }
    }
    
    func fetchUserStats(){
        let followersRef = COLLECTION_FOLLOWERS.document(user.id).collection("user-followers")
        let followingRef = COLLECTION_FOLLOWING.document(user.id).collection("user-following")
        followersRef.getDocuments { snapshot, _ in
            guard let followerCount = snapshot?.documents.count else { return }
            
            followingRef.getDocuments { snapshot, _ in
                guard let followingCount = snapshot?.documents.count else { return}
                self.user.stats = StatsUsuario(seguidores: followerCount, siguiendo: followingCount)
            }
            
        }
    }
}
