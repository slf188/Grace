//
//  UserProfileView.swift
//  xs
//
//  Created by Felipe Vallejo on 10/11/23.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        VStack {
            ProfileHeaderView()
        }
        .navigationTitle("batman")
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
