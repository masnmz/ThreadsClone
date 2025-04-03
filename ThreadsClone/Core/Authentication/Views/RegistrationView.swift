//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 03/04/2025.
//

import SwiftUI

struct RegistrationView: View {
    @State private var fullname = ""
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    
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
                
                TextField("Enter your fullname", text: $fullname)
                    .modifier(ThreadsTextFieldViewModifier())
                    
                
                TextField("Enter your username", text: $username)
                    .modifier(ThreadsTextFieldViewModifier())
                    
                
                TextField("Enter your email", text: $email)
                    .textInputAutocapitalization(.never)
                    .modifier(ThreadsTextFieldViewModifier())
                    
                
                SecureField("Enter your password", text: $password)
                    .textInputAutocapitalization(.never)
                    .modifier(ThreadsTextFieldViewModifier())
                    
                
                
            }
            
            Button {
                
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
