//
//  AuthService.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 02/12/25.
//

import FirebaseAuth
import FirebaseFirestore

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    init () {
        self.userSession = Auth.auth().currentUser
    }
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
           // print("DEBUG: User created successfully: \(result.user.uid)")
            try await UserService.shared.fetchCurrentUser()
            
        } catch {
            print("DEBUG: Failed to create user: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            //print("DEBUG: User created successfully: \(result.user.uid)")
            try await uploadUserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid)
            try await UserService.shared.fetchCurrentUser()
        } catch {
            print("DEBUG: Failed to create user: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut() // sign out on backend
        self.userSession = nil // removes session locally and updates routings.
        UserService.shared.resetCurrentUser()
    }
    
    func uploadUserData(
        withEmail email: String,
        fullname: String,
        username: String,
        id: String) async throws {
            let user = User(id: id, fullName: fullname, email: email, username: username, profileImafeUrl: nil, bio: nil)
            guard let userData = try? Firestore.Encoder().encode(user) else {
                fatalError("Failed to encode user data.")
            }
            let db = Firestore.firestore()
            do {
                try await db.collection("users").document(id).setData(userData)
                UserService.shared.currentUser = user
                print("User data successfully uploaded.")
            } catch {
                print("Failed to upload user data: \(error.localizedDescription)")
            }
            
        }

}
