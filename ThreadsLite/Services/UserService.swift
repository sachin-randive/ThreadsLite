//
//  UserService.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 03/12/25.
//
import FirebaseFirestore
import FirebaseAuth
import FirebaseFirestoreCombineSwift

class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    init () {
        Task { try? await fetchCurrentUser() }
    }
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        
        print("DEBUG: Current User Fetched; - \(user)")
    }
    
    static func fetchUsers() async throws -> [User] {
        guard let currentUserUID = Auth.auth().currentUser?.uid else {
            return []
        }
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap { try? $0.data(as: User.self) }
        return users.filter { $0.id != currentUserUID }
    }
    
    func resetCurrentUser() {
        self.currentUser = nil
    }
}

