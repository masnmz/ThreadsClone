//
//  RegistrationViewModel.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 09/04/2025.
//

import Foundation

@Observable
class RegistrationViewModel {
    
    var fullname = ""
    var username = ""
    var email = ""
    var password = ""
    
    func createUsr() async throws {
       try await AuthService.shared.createUser(
            withEmail: email,
            password: password,
            fullname: fullname,
            username: username
        )
    }
    
}
