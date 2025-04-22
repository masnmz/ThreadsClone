//
//  PreviewProvider.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 10/04/2025.
//

import SwiftUI
import Firebase

class DeveloperPreview {
    static let shared = DeveloperPreview()
    let user = AppUser(id: UUID().uuidString, fullname: "Mehmet Alp Sonmez", email: "test2@gmail.com", username: "masnmz")
    
    let thread = Thread(ownerUid: "123" , caption: "This is a test thread", timestamp: Timestamp(), likes: 0)
}
