//
//  ProfieHeaderView.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 10/04/2025.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: AppUser?
    
    
    init(user: AppUser?) {
        self.user = user
    }
    
    
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                //                fullname and username
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(user?.username ?? "")
                        .font(.subheadline)
                }
                
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                Text("2 followers")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            
            CircularProfileImageView()
        }
        
    }
}

#Preview {
    ProfileHeaderView(user: DeveloperPreview.shared.user)
}
