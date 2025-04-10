//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 09/04/2025.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
@Observable
class AuthService {
    var userSession: FirebaseAuth.User?

    static let shared = AuthService()

    init() {
        self.userSession = Auth.auth().currentUser

        Task {
            await listenToAuthChanges()
        }
    }

    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
        } catch {
            print("Failed to login: \(error.localizedDescription)")
            throw error
        }
    }

    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid)
            print("DEBUG: Created user \(result.user.uid)")
            // You can also update Firestore here with user profile data
        } catch {
            print("Failed to create user: \(error.localizedDescription)")
            throw error
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut() // signs out on backend
        self.userSession = nil // removes session locally and update routing.
        UserService.shared.reset() // sets current user object to nil
    }
    
    @MainActor
    private func uploadUserData(
        withEmail email: String,
        fullname: String,
        username: String,
        id: String
    )async throws {
        let user = AppUser(id: id, fullname: fullname, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }

    @MainActor
    private func listenToAuthChanges() async {
        for await user in Auth.auth().authStateDidChangeStream() {
            self.userSession = user
        }
    }
}

extension Auth {
    func authStateDidChangeStream() -> AsyncStream<User?> {
        AsyncStream { continuation in
            let handle = addStateDidChangeListener { _, user in
                continuation.yield(user)
            }

            continuation.onTermination = { @Sendable _ in
                self.removeStateDidChangeListener(handle)
            }
        }
    }
}
