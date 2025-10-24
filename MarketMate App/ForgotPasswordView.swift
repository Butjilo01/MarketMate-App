//
//  ForgotPasswordView.swift
//  MarketMate App
//
//  Created by admin on 23/10/2025.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isEmailSent = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
                VStack(spacing:30) {
                    //MARK: TITLE OF THE PAGE
                    Text("Forgot Password?")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top, 40)
                    
                    //MARK: Subtitle
                        .padding(.vertical,50)
                    
                    Text("Enter your registered email address below and we’ll send you a link to reset your password.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                    
                    //MARK: EMAIL INPUT
                    
                    TextField("Email Address", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal,30)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    
                    //MARK: SUBMIT BUTTON
                    
                    Button(action: {
                        if email.isEmpty{
                            alertMessage = "Please enter your email"
                            showAlert = true
                        } else if !email.contains("@") {
                            alertMessage = "Please enter a valid email address"
                            showAlert = true
                        }else {
                            isEmailSent = true
                            alertMessage = "A passowrd reset link has been sent to your \(email)"
                            showAlert = true
                        }
                    }) {
                        Text(" Send Reset Link")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(.blue))
                            .foregroundColor(.white)
                            .font(.headline)
                            .cornerRadius(12)
                        
                    }
                    .padding(.horizontal, 30)
                    .shadow(radius: 5)
                    
                    
                    //MARK: BACK TO LOGIN VIEW
                    NavigationLink(destination: LoginView1()) {
                        Text(" Back to Login")
                            .font(.footnote)
                            .underline()
                            .foregroundColor(.gray)
                    }
                    .padding(.top,20)
                    
                    Spacer()
                    
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(isEmailSent ? "Email Sent!" : "Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
                
            }
            
            
        }
    }
}
#Preview {
    ForgotPasswordView()
}
