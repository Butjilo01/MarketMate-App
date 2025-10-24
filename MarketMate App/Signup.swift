//
//  Signup.swift
//  MarketMate App
//
//  Created by admin on 15/10/2025.
//

import SwiftUI

struct SignUpView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var isSignedUp = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.opacity(0.20)
                    .ignoresSafeArea()
                
                VStack(spacing: 25) {
                    // MARK: - Title
                    Text("Create an Account")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top, 40)
                    
                    // MARK: - Signup Fields
                    TextField("Full Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .autocapitalization(.none) // prevents auto caps
                        .disableAutocorrection(true)
                    
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    // MARK: - Signup Button
                    Button(action: {
                        if name.isEmpty || email.isEmpty || password.isEmpty {
                            alertMessage = "Please fill in all fields."
                            showAlert = true
                        } else if !email.contains("@") || !email.contains(".") {
                            alertMessage = "Please enter a valid email address."
                            showAlert = true
                        } else if password.count < 6 {
                            alertMessage = "Password must be at least 6 characters long."
                            showAlert = true
                        } else {
                            isSignedUp = true
                        }
                    }) {
                        Text("Sign Up")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .shadow(radius: 3)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                    }
                    
                    // MARK: - NavigationLink to Login
                    .navigationDestination(isPresented: $isSignedUp) {
                        LoginView1()
                    }
                    
                    // MARK: - Already have an account?
                    HStack {
                        Text("Already have an account?")
                            .foregroundColor(.gray)
                        NavigationLink(destination: LoginView1()) {
                            Text("Log In")
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.bottom, 40)
                }
                .padding()
            }
        }
    }
}

#Preview {
    SignUpView()
}
