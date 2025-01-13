//
//  CardModel.swift
//  TinderTutorial
//
//  Created by Nikita Komarov on 13.01.2025.
//

import Foundation

struct CardModel {
  let user: User
}

extension CardModel: Identifiable {
  var id: String { return user.id }
}
