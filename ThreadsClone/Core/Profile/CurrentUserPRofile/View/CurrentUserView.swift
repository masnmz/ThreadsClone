//
//  CurrentUserView.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 10/04/2025.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @State var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false
    
    
    private var currentUser: AppUser? {
        viewModel.currentUser
    }
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                //            bio and stats
                VStack(spacing: 20) {
                    
                    ProfileHeaderView(user: currentUser)
                    
                    
                    Button {
                        showEditProfile.toggle()
                        
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                            .frame(width: 352, height: 32)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke( Color(.systemGray4), lineWidth: 1)
                            }
                    }
                    
                    //                user content list view
                    UserContentListView()
                }
                .sheet(isPresented: $showEditProfile, content: {
                    EditProfileView()

                })
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            AuthService.shared.signOut()
                        } label: {
                            Image(systemName: "line.3.horizontal")
                        }
                        .foregroundStyle(.black)
                    }
                }
            }
            
            .padding(.horizontal)
            
        }
        
    }
}

#Preview {
    CurrentUserProfileView()
}
