//
//  PreviewProvider.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 10/04/2025.
//

import SwiftUI

class DeveloperPreview {
    static let shared = DeveloperPreview()
    let user = AppUser(id: UUID().uuidString, fullname: "Mehmet Alp Sonmez", email: "test2@gmail.com", username: "masnmz")
}
