//
//  User.swift
//  SpotifyUI
//
//  Created by Mohamed Makhlouf Ahmed on 09/05/2024.
//

import Foundation

struct UserArray: Codable {
    let users: [User]
}

struct User: Codable {
    let id: Int
    let firstName, lastName: String
    let email, phone, username, password: String
    let image: String
    
    static var mock: User{
        User(
            id: 12,
            firstName: "Mohamed",
            lastName: "Makhlouf",
            email: "mo@mo.com",
            phone: "0123456789",
            username: "momakhlouf",
            password: "123123",
            image: Constants.randomImage
        )
    }
}
