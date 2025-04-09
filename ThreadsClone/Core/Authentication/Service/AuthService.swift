//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 09/04/2025.
//

import Foundation
import Firebase
import FirebaseAuth

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
            print("DEBUG: Logged in user \(result.user.uid)")
        } catch {
            print("Failed to login: \(error.localizedDescription)")
            throw error
        }
    }

    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
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
