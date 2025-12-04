//
//  ExploreViewModel.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 04/12/25.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    init() {
        Task {
            do {
                try await fetchUsers()
            } catch {
                print("Error fetching users: \(error)")
            }
        }
    }
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
