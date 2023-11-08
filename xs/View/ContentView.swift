//
//  ContentView.swift
//  xs
//
//  Created by Felipe Vallejo on 7/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
                
                Text("Busqueda")
                    // boton busqueda
                    .tabItem {
                        Image(systemName:"magnifyingglass")
                        Text("Busqueda")
                    }
                
                Text("Mensajes")
                    .tabItem {
                        Image(systemName:"envelope")
                        Text("Mensajes")
                    }
            }
            .navigationBarTitle("Inicio")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
