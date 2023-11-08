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
                Text("Inicio")
                    .tabItem {
                        Image(systemName: "house")
                        Text("Inicio")
                    }
                
                Text("Busqueda")
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
