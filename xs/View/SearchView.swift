//
//  SearchView.swift
//  xs
//
//  Created by Felipe Vallejo on 8/11/23.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @ObservedObject var viewModel = SearchViewModel(config: .search)
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading) {
                // se utiliza un for para mostrar celdas de usuarios
                /* previamente utilizamos un hardcoded value de 0..10
                 ahora lo poblaremos solo con los usuarios que existen
                 registrados en la aplicacion
                 */
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)) { user in
                    HStack {
                        Spacer()
                    }
                    // para llevar al perfil del usuario cuando damos click en la celda de los usuarios
                    
                    // aqui llamaremos lazyview
                    // unicamente se haran llamadas al api cuando hagamos click en el perfil de un usuario
                    NavigationLink(
                        destination: LazyView(UserProfileView(user: user)),
                        label: {
                            UserCell(user: user)
                        })
                }
            }
            .padding(.leading)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
