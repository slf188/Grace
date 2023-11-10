//
//  ChatBubble.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI

// en este caso ya nuestro struct no sera de un view si no que de una forma que vamos a utilizar para mostrar nuestros mensajes
struct ChatBubble: Shape {
    // una variable que va a mostrar si el mensaje es del usuario actual o no
    var isFromCurrentUser: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, isFromCurrentUser ? .bottomLeft: .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(isFromCurrentUser: false)
    }
}
