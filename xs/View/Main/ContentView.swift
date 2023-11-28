//
//  ContentView.swift
//  xs
//
//  Created by Felipe Vallejo on 7/11/23.
//

import SwiftUI
import KingfisherSwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        // group nos ayudara a separar las pantallas que se mostraran en el inicio de la aplicacion
        Group {
            // si el usuario se ha logueado mostrar el main interface de la aplicacion
            if viewModel.userSession != nil {
                NavigationView {
                    TabView {
                        FeedView()
                        // boton inicio
                            .tabItem {
                                // icono
                                Image(systemName: "house")
                                // texto del boton
                                Text("Inicio")
                            }
                        
                        SearchView()
                        // boton busqueda
                            .tabItem {
                                Image(systemName:"magnifyingglass")
                                Text("Busqueda")
                            }
                        
                        ConversationsView()
                            .tabItem {
                                Image(systemName:"envelope")
                                Text("Mensajes")
                            }
                    }
                    .navigationBarTitle("Inicio")
                    .navigationBarItems(leading: Button(action: {
                        viewModel.cerrarSesion()
                    }, label: {
                        if let user = viewModel.user {
                            KFImage(URL(string: user.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .clipped()
                                .frame(width: 32, height: 32)
                                .cornerRadius(16)
                        }
                    }))
                    .navigationBarTitleDisplayMode(.inline)
                }
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
