//
//  CardView.swift
//  TinderTutorial
//
//  Created by Nikita Komarov on 03.12.2024.
//

import SwiftUI

struct CardView: View {

  @State private var xOffset: CGFloat = 0
  @State private var degrees: Double = 0
  @State private var currentImageIndex = 0

  @State private var mockImages = [
    "meganFox",
    "meganFox1",
    "meganFox2",
  ]

    var body: some View {
      ZStack(alignment: .bottom) {
        ZStack(alignment: .top) {
          Image(mockImages[currentImageIndex])
            .resizable()
            .scaledToFill()
            .overlay {
              ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: mockImages.count)
            }

          CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: mockImages.count)

          SwipeActionIndicatorView(xOffset: $xOffset)
        }

        UserInfoView()
      }
      .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
      .clipShape(RoundedRectangle(cornerRadius: 10))
      .offset(x: xOffset)
      .rotationEffect(.degrees(degrees))
      .animation(.snappy, value: xOffset)
      .gesture(
        DragGesture()
          .onChanged(onDragChanged)
          .onEnded(onDragEnded)
      )
    }
}

private extension CardView {
  func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
    xOffset = value.translation.width
    degrees = Double(value.translation.width / 25)
  }
  func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
    let width = value.translation.width

    if abs(width) <= abs(SizeConstants.screenCutoff) {
      xOffset = 0
      degrees = 0
    }
  }
}

#Preview {
    CardView()
}
