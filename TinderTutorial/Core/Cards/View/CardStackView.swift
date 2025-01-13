//
//  CardStackView.swift
//  TinderTutorial
//
//  Created by Nikita Komarov on 13.01.2025.
//

import SwiftUI

struct CardStackView: View {
  @StateObject var viewModel = CardsViewModel(service: CardService())

    var body: some View {
      ZStack {
        ForEach(viewModel.cardsModels) { card in
          CardView(model: card)
        }
      }
    }
}

#Preview {
    CardStackView()
}
