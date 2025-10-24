//
//  AddProduct.swift
//  MarketMate App
//
//  Created by admin on 16/10/2025.
//

import SwiftUI

struct AddProductView: View {
    @State private var productName = ""
    @State private var productPrice = ""
    @State private var productQuantity = ""

    var body: some View {
        VStack(spacing: 20) {

            TextField("Product Name", text: $productName)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Price", text: $productPrice)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Quantity", text: $productQuantity)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                print("Product Added: \(productName)")
            }) {
                Text("Save Product")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top)

            Spacer()
        }
        .padding()
        .navigationTitle("Add Product")
    }
}
#Preview {
    AddProductView()
}
