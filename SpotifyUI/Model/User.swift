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
    let firstName, lastName, maidenName: String
    let email, phone, username, password: String
    let image: String
}
