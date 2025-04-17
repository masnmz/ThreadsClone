//
//  EditProfileViewModel.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 17/04/2025.
//

import PhotosUI
import SwiftUI

class EditProfileViewModel {
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

