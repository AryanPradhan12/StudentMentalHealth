//
//  User.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 13/01/2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
