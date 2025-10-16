//
//  Signup.swift
//  MarketMate App
//
//  Created by admin on 15/10/2025.
//

import SwiftUI

struct SignUpView: View {
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showPassword = false
    
    var body: some View {
        ZStack {
            
            Color.brown.opacity(0.20)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                
                Text("Create Your Account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.brown)
                    .padding(.top, 40)
                
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    TextField("Full Name", text: $fullName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.words)
                    
                    
                    TextField("Email Address", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    
                    
                    HStack {
                        if showPassword {
                            TextField("Password", text: $password)
                        } else {
                            SecureField("Password", text: $password)
                        }
                        
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
                    SecureField("Confirm Password", text: $confirmPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal, 30)
                
                
                Button(action: {
                    
                    print("User signed up")
                }) {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.brown)
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(12)
                }
                .padding(.horizontal, 30)
                .shadow(radius: 5)
                
                
                HStack {
                    Text("Already have an account?")
                        .foregroundColor(.gray)
                    NavigationLink(destination: LoginView()) {
                        Text("Log In")
                            .fontWeight(.bold)
                            .foregroundColor(.brown)
                    }
                }
                .padding(.bottom, 40)
                
                Spacer()
            }
        }
    }
}

#Preview {
    SignUpView()
}
