//
//  ThreadService.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 21/04/2025.
//

import Foundation
import Firebase
import FirebaseFirestore

struct ThreadService {
    
    static func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
}
