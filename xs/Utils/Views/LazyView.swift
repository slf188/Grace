//
//  LazyView.swift
//  xs
//
//  Created by Felipe Vallejo on 23/11/23.
//

import SwiftUI

// esto va a permitir que se cargue el contenido de una vista unicamente cuando se presente
// esto va ayudar a que no se hagan llamadas al API de google inecesariamente
struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
