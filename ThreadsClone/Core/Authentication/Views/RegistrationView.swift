//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 03/04/2025.
//

import SwiftUI

struct RegistrationView: View {
    @State var viewModel = RegistrationViewModel()

    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Spacer()
            //                App Icon
            Image("threads-app-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
            
            //                Login Section
            VStack {
                
                TextField("Enter your fullname", text: $viewModel.fullname)
                    .modifier(ThreadsTextFieldViewModifier())
                    
                
                TextField("Enter your username", text: $viewModel.username)
                    .modifier(ThreadsTextFieldViewModifier())
                    
                
                TextField("Enter your email", text: $viewModel.email)
                    .textInputAutocapitalization(.never)
                    .modifier(ThreadsTextFieldViewModifier())
                    
                
                SecureField("Enter your password", text: $viewModel.password)
                    .textInputAutocapitalization(.never)
                    .modifier(ThreadsTextFieldViewModifier())
                    
                
                
            }
            
            Button {
                Task { try await viewModel.createUsr()}
                
            } label: {
                Text("Sign Up")
                    .modifier(ThreadsButtonViewModifier())
                
            }
            .padding(.vertical)
            
            Spacer()
            
//            Footer
            Divider()
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    
                    Text("Log in")
                        .fontWeight(.semibold)
                }
                .foregroundStyle(.black)
                .font(.footnote)
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    RegistrationView()
}
