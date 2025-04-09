//
//  UploadThreadView.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 03/04/2025.
//

import SwiftUI

struct CreateThreadView: View {
    @State private var threadText = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    CircularProfileImageView()
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("maxverstappen1")
                            .fontWeight(.semibold)
                        
                        TextField("Start a thread...", text: $threadText, axis: .vertical)
                            
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !threadText.isEmpty {
                        Button {
                            threadText = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(.gray)
                            
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                        
                    }
                    .opacity(threadText.isEmpty ? 0.5 : 1.0)
                    .disabled(threadText.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold, )
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    CreateThreadView()
}
