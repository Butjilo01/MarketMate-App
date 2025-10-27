//
//  HomePage.swift
//  MarketMate App
//
//  Created by admin on 16/10/2025.
//

import SwiftUI

struct HomePage: View{
    @State private var totalProducts = 0
    @State private var totalSales = 0
    @State private var totalRevenue = 0.00
    @State private var isTaped = false
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
                ScrollView{
                    VStack(alignment: .leading, spacing: 25){
                        HStack {
                            Text("MarketMate Dashboard")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            
                            //MARK: TWO WAY BINDING
                            
                            NavigationLink(destination: EditProfilePage(), isActive: $isTaped) {
                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                        
                        
                        HStack(spacing: 20) {
                            SummaryCard2(title: "Products", value: "\(totalProducts)", color: .green)
                            SummaryCard2(title: "Sales", value: "\(totalSales)", color: .orange)
                            SummaryCard2(title: "Revenue", value: "$\(String(format: "%.2f", totalRevenue))", color: .blue)
                        }
                        .padding(.horizontal)
                        
                        //MARK: SUMMERY CARDS QUICK ACTIONS
                        
                        
                        Text("Quick Actions")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        
                        // Use a grid to make buttons responsive
                        let columns = [GridItem(.flexible()), GridItem(.flexible())]
                        
                        LazyVGrid(columns: columns, spacing: 20) {
                            
                            //MARK: Add Product Button
                            NavigationLink(destination: AddProductView()) {
                                VStack(spacing: 10) {
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 40)
                                        .foregroundColor(.white)
                                    Text("Add Product")
                                        .font(.footnote)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.green)
                                .cornerRadius(15)
                                .shadow(radius: 3)
                            }
                            
                            //MARK: Reports Button
                            NavigationLink(destination: ReportsView()) {
                                VStack(spacing: 10) {
                                    Image(systemName: "list.bullet")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 40)
                                        .foregroundColor(.white)
                                    Text("Reports")
                                        .font(.footnote)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(15)
                                .shadow(radius: 3)
                            }
                            
                            //MARK: View Inventory Button
                            NavigationLink(destination: ViewInventoryPage()) {
                                VStack(spacing: 10) {
                                    Image(systemName: "tray.full.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 40)
                                        .foregroundColor(.white)
                                    Text("View Inventory")
                                        .font(.footnote)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.orange)
                                .cornerRadius(15)
                                .shadow(radius: 3)
                            }
                            
                            NavigationLink(destination: SalesView()){
                                VStack(spacing: 10) {
                                    Image(systemName: "cart.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height:40)
                                        .foregroundColor(.white)
                                    Text("Sales")
                                        .font(.footnote)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                    
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.green)
                                .cornerRadius(15)
                                .shadow(radius:13)
                            }
                            
                            
                            // MARK: Edit Product Button, (two way binding)
                            NavigationLink(destination: EditProductPage(product: .constant(Product(
                                name: "Apples",
                                category: "Fruit",
                                quantity: 50,
                                price: 1.20,
                                description: "Fresh green apples"
                            )))) {
                                VStack(spacing: 10) {
                                    Image(systemName: "pencil.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 40)
                                        .foregroundColor(.white)
                                    Text("Edit Product")
                                        .font(.footnote)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.purple)
                                .cornerRadius(15)
                                .shadow(radius: 3)
                            }
                            
                            // MARK: Settings Button
                            NavigationLink(destination: SettingsView()) {
                                VStack(spacing: 10) {
                                    Image(systemName: "gearshape.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 40)
                                        .foregroundColor(.white)
                                    Text("Settings")
                                        .font(.footnote)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.gray)
                                .cornerRadius(15)
                                .shadow(radius: 3)
                            }
                            
                            
                            
                        }
                        .padding(.horizontal)
                        
                        
                        
                        //MARK: RECENT ACTIVITIES
                        
                        VStack(alignment: .center) {
                            Text("Recent Activity")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .padding(.bottom, 5)
                            
                            ForEach(0..<5) { index in
                                VStack(alignment: .center) {
                                    Color.green;
                                    Image(systemName: "cart.fill")
                                        .foregroundColor(.orange)
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
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(12)
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


struct SummaryCard2: View {
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
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(color)
        .cornerRadius(15)
        .shadow(radius: 3)
    }
}
#Preview {
    HomePage()
}
