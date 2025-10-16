//
//  WelcomePage.swift
//  MarketMate App
//
//  Created by admin on 15/10/2025.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.green
                .opacity(0.20)
                .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    // App Title
                    Text("MarketMate")
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                        .foregroundColor(.brown)
                        .padding(.top, 80)
                    
                    // Overview
                    Text("MarketMate helps you track, manage, and grow your market stall inventory easily. Add products, record sales, and view insights — all in one app!")
                        .font(.title3)
                        .foregroundColor(.brown.opacity(0.9))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                    
                    Spacer()
                    
                    Image("MarketMate")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())              
                        .overlay(
                            Circle().stroke(Color.white, lineWidth: 4)
                        )
                        .shadow(radius: 8)
                        .padding(.top, 20)

                    
                    Spacer()
                    
                   
                    NavigationLink(destination: SignUpView()) {
                        Text("Get Started")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.brown
                                .opacity(4.0))
                            .foregroundColor(.white)
                            .font(.headline)
                            .cornerRadius(12)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 60)
                }
            }
        }
    }
}

#Preview {
    WelcomePage()
}
