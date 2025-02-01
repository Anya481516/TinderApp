//
//  CardsViewModel.swift
//  TinderTutorial
//
//  Created by Nikita Komarov on 13.01.2025.
//

import Foundation

@MainActor
class CardsViewModel: ObservableObject {
  @Published var cardsModels = [CardModel]()
  @Published var buttonSwipeAction: SwipeAction?

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

  func removeCard(_ card: CardModel) {
    guard let index = cardsModels.firstIndex(where: {$0.id == card.id}) else { return }
    cardsModels.remove(at: index)
//    Task {
//      try await Task.sleep(for: .seconds(1))
//      guard let index = cardsModels.firstIndex(where: {$0.id == card.id}) else { return }
//      cardsModels.remove(at: index)
//    } // before iOS 17, because we dont have the completion in withAnimation
  }
}
