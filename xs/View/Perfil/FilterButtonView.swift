//
//  FilterButtonView.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI

// en este archivo se filtran 3 opciones en el perfil
// publicaciones, replicas, likes
enum OpcionesFiltro: Int, CaseIterable {
    case publicaciones
    case replicas
    case likes
    
    var title: String {
        switch self {
        case .publicaciones: return "Publicaciones"
        case .replicas: return "Replicas"
        case .likes: return "Likes"
        }
    }
}

struct FilterButtonView: View {
    // este es un valor que va a indicar cual opcion ha sido elegida, publicaciones, replicas o likes
    @Binding var opcionSeleccionada: OpcionesFiltro
    
    // la anchura de la barra de seleccion
    private let subrayadoAnchura = UIScreen.main.bounds.width / CGFloat(OpcionesFiltro.allCases.count)
    
    // padding lo que hace es crear espaciado en la raya de selecicon
    private var padding: CGFloat {
        let rawValue = CGFloat(opcionSeleccionada.rawValue)
        let count = CGFloat (OpcionesFiltro.allCases.count)
        // anchura total de la pantalla dividido por 3 (opciones)  * 3  y mas padding de 16
        return ((UIScreen.main.bounds.width / count) * rawValue) + 16
    }
    
    var body: some View {
        VStack(alignment:.leading) {
            HStack {
                ForEach(OpcionesFiltro.allCases, id: \.self) { option
                    in
                    Button(action: {
                        self.opcionSeleccionada = option
                    }, label: {
                        Text(option.title)
                            .frame(width: subrayadoAnchura - 8)
                    })
                }
            }
            Rectangle()
                .frame (width: subrayadoAnchura - 32, height: 3, alignment: .center)
                .foregroundColor(.blue)
                .padding(.leading, padding)
                .animation(.spring())
        }
    }
}

struct FilterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FilterButtonView(opcionSeleccionada: .constant(.publicaciones))
    }
}
