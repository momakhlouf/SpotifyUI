//
//  Product.swift
//  SpotifyUI
//
//  Created by Mohamed Makhlouf Ahmed on 09/05/2024.
//

import Foundation

struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
    
    static var mock: Product{
        Product(
            id: 123,
            title: "Example title",
            description: "description goes here",
            price: 100,
            discountPercentage: 15,
            rating: 4.5,
            stock: 22,
            brand: "Apple",
            category: "electric",
            thumbnail: Constants.randomImage,
            images: [Constants.randomImage, Constants.randomImage]
        )
    }
}

struct ProductRow: Identifiable{
    let id = UUID().uuidString
    let title: String
    let products: [Product]
}
