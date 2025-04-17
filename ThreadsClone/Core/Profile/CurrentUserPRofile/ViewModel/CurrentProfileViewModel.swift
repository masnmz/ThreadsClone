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
    var selectedItem: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage()
            }
        }
    }
    var profileImage: Image?
    
    private func loadImage() async {
        guard let item = selectedItem else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let UIImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: UIImage)
        
    }
    
    
}
