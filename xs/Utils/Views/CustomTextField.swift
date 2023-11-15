//
//  CustomTextField.swift
//  xs
//
//  Created by Felipe Vallejo on 14/11/23.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var texto: String
    let descripcion: Text
    
    var body: some View {
        ZStack(alignment:.leading) {
            if texto.isEmpty {
                descripcion
                    .foregroundColor(Color(.init (white: 1, alpha: 0.87)))
                    .padding (.leading, 40)
            }
            HStack(spacing: 16) {
                Image (systemName:"envelope")
                    .resizable()
                    .scaledToFit()
                    .frame (width: 20, height: 20)
                TextField("", text:$texto)
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(texto: .constant(""), descripcion: Text("email"))
    }
}
