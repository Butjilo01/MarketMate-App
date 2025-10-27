//
//  ReportsPage.swift
//  MarketMate App
//
//  Created by admin on 21/10/2025.
//

import SwiftUI
import Charts

// MARK: - Data Models
struct SaleData: Identifiable {
    let id = UUID()
    let product: String
    let quantity: Int
    let total: Double
    let date: Date
}

struct InventoryItem: Identifiable {
    let id = UUID()
    let name: String
    let quantity: Int
    let price: Double
}

// MARK: - Main Reports View
struct ReportsView: View {
    @State private var salesData: [SaleData] = [
        SaleData(product: "Apples", quantity: 10, total: 120, date: Date().addingTimeInterval(-86400 * 1)),
        SaleData(product: "Bananas", quantity: 20, total: 200, date: Date().addingTimeInterval(-86400 * 2)),
        SaleData(product: "Oranges", quantity: 15, total: 150, date: Date().addingTimeInterval(-86400 * 3)),
        SaleData(product: "Grapes", quantity: 8, total: 80, date: Date().addingTimeInterval(-86400 * 4))
    ]
    
    @State private var inventory: [InventoryItem] = [
        InventoryItem(name: "Apples", quantity: 15, price: 1.20),
        InventoryItem(name: "Bananas", quantity: 5, price: 0.90),
        InventoryItem(name: "Oranges", quantity: 2, price: 1.50),
        InventoryItem(name: "Grapes", quantity: 0, price: 2.00)
    ]
    
    @State private var selectedRange = "This Month"
    let dateRanges = ["Today", "This Week", "This Month", "Custom"]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 25) {
                    
                    // MARK: - Filters & Date Range
                    Picker("Select Range", selection: $selectedRange) {
                        ForEach(dateRanges, id: \.self) { range in
                            Text(range)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                    
                    // MARK: - Sales Summary
                    VStack(spacing: 10) {
                        Text("Sales Summary")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        HStack(spacing: 15) {
                            SummaryCard1(title: "Total Sales", value: "$\(totalSales, default: "%.2f")", color: .green)
                            SummaryCard1(title: "Units Sold", value: "\(totalUnits)", color: .orange)
                            SummaryCard1(title: "Avg Sale", value: "$\(averageSale, default: "%.2f")", color: .blue)
                        }
                    }
                    
                    // MARK: - Visual Charts
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Sales Trends")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Chart {
                            ForEach(salesData) { sale in
                                LineMark(
                                    x: .value("Date", sale.date),
                                    y: .value("Total", sale.total)
                                )
                                .foregroundStyle(.green)
                            }
                        }
                        .frame(height: 200)
                        
                        Text("Category Distribution")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Chart {
                            ForEach(salesData) { sale in
                                BarMark(
                                    x: .value("Product", sale.product),
                                    y: .value("Total", sale.total)
                                )
                                .foregroundStyle(by: .value("Product", sale.product))
                            }
                        }
                        .frame(height: 200)
                    }
                    .padding(.horizontal)
                    
                    // MARK: - Inventory Insights
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Inventory Insights")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        ForEach(inventory) { item in
                            if item.quantity <= 3 {
                                HStack {
                                    Text(item.name)
                                        .fontWeight(.semibold)
                                    Spacer()
                                    Text(item.quantity == 0 ? "Out of Stock" : "Low Stock")
                                        .foregroundColor(.red)
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(12)
                                .shadow(radius: 1)
                            }
                        }
                        
                        Text("Total Stock Value: $\(stockValue, specifier: "%.2f")")
                            .font(.headline)
                            .padding(.top, 8)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                    
                    // MARK: - Export Options
                    HStack(spacing: 20) {
                        Button(action: {
                            print("Export PDF tapped")
                        }) {
                            Label("Export PDF", systemImage: "doc.fill")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            print("Print Report tapped")
                        }) {
                            Label("Print", systemImage: "printer.fill")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    
                    // MARK: - Recent Transactions
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Recent Transactions")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        ForEach(salesData) { sale in
                            HStack {
                                Text(sale.product)
                                Spacer()
                                Text("$\(sale.total, specifier: "%.2f")")
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(radius: 1)
                        }
                    }
                    .padding(.horizontal)
                    
                    // MARK: - Smart Insights
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Insights")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Your best-selling item this month is Bananas!")
                        Text("Sales have increased by 15% compared to last month!")
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 1)
                }
                .padding()
            }
            .background(Color.white.ignoresSafeArea())
            .navigationTitle("Reports")
        }
    }
    
    // MARK: - Computed Properties
    private var totalSales: Double {
        salesData.reduce(0) { $0 + $1.total }
    }
    
    private var totalUnits: Int {
        salesData.reduce(0) { $0 + $1.quantity }
    }
    
    private var averageSale: Double {
        salesData.isEmpty ? 0 : totalSales / Double(salesData.count)
    }
    
    private var stockValue: Double {
        inventory.reduce(0) { $0 + (Double($1.quantity) * $1.price) }
    }
}

// MARK: - Summary Card Component
struct SummaryCard1: View {
    var title: String
    var value: String
    var color: Color
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.white.opacity(0.8))
            Text(value)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, minHeight: 80)
        .background(color)
        .cornerRadius(15)
        .shadow(radius: 3)
    }
}

#Preview {
    ReportsView()
}
