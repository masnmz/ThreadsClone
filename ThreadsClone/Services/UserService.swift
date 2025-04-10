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
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: AppUser.self)
        self.currentUser = user
        
        print("DEBUG: User is \(user)")
        
    }
    
    func reset() {
        self.currentUser = nil
    }
}
