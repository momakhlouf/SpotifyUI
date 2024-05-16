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

    
    func getProducts()async throws {//}-> [Product]{
        guard let url = URL(string: "https://dummyjson.com/products") else{
            throw URLError(.badURL)
        }
        let (data, _ ) = try await URLSession.shared.data(from: url)
        let products = try JSONDecoder().decode(ProductArray.self, from: data)
        Products = products.products
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



