//
//  NewMessageView.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI

// mostrar o no mostrar un nuevo chat
struct NewMessageView: View {
    @State var searchText = ""
    @Binding var iniciarChat: Bool
    @Binding var mostrar: Bool
    @Binding var user: User?
    @ObservedObject var viewModel = SearchViewModel(config: .newMessage)
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)) { user in
                    HStack { Spacer() }
                    
                    Button(action: {
                        self.mostrar.toggle()
                        self.iniciarChat.toggle()
                        self.user = user
                    }, label: {
                        UserCell(user: user)
                    })
                }
            }
            .padding(.leading)
        }
    }
}
