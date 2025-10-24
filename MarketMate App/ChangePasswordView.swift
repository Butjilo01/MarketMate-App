//
//  ChangePasswordView.swift
//  MarketMate App
//
//  Created by admin on 23/10/2025.
//

import SwiftUI

struct ChangePasswordView: View {
    
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    @State private var currentPassword = ""
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    //MARK: HEADLINE MESSAGE
                    Text("Change Password!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top, 40)
                    
                    VStack(spacing: 20) {
                        SecureField(" Current Password", text: $currentPassword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        SecureField("New Password", text: $newPassword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        SecureField("Confirm Password", text: $confirmPassword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        
                        Button(action: {
                            
                        }
                               
                        ) {
                            Text("Save changes")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                        
                    }
                }
            }
        }
    }
}
#Preview {
    ChangePasswordView()
}
