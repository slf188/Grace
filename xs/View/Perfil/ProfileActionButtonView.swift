//
//  ProfileActionButtonView.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI

struct ProfileActionButtonView: View {
    // variable que nos va ayudar a mostrar correctamente ya sea el boton de seguir o editar perfil
    let esElUsuarioActual: Bool
    
    var body: some View {
        if esElUsuarioActual {
            // boton de editar
            Button(action: {}, label: {
                Text ("Editar Perfil")
                    .frame(width: 360, height: 40)
                    .background(.black)
                    .foregroundColor(.white)
            })
            .cornerRadius (20)
        } else {
            HStack {
                Button(action: {}, label: {
                    Text ("Seguir")
                        .frame (width: 180, height: 40)
                        .background (.black)
                        .foregroundColor (.white)
                })
                .cornerRadius (20)
                Button(action: {}, label: {
                    Text ("Mensajear")
                        .frame(width: 180, height: 40)
                        .background (.black)
                        .foregroundColor(.white)
                })
                .cornerRadius (20)
            }
        }
    }
}
    
    struct ProfileActionButtonView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileActionButtonView(esElUsuarioActual: false)
        }
    }
