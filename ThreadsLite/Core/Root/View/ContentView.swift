//
//  ContentView.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 28/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                ThreadsTabView()
            }
        }
    }
}

#Preview {
    ContentView()
}
