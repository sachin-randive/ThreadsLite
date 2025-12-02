//
//  ContentViewModel.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 02/12/25.
//

import Foundation
import Combine
import FirebaseAuth

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupUserSession()
    }
    private func setupUserSession() {
        AuthService.shared.$userSession.sink { [weak self] userSesion in
            self?.userSession = userSesion
        }.store(in: &cancellables)
    }
}
