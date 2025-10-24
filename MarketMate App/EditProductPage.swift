//
//  EditProductPage.swift
//  MarketMate App
//
//  Created by admin on 20/10/2025.
//

import SwiftUI

struct EditProductPage: View {
    @Binding var product: Product
    @Environment(\.dismiss) var dismiss
    @State private var notes_Page: String = ""
    
    
    var body: some View {
        NavigationStack{
                Form {
                    Section(header: Text("Product Details")) {
                        TextField("Product Name", text: $product.name)
                        TextField("Category", text: $product.category)
                        
                        TextField("Quantity", value: $product.quantity, format: .number)
                            .keyboardType(.numberPad)
                        
                        TextField("Price ($)", value: $product.price, format: .number)
                            .keyboardType(.decimalPad)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Description")
                                .font(.headline)
                                .foregroundColor(.gray)
                            
                            ZStack(alignment: .topLeading) {
                                if product.description.isEmpty {
                                    Text("Enter product description...")
                                        .foregroundColor(.gray.opacity(0.6))
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 12)
                                }
                                
                                TextEditor(text: $product.description)
                                    .frame(height: 100)
                                    .padding(4)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                    )
                            }
                        }
                        .padding(.vertical, 5)
                    }
                    
                    Section {
                        Button(action: {
                            dismiss()
                        }) {
                            Text("Save Changes")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                    }
                    
                    .navigationTitle("Edit Product")
                    .scrollContentBackground(.hidden)
                    .background(Color.white.opacity(0.20))
                    
                }
                
            }
        }
    }

#Preview {
    EditProductPage(product: .constant(Product(
        name: "Apples",
        category: "Fruit",
        quantity: 50,
        price: 1.20,
        description: "Fresh and delicious green apples."
    )))
    
    
}

