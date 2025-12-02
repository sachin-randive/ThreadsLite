//
//  LoginViewModel.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 02/12/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
       try await AuthService.shared.login(
        withEmail: email,
        password: password)
    }
}
