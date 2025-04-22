//
//  CreateThreadViewModel.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 21/04/2025.
//

import Foundation
import Firebase
import FirebaseAuth

@Observable
class CreateThreadViewModel {
    func uploadThred(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let thread = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        
        try await ThreadService.uploadThread(thread)
    }
}
