//
//  Login.swift
//  MarketMate App
//
//  Created by admin on 15/10/2025.
//

import SwiftUI
struct LoginView1: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    @State private var isLoggedIn = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var forgotPassword = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.white
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    // MARK: - HEADER
                    Text("Welcome Back!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top, 40)
                    
                    // MARK: - SUBTITLE
                    Text("To continue and manage your stalls, please log in to your MarketMate account.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                    
                    // MARK: - EMAIL & PASSWORD FIELDS
                    VStack(spacing: 20) {
                        TextField("Email Address", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.none)
                            .autocorrectionDisabled(false)
                        
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
                    
                    // MARK: - FORGOT PASSWORD LINK
                    VStack {
                        NavigationLink(destination: ForgotPasswordView()) {
                            Text("Forgot Password?")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 30)
                    }
                    
                    // MARK: - LOGIN BUTTON
                    Button(action: {
                        validateLogin()
                    }) {
                        Text("Log In")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .font(.headline)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal, 30)
                    .shadow(radius: 5)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Login Error"),
                            message: Text(alertMessage),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    .navigationDestination(isPresented: $isLoggedIn) {
                        HomePage()
                    }
                    
                    Spacer()
                }
            }
        }
    }
    
    // MARK: - VALIDATION FUNCTION
    private func validateLogin() {
        // Empty Fields
        guard !email.isEmpty else {
            alertMessage = "Please enter your email address."
            showAlert = true
            return
        }
        
        guard !password.isEmpty else {
            alertMessage = "Please enter your password."
            showAlert = true
            return
        }
        
        // Invalid Email Format
        guard email.contains("@"), email.contains(".") else {
            alertMessage = "Please enter a valid email address."
            showAlert = true
            return
        }
        
        // Weak Password
        guard password.count >= 6 else {
            alertMessage = "Your password must be at least 6 characters long."
            showAlert = true
            return
        }
        
        // Simulate successful login
        isLoggedIn = true
        print("✅ Logged in successfully with email: \(email)")
    }
}
#Preview {
    LoginView1()
}
