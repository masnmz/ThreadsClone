//
//  LoginView.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 03/04/2025.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
//                App Icon
                Spacer()
                Image("threads-app-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                
//                Login Section
                VStack {
                    TextField("Enter your email", text: $email)
                        .textInputAutocapitalization(.never)
                        .modifier(ThreadsTextFieldViewModifier())
                        
                    SecureField("Enter your password", text: $password)
                        .textInputAutocapitalization(.never)
                        .modifier(ThreadsTextFieldViewModifier())
                        
                }
//                Forgot Password Button
                NavigationLink {
                    Text("Forgot password?")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                }
                
                Button {
                    
                } label: {
                    Text("Login")
                        .modifier(ThreadsButtonViewModifier())
                    
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    
                    
                }
                .foregroundStyle(.black)
                .font(.footnote)
                

            }
            
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    LoginView()
}
