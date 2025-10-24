//
//  SettingPage.swift
//  MarketMate App
//
//  Created by admin on 20/10/2025.
//

import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    @State private var currency = "USD"
    @State private var language = "English"
    @State private var showAboutPage = false
    @State private var showEditProfile = false
    
    let currencies = ["USD", "EUR", "ZAR", "GBP"]
    let languages = ["English", "French", "Spanish", "Zulu"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                LinearGradient(colors: [Color.white, Color(.systemGray6)],
                               startPoint: .top,
                               endPoint: .bottom)
                .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 30) {
                        
                        // MARK: - Header
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Settings")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
//                                .padding(.vertical,30)
                            
//                            Text("Manage your account and personalize your MarketMate experience.")
//                                .font(.subheadline)
//                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        
                        // MARK: - Account Section
                        SettingsSection(title: "Account") {
                            NavigationLink(destination: EditProfilePage()) {
                                SettingsRow(icon: "person.crop.circle.fill", title: "Edit Profile")
                            }
                            
                            
                            NavigationLink(destination: ChangePasswordView()) {
                                SettingsRow(icon: "key.fill", title: "Change Password")
                            }
                            
                            Button {
                                print("Logout tapped")
                            } label: {
                                SettingsRow(icon: "rectangle.portrait.and.arrow.right", title: "Log Out", color: .red)
                            }
                            
                        }
                        
                    }
                    
                    // MARK: - Personalization
                    SettingsSection(title: "Personalization") {
                        HStack {
                            SettingsIcon(name: "dollarsign.circle.fill", color: .blue)
                            Picker("Currency", selection: $currency) {
                                ForEach(currencies, id: \.self) { cur in
                                    Text(cur)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            Spacer()
                        }
                        
                        HStack {
                            SettingsIcon(name: "globe", color: .green)
                            Picker("Language", selection: $language) {
                                ForEach(languages, id: \.self) { lang in
                                    Text(lang)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            Spacer()
                        }
                        
                        Toggle(isOn: $darkModeEnabled) {
                            SettingsRow(icon: "moon.fill", title: "Dark Mode")
                        }
                    }
                    
                    // MARK: - Preferences
                    SettingsSection(title: "Preferences") {
                        Toggle(isOn: $notificationsEnabled) {
                            SettingsRow(icon: "bell.fill", title: "Enable Notifications")
                        }
                        
                        NavigationLink(destination: AboutView()){
                            SettingsRow(icon: "info.circle.fill", title: "About MarketMate")
                        }
                        
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
        
    }
}



#Preview {
    SettingsView()
}

// MARK: - Subviews

struct SettingsSection<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .foregroundColor(.gray)
            
            VStack(spacing: 12) {
                content
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        }
    }
}

struct SettingsRow: View {
    let icon: String
    let title: String
    var color: Color = .blue
    
    var body: some View {
        HStack {
            SettingsIcon(name: icon, color: color)
            Text(title)
                .foregroundColor(.primary)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .font(.caption)
        }
    }
}

struct SettingsIcon: View {
    let name: String
    let color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color.opacity(0.1))
                .frame(width: 36, height: 36)
            Image(systemName: name)
                .foregroundColor(color)
        }
    }
}
