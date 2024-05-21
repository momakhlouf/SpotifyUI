//
//  DatabaseHelper.swift
//  SpotifyUI
//
//  Created by Mohamed Makhlouf Ahmed on 09/05/2024.
//

import Foundation

class ViewModel: ObservableObject{

    @Published var Products : [Product] = []
    @Published var users : [Product] = []
    @Published var productRows: [ProductRow] = []

    
    func getProducts()async throws {//}-> [Product]{
        guard Products.isEmpty else {return}
        guard let url = URL(string: "https://dummyjson.com/products") else{
            throw URLError(.badURL)
        }
        let (data, _ ) = try await URLSession.shared.data(from: url)
        let products = try JSONDecoder().decode(ProductArray.self, from: data)
        Products = products.products
        
        var rows: [ProductRow] = []
        let allBrands = Set(Products.map({$0.brand}))
        for brand in allBrands{
        //    let products = self.Products.filter({$0.brand == brand})
            rows.append(ProductRow(title: brand.capitalized, products: Products))
        }
        productRows = rows
      //  return products.products
    }
    
    func getUsers()async throws -> [User]{
        guard let url = URL(string: "https://dummyjson.com/users") else{
            throw URLError(.badURL)
        }
        let (data, _ ) = try await URLSession.shared.data(from: url)
        let users = try JSONDecoder().decode(UserArray.self, from: data)
        return users.users
    }
}



