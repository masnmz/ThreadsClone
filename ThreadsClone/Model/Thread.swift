//
//  Thread.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 21/04/2025.
//

import Foundation
import Firebase
import FirebaseFirestore

struct Thread: Identifiable, Codable {
    @DocumentID var threadID: String?
    let ownerUid: String
    let caption: String
    let timeStamp: Timestamp
    var likes: Int
    
    var id: String {
        return threadID ?? NSUUID().uuidString
    }
    
    var user: AppUser?
    
    
}
