//
//  EditProfilePage.swift
//  MarketMate App
//
//  Created by admin on 20/10/2025.
//

import SwiftUI

struct EditProfilePage: View {
    @State private var profileImage: Image? = Image(systemName: "person.crop.circle.fill")
    @State private var name = "Butjilo Dube"
    @State private var email = "dubebutjilo@gmail.com"
    @State private var password = ""
    @State private var businessName = "MarketMate Store"
    @State private var location = "Victoria Falls, Zimbabwe"
    @State private var showImagePicker = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.opacity(0.2)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 25) {
                        
                        // MARK: - Profile Image
                        VStack {
                            profileImage?
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 3))
                                .shadow(radius: 5)
                            
                            Button(action: {
                                showImagePicker = true
                            }) {
                                Text("Change Photo")
                                    .font(.caption)
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.top)
                        
                        // MARK: - User Info Fields
                        Group {
                            CustomTextField(label: "Full Name", text: $name)
                            CustomTextField(label: "Email Address", text: $email)
                            SecureField("Password", text: $password)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 1)
                            CustomTextField(label: "Business Name", text: $businessName)
                            CustomTextField(label: "Location", text: $location)
                        }
                        
                        // MARK: - Action Buttons
                        HStack(spacing: 20) {
                            Button(action: {
                                print("Changes saved for: \(name)")
                            }) {
                                Text("Save Changes")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            
                            Button(action: {
                                print("Cancelled edits")
                            }) {
                                Text("Cancel")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.gray.opacity(0.3))
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.top, 10)
                        
                        Spacer()
                    }
                    .padding()
                }
                .navigationTitle("Edit Profile")
            }
        }
    }
}

#Preview {
    EditProfilePage()
}

struct CustomTextField: View {
    var label: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
            TextField(label, text: $text)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 1)
        }
    }
}
