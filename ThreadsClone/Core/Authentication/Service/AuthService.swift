//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 09/04/2025.
//

import Foundation
import Firebase
import FirebaseAuth


class AuthService {
    
    static let shared = AuthService()
    
    func login(withEmail email: String, password: String) async throws {
        
    }
    
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: Created user \(result.user.uid)")
            
        } catch {
            print("Failed to create user with error \(error.localizedDescription)")
            
        }
    }
}
