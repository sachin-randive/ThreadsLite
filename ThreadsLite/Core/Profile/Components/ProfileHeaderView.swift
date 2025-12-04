//
//  ProfileHeaderView.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 04/12/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 15) {
                VStack(alignment: .leading, spacing: 5) {
                    Text(user.fullName)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(user.username)
                        .font(.subheadline)
                }
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                
                Text("2 followers")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            CircularImageProfileView()
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: dev.user)
    }
}
