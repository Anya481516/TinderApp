//
//  user.swift
//  TinderTutorial
//
//  Created by Nikita Komarov on 13.01.2025.
//

import Foundation

struct User: Identifiable {
  let id: String
  let fullName: String
  var age: Int
  var profileImageURL: [String]
}

