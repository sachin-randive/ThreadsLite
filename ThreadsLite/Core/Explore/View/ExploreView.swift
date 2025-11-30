//
//  ExploreView.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 30/11/25.
//

import SwiftUI

struct ExploreView: View {
    @State var searchText: String = ""
    var body: some View {
      NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0...10, id: \.self) {user in
                        VStack {
                          UserCell()
                            Divider()
                        }
                        .padding(.vertical, 5)
                    }
              }
          }
            .navigationTitle(Text("Search"))
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: Text("Search"))
        }
    }
}

#Preview {
    ExploreView()
}
