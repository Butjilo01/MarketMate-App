//
//  Login.swift
//  MarketMate App
//
//  Created by admin on 15/10/2025.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            Text("Login Page")
        }
        .navigationTitle("Log In")
    }
}

struct LoginView1: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.brown.opacity(0.20)
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    
                    Text("Welcome Back!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.brown)
                        .padding(.top, 40)
                    
                    
                    Text("Log in to continue managing your market stall with MarketMate.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                    
                    
                    VStack(spacing: 20) {
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
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 10)
                    
                    
                    VStack {
                        Button("Forgot Password?") {
                            
                            print("Forgot password tapped")
                        }
                        .font(.footnote)
                        .foregroundColor(.brown)
                        .padding(.trailing, 30)
                    }
                    
                    
                    Button(action: {
                        
                        if !email.isEmpty && !password.isEmpty {
                            isLoggedIn = true
                            print("Logged in with email: \(email)")
                        }
                    }) {
                        Text("Log In")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.brown)
                            .foregroundColor(.white)
                            .font(.headline)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal, 30)
                    .shadow(radius: 5)
                    
                    
                    .padding(.bottom, 40)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    LoginView1()
}

