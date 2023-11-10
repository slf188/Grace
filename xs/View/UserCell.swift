//
//  UserCell.swift
//  xs
//
//  Created by Felipe Vallejo on 8/11/23.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(spacing: 12) {
            // icono del usuario
        Image ("venom-10")
            .resizable()
            .scaledToFill()
            .clipped()
            .frame(width:56,height: 56)
            .cornerRadius(28)
        
        VStack(alignment:.leading, spacing: 4) {
            // username
            Text ("venom")
                .font(.system(size: 14, weight: .semibold))
                // nombre del usuario
                Text ("Eddie Brock")
                .font(.system(size: 14))
            }
        .foregroundColor(.black)
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
