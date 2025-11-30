//
//  FeedView.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 30/11/25.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
       NavigationStack {
           ScrollView(showsIndicators: false) {
               LazyVStack {
                   ForEach(0..<20) { thread in
                      ThreadCell()
                       
                   }
               }
           }
           .refreshable {
               print(">>> Refreshing...")
           }
           .navigationTitle(Text("Threads"))
           .navigationBarTitleDisplayMode(.inline)
        }
       .toolbar {
           ToolbarItem(placement: .navigationBarTrailing) {
               Button(action: { }) {
                   Image(systemName: "arrow.counterclockwise")
                       .foregroundStyle(.black)
               }
           }
       }
    }
}

#Preview {
    NavigationStack {
        FeedView()
    }
}
