//
//  ChatView.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI

struct ChatView: View {
    @State var messageText: String = ""
    
    var body: some View {
        VStack{
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(0..<15) { _ in
                        HStack {
                            Spacer()
                            Text("mensaje para tu perrita")
                                .padding()
                                .background(Color.gray)
                                .clipShape(ChatBubble(isFromCurrentUser: true))
                                .foregroundColor(.white)
                            .padding(.horizontal)
                        }
                    }
                }
            }
            MessageInputView(messageText: $messageText)
                .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
