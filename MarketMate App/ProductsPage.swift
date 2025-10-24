//
//  ProductsPage.swift
//  MarketMate App
//
//  Created by admin on 17/10/2025.


import SwiftUI

// MARK: - Product Model
struct Product: Identifiable {
    let id = UUID()
    var name: String
    var category: String
    var quantity: Int
    var price: Double
    var description: String
}

// MARK: - Products Page
struct ProductsView: View {
    @State private var products: [Product] = [
        Product(name: "Apples", category: "Fruit", quantity: 50, price: 1.20, description: "Fresh green apples."),
        Product(name: "Bananas", category: "Fruit", quantity: 30, price: 0.80, description: "Sweet ripe bananas.")
    ]
    
    @State private var showAddProduct = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    
                    // MARK: - Feature Section
                    Text("MarketMate Features")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        let features = [
                            ("Product Management", "Easily add, edit, and view your products.", "Helps you stay organized and in control."),
                            ("Stock Tracking", "Monitor stock levels in real time.", "Prevents you from running out of stock."),
                            ("Sales Reports", "Get clear insights into your sales trends.", "Helps improve decision-making and profitability.")
                        ]
                        
                        ForEach(features, id: \.0) { feature in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(feature.0)
                                    .font(.headline)
                                Text(feature.1)
                                    .font(.subheadline)
                                Text("Benefit: \(feature.2)")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(radius: 1)
                        }
                    }
                    
                    // MARK: - Product List Section
                    HStack {
                        Text("Products")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                        Button(action: { showAddProduct = true }) {
                            Label("Add Product", systemImage: "plus.circle.fill")
                                .foregroundColor(.blue)
                        }
                    }
                    
                    // MARK: - Product List
                    ForEach(products) { product in
                        NavigationLink(destination: ProductDetailsView(product: product)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(product.name)
                                        .font(.headline)
                                    Text(product.category)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Text("$\(product.price, specifier: "%.2f")")
                                    .fontWeight(.bold)
                            }
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(12)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Products Page")
            .sheet(isPresented: $showAddProduct) {
                AddProductView()
            }
        }
    }
}

// MARK: - Product Details Page
struct ProductDetailsView: View {
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(product.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Category: \(product.category)")
                .font(.headline)
            
            Text("Quantity: \(product.quantity)")
            Text("Price: $\(product.price, specifier: "%.2f")")
            
            Text("Description:")
                .fontWeight(.semibold)
                .padding(.top, 10)
            
            Text(product.description)
                .padding(.bottom, 20)
            
            Spacer()
            
            HStack {
                Button("Edit") {
                    // TODO: Navigate to EditProductView
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Delete") {
                    // TODO: Add delete logic
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
                
            }
        }
        .padding()
        .navigationTitle("Product Details")
    }
}

#Preview {
    ProductsView()
}

