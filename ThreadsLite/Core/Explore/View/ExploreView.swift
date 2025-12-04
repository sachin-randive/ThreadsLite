//
//  ExploreView.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 30/11/25.
//

import SwiftUI

struct ExploreView: View {
    @State var searchText: String = ""
    @StateObject var viewModel = ExploreViewModel()
    var body: some View {
      NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users, id: \.id) {user in
                        NavigationLink(value: user) {
                            VStack {
                              UserCell(user: user)
                                Divider()
                            }
                            .padding(.vertical, 5)
                        }
                    }
              }
          }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView()
            })
            .navigationTitle(Text("Search"))
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: Text("Search"))
        }
    }
}

#Preview {
    ExploreView()
}
