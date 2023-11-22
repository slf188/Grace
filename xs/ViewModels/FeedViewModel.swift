//
//  FeedViewModel.swift
//  xs
//
//  Created by Felipe Vallejo on 22/11/23.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init(){
        fetchPosts()
    }
    
    func fetchPosts(){
        COLLECTION_POSTS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.map({ Post(dictionary: $0.data()) })
        }
    }
    
    
}
