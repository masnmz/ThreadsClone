//
//  ExploreViewModel.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 10/04/2025.
//

import Foundation

@Observable
class ExploreViewModel {
    var users = [AppUser]()
    
    init() {
        Task { try await fetchUser()}
    }
    
    private func fetchUser()  async throws {
        self.users = try await UserService.fetchUsers()
    }
}
