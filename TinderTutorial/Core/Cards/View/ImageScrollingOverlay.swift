//
//  ImageScrollingOverlay.swift
//  TinderTutorial
//
//  Created by Nikita Komarov on 11.12.2024.
//

import SwiftUI

struct ImageScrollingOverlay: View {
  @Binding var currentImageIndex: Int
  let imageCount: Int

    var body: some View {
      HStack {
        Rectangle()
          .onTapGesture {
            updateImageIndex(false)
          }

        Rectangle()
          .onTapGesture {
            updateImageIndex(true)
          }
      }
      .foregroundStyle(.white.opacity(0.01))
    }
}

private extension ImageScrollingOverlay {
  func updateImageIndex(_ increment: Bool) {
    if increment {
      guard currentImageIndex < imageCount - 1 else { return }
      currentImageIndex += 1
    } else {
      guard currentImageIndex > 0 else { return }
      currentImageIndex -= 1
    }
  }
}

#Preview {
  ImageScrollingOverlay(currentImageIndex: .constant(0), imageCount: 1)
}
