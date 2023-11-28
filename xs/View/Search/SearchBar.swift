//
//  SearchBar.swift
//  xs
//
//  Created by Felipe Vallejo on 8/11/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            // textfield para que el usuario pueda pasar input del usuario que quiere muscar
            TextField("Buscar...",text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        // icono de lupa
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity,
                                   alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
                .padding(.horizontal, 10)
        }
    }
    
    
    struct SearchBar_Previews: PreviewProvider {
        static var previews: some View {
            SearchBar(text: .constant("Buscar..."))
        }
    }
}
