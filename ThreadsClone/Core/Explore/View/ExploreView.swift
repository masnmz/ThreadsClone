//
//  ExploreView.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 03/04/2025.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText: String = ""
    @State private var viewModel = ExploreViewModel()
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            VStack {
                                UserCell(user: user)
                                
                                Divider()
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationDestination(for: AppUser.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
