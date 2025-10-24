//
//  Product.swift
//  MarketMate App
//
//  Created by admin on 20/10/2025.
//

import Foundation

struct Product2: Identifiable {
    let id = UUID()
    var name: String
    var category: String
    var quantity: Int
    var price: Double
    var description: String
    var imageName: String
}

