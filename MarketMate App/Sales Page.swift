//
//  Sales Page.swift
//  MarketMate App
//
//  Created by admin on 16/10/2025.
//

import SwiftUI

struct Sale: Identifiable {
    let id = UUID()
    let productName: String
    let quantity: Int
    let total: Double
    let date: Date
}


struct SalesView: View {
    @State private var productName = ""
    @State private var quantity = ""
    @State private var total = ""
    @State private var sales:  [Sale] = [
        Sale(productName: "Apples", quantity: 10, total: 15.0, date: Date()),
        Sale(productName: "Bananas", quantity: 5, total: 8.0, date: Date().addingTimeInterval(-86400))
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading , spacing: 20) {
                    
                    Text("Record New Sale")
                        .font(.title2)
                        .fontWeight(.bold)
                    TextField("Product Name", text: $productName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Quantity", text: $quantity)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Total Amount($)", text: $total)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
                    
                    Button(action: addSale){
                        Text("Save Sale")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.brown)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                    }
                    .padding(.top, 5)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                
                Text("Recent Sales")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                
                VStack(spacing: 12){
                    ForEach(sales) { sale in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(sale.productName)
                                    .fontWeight(.semibold)
                                Text(sale.date, style: .date)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            VStack(alignment: .trailing){
                                Text("\(sale.quantity) units")
                                Text("\(sale.total, specifier:"%.2f")")
                                    .font(.headline)
                                    .foregroundColor(.green)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 2)
                    }
                }
            }
            .padding()
            
        }
        .navigationTitle("Sales")
    }
    private func addSale() {
            guard let qty = Int(quantity),
                  let price = Double(total),
                  !productName.isEmpty else { return }
            
            let newSale = Sale(productName: productName, quantity: qty, total: price, date: Date())
            sales.append(newSale)
            
            // Reset fields
            productName = ""
            quantity = ""
            total = ""
        }
    
}
#Preview {
    SalesView()
}
