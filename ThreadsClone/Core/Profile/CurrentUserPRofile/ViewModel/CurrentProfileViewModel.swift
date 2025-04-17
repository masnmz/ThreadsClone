//
//  ProfileViewModel.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 09/04/2025.
//

import Foundation
import PhotosUI
import SwiftUI

@Observable
class CurrentUserProfileViewModel {
    var currentUser: AppUser? {
        UserService.shared.currentUser
    }
    
    
    
    
    
}
