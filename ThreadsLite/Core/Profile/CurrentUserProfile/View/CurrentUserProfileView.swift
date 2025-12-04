//
//  CurrentUserProfile.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 04/12/25.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    @StateObject var viewModel = CurrentUserProfileViewModel()
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView( showsIndicators: false) {
                VStack(spacing: 20) {
                    if let user = currentUser {
                        ProfileHeaderView(user: user)
                    }
                    //outer vstack
                    Button(action: {
                        
                    }) {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .frame(width: 352, height: 32)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(style:  StrokeStyle(lineWidth: 1))
                            })
                    }
                    UserContentListView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

//#Preview {
//    CurrentUserProfile()
//}

struct CurrentUserProfile_Preview: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView()
    }
}
