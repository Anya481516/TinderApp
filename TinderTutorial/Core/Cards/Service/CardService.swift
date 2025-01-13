//
//  CardService.swift
//  TinderTutorial
//
//  Created by Nikita Komarov on 13.01.2025.
//

import Foundation

struct CardService {
  func fetchCardModels() async throws -> [CardModel] {
    let users = MockData.users
    return users.map { CardModel(user: $0) }
  }
}
