//
//  CardsViewModel.swift
//  TinderTutorial
//
//  Created by Nikita Komarov on 13.01.2025.
//

import Foundation

class CardsViewModel: ObservableObject {
  @Published var cardsModels = [CardModel]()

  private let service: CardService

  init(service: CardService) {
    self.service = service
    Task { await fetchCardModels() }
  }

  func fetchCardModels() async {
    do {
      self.cardsModels = try await service.fetchCardModels()
    } catch {
      print("DEBUG: Failed to fetch cards with error: \(error)")
    }
  }
}
