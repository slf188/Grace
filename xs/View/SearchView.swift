//
//  SearchView.swift
//  xs
//
//  Created by Felipe Vallejo on 8/11/23.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()

            VStack(alignment: .leading) {
                // se utiliza un for para mostrar celdas de usuarios
                ForEach(0..<19) { _ in
                    HStack {
                        Spacer()
                    }
                    UserCell()
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
