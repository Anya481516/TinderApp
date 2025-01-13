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

  let model: CardModel

    var body: some View {
      ZStack(alignment: .bottom) {
        ZStack(alignment: .top) {
          Image(user.profileImageURL[currentImageIndex])
            .resizable()
            .scaledToFill()
            .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
            .overlay {
              ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: imageCount)
            }

          CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: imageCount)

          SwipeActionIndicatorView(xOffset: $xOffset)
        }

        UserInfoView(user: user)
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
  var user: User {
    return model.user
  }

  var imageCount: Int {
    return user.profileImageURL.count
  }
}

private extension CardView {
  func returnToCenter() {
    xOffset = 0
    degrees = 0
  }

  func swipeRight() {
    xOffset = 500
    degrees = 12
  }

  func swipeLeft() {
    xOffset = -500
    degrees = -12
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
      returnToCenter()
      return
    }

    if width >= SizeConstants.screenCutoff {
      swipeRight()
    } else {
      swipeLeft()
    }
  }
}

#Preview {
  CardView(model: CardModel(user: MockData.users[1]))
}
