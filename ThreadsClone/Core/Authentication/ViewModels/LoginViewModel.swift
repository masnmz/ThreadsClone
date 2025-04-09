//
//  LoginViewModel.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 09/04/2025.
//

import Foundation

@Observable
class LoginViewModel {
    var email = ""
    var password = ""
    
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
