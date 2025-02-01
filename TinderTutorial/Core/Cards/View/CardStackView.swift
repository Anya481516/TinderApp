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
      VStack(spacing: 16) {
        ZStack {
          ForEach(viewModel.cardsModels) { card in
            CardView(viewModel: viewModel, model: card)
          }
        }

        if !viewModel.cardsModels.isEmpty {
          SwipeActionButtonsView(viewModel: viewModel)
        }
      }
    }
}

#Preview {
    CardStackView()
}
