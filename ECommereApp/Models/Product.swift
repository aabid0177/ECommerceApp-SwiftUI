//
//  Product.swift
//  Stylish
//
//  Created by Aabid Khan on 09/05/24.
//

import Foundation
// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description, category: String
    let image: String
    let rating: Rating?
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}

typealias Products = [Product]
