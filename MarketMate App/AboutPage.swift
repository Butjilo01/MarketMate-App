//
//  AboutPage.swift
//  MarketMate App
//
//  Created by admin on 23/10/2025.
//

import SwiftUI
import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                
                // MARK: - App Logo
                Image(systemName: "cart.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .padding(.top, 40)
                
                // MARK: - App Title
                Text("MarketMate")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                // MARK: - Tagline
                Text("Your smart companion for managing stalls and boosting business efficiency.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                Divider()
                    .padding(.horizontal, 30)
                
                // MARK: - App Details
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "info.circle")
                            .foregroundColor(.blue)
                        Text("Version 1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Image(systemName: "person.3.fill")
                            .foregroundColor(.blue)
                        Text("Developed by Team MarketMate")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Image(systemName: "globe")
                            .foregroundColor(.blue)
                        Text("www.marketmateapp.com")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 2)
                .padding(.horizontal, 25)
                
                // MARK: - Mission Section
                VStack(spacing: 10) {
                    Text("Our Mission")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text("At MarketMate, we empower small business owners and stall operators to stay organized, make data-driven decisions, and grow sustainably through modern technology.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                }
                .padding(.top, 20)
                
                Spacer()
            }
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .navigationTitle("About")
    }
}

#Preview {
    AboutView()
}
