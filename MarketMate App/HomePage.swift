//
//  HomePage.swift
//  MarketMate App
//
//  Created by admin on 16/10/2025.
//

import SwiftUI

struct HomePage: View{
    @State private var totalProducts = 100
    @State private var totalSales = 84
    @State private var totalRevenue = 5350
    var body: some View {
        NavigationStack{
            ZStack{
                Color.brown.opacity(0.20)
                    .ignoresSafeArea()
                
                ScrollView{
                    VStack(alignment: .leading, spacing: 25){
                        HStack {
                            Text("MarketMate Dashboard")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.brown)
                            
                            Spacer()
                            
                            
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.brown)
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                        
                        
                        HStack(spacing: 20) {
                            SummaryCard(title: "Products", value: "\(totalProducts)", color: .green)
                            SummaryCard(title: "Sales", value: "\(totalSales)", color: .orange)
                            SummaryCard(title: "Revenue", value: "$\(String(format: "%.2f", totalRevenue))", color: .blue)
                        }
                        .padding(.horizontal)
                        
                        
                        
                        Text("Quick Actions")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.brown)
                            .padding(.horizontal)
                        
                        HStack(spacing: 20){
                            ActionButton(title: "Add Product", icon:"plus.circle.fill", color: .green)
                            ActionButton(title: "View Inventory", icon: "tray.full.fill", color: .orange)
                            
                        }
                        .padding(.horizontal)
                        
                        
                        
                        
                        VStack(alignment: .center) {
                            Text("Recent Activity")
                                .font(.headline)
                                .foregroundColor(.brown)
                                .padding(.bottom, 5)
                            
                            ForEach(0..<5) { index in
                                VStack(alignment: .center) {
                                    Color.gray;
                                    Image(systemName: "cart.fill")
                                        .foregroundColor(.brown)
                                    Text("Sold 2 x Apples - $1.30")
                                    Text("Sold 1 pack x Bananas - $3.00")
                                    Text("Sold 3 x Pears - $2.50")
                                    Text("Sold 1 pack x - $0.90 ")
                                        .font(.subheadline)
                                        .font(.subheadline)
                                        .font(.subheadline)
                                        .font(.subheadline)
                                    Spacer()
                                    Text("Today")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                .padding(.vertical, 5)
                            }
                        }
                        
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(12)
                        .shadow(radius: 3)
                        .padding(.horizontal)
                        
                        Spacer(minLength: 40)
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("Home")
            .navigationBarHidden(true)
            
        }
    }
    
}


struct SummaryCard: View {
    var title: String
    var value: String
    var color: Color
    
    var body: some View {
        VStack(alignment: .center, spacing: 18) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white.opacity(0.8))
            Text(value)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, minHeight: 100)
        .padding()
        .background(color)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}


struct ActionButton: View {
    var title: String
    var icon: String
    var color: Color
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
            Text(title)
                .font(.footnote)
                .foregroundColor(.white)
        }
        .frame(width: 130, height: 100)
        .background(color)
        .cornerRadius(15)
        .shadow(radius: 3)
    }
}
#Preview {
    HomePage()
}
