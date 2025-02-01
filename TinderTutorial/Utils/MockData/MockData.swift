//
//  MockData.swift
//  TinderTutorial
//
//  Created by Nikita Komarov on 13.01.2025.
//

import Foundation

struct MockData {
  static let users: [User] = [
    User(id: NSUUID().uuidString, fullName: "Megan Fox", age: 37, profileImageURLs: ["meganFox1", "meganFox2", "meganFox"]),
    User(id: NSUUID().uuidString, fullName: "David Beckham", age: 37, profileImageURLs: ["meganFox1", "meganFox2", "meganFox"]),
    User(id: NSUUID().uuidString, fullName: "Conor McGregor", age: 37, profileImageURLs: ["meganFox1", "meganFox2", "meganFox"]),
  ]
}
