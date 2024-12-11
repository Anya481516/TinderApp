//
//  CardImageIndicatorView.swift
//  TinderTutorial
//
//  Created by Nikita Komarov on 11.12.2024.
//

import SwiftUI

struct CardImageIndicatorView: View {
  let currentImageIndex: Int
  let imageCount: Int

    var body: some View {
      HStack {
        ForEach(0 ..< imageCount, id: \.self) { index in
          Capsule()
            .foregroundStyle(currentImageIndex == index ? .white : .gray)
            .frame(width: imageIndocatorWidth, height: 4)
            .padding(.top, 8)
        }
      }
    }
}

private extension CardImageIndicatorView {
  var imageIndocatorWidth: CGFloat {
    return SizeConstants.cardWidth / CGFloat(imageCount) - 28
  }
}

#Preview {
  CardImageIndicatorView(currentImageIndex: 1, imageCount: 4)
    .preferredColorScheme(.dark)
}
