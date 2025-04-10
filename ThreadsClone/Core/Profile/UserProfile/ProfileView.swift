//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 03/04/2025.
//

import SwiftUI

struct ProfileView: View {
    let user: AppUser
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            //            bio and stats
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                }
                
                //                user content list view
                    UserContentListView()
               
                
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        
        .padding(.horizontal)
        
        
    }
}

#Preview {
    ProfileView(user: DeveloperPreview.shared.user)
}
