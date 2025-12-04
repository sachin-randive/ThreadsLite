//
//  ProfileViewModel.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 03/12/25.
//

import Foundation
import Combine

@MainActor
class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        self.setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            DispatchQueue.main.async {
                self?.currentUser = user
            }
            print("Debug: User in view model from combine is \(String(describing: user))")
        }.store(in: &cancellables)
    }
}
