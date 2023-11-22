//
//  SearchViewModel.swift
//  xs
//
//  Created by Felipe Vallejo on 21/11/23.
//

import SwiftUI
import Firebase

/* la clase searchviewmodel tendra observableobject
lo que permite que sea observable,
 esto quiere decir que cualquier cambio que se realice
 habra un listener que va a reconfigurarlo cuando los cambios se realicen
 
 */
class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    // para poder collecionar los datos de los usuarios definidos en la coleccion users
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.map({ User(dictionary: $0.data()) })
        }
    }
}
