//
//  ViewInventoryPage.swift
//  MarketMate App
//
//  Created by admin on 17/10/2025.
//

import SwiftUI

struct ViewInventoryPage: View {
    @State private var products: [Product] = [
        Product(name: "Apples", category: "Fruits", quantity: 50, price: 2.99, description: "Fresh green apples"),
        Product(name: "Bread", category: "Bakery", quantity: 30, price: 1.99, description: "Whole grain bread"),
        Product(name: "Milk", category: "Dairy", quantity: 20, price: 0.99, description: "1L Fresh Milk"),
        Product(name: "Tomatoes", category: "Vegetables", quantity: 30, price: 0.60, description: "Fresh tomatoes")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                
                List {
                    ForEach(products) { product2 in
                        NavigationLink(destination: ProductDetailsView(product: product2)) {
                            HStack(spacing: 15) {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(product2.name)
                                        .font(.headline)
                                    Text("Category: \(product2.category)")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Text("Qty: \(product2.quantity) | $\(product2.price, specifier: "%.2f")")
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                            .padding(.vertical, 5)
                        }
                    }
                    .onDelete(perform: deleteProduct)
                }
                .scrollContentBackground(.hidden)
                .navigationTitle("Inventory")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: AddProductView()) {
                            Image(systemName: "plus.circle.fill")
                                .font(.title2)
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
        }
    }
    
    func deleteProduct(at offsets: IndexSet) {
        products.remove(atOffsets: offsets)
    }
}

#Preview {
    ViewInventoryPage()
}






