//
//  UserService.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 09/04/2025.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

@Observable
class UserService {
    var currentUser: AppUser?
    
    static let shared = UserService()
    
    init() {
        Task { try await fetchCurrentUser()}
    }
    
    static func fetchUsers() async throws -> [AppUser] {
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap({ try? $0.data(as: AppUser.self) })
        return users.filter({$0.id != currentUid})
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: AppUser.self)
        self.currentUser = user
        
        
    }
    
    static func fetchUser(withUid uid: String) async throws -> AppUser {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: AppUser.self)
    }
    
    func reset() {
        self.currentUser = nil
    }
}
