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
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(0..<10) { _ in
                    HStack { Spacer() }
                    
                    Button(action: {
                        self.mostrar.toggle()
                        self.iniciarChat.toggle()
                    }, label: {
                        UserCell()
                    })
                }
            }
            .padding(.leading)
        }
    }
}


struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(iniciarChat: .constant(true), mostrar: .constant(true))
    }
}
