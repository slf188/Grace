//
//  SearchViewModel.swift
//  xs
//
//  Created by Felipe Vallejo on 21/11/23.
//

import SwiftUI
import Firebase

enum SearchViewModelConfiguration {
    case search
    case newMessage
}

/* la clase searchviewmodel tendra observableobject
 lo que permite que sea observable,
 esto quiere decir que cualquier cambio que se realice
 habra un listener que va a reconfigurarlo cuando los cambios se realicen
 */
class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    private var config: SearchViewModelConfiguration
    
    init(config: SearchViewModelConfiguration) {
        self.config = config
        fetchUsers(forConfig: config)
    }
    
    // para poder collecionar los datos de los usuarios definidos en la coleccion users
    func fetchUsers(forConfig config: SearchViewModelConfiguration) {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let users = documents.map({ User(dictionary: $0.data()) })
            
            switch config {
            case .newMessage:
                self.users = users.filter({ !$0.isCurrentUser })
            case .search:
                self.users = documents.map({ User(dictionary: $0.data()) })
            }
        }
    }
    
    func filteredUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter({ $0.fullname.lowercased().contains(lowercasedQuery) || $0.username.contains(lowercasedQuery) })
    }
}
