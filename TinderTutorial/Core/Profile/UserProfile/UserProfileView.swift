//
//  UserProfileView.swift
//  TinderTutorial
//
//  Created by Nikita Komarov on 01.02.2025.
//

import SwiftUI

struct UserProfileView: View {

  @Environment(\.dismiss) var dismiss
  @State private var currentImageIndex: Int = 0

  let user: User

    var body: some View {
      VStack {
        HStack {
          Text(user.fullName)
            .font(.title2)
            .fontWeight(.semibold)

          Text("\(user.age)")
            .font(.title2)

          Spacer()

          Button {
            dismiss()
          } label: {
            Image(systemName: "arrow.down.circle.fill")
              .imageScale(.large)
              .fontWeight(.bold)
              .foregroundStyle(.pink)
          }
        }
        .padding(.horizontal)

        ScrollView {
          VStack {
            ZStack(alignment: .top) {
              Image(user.profileImageURLs[currentImageIndex])
                .resizable()
                .scaledToFill()
                .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                .overlay {
                  ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: user.profileImageURLs.count)
                }

              CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: user.profileImageURLs.count)
            }

            VStack(alignment: .leading, spacing: 12) {
              Text("About me")
                .fontWeight(.semibold)

              //if let bio = user.bio {
                Text("Some test bio for now ...")
              //}
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color(.secondarySystemBackground))
            .font(.subheadline)
            .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading, spacing: 12) {
              Text("Essentials")
                .fontWeight(.semibold)

              HStack {
                Image(systemName: "person")
                Text("Woman")
                Spacer()
              }
              .font(.subheadline)

              HStack {
                Image(systemName: "arrow.down.forward.and.arrow.up.backward.circle")
                Text("Straight")
                Spacer()
              }
              .font(.subheadline)

              HStack {
                Image(systemName: "book")
                Text("Actress")
                Spacer()
              }
              .font(.subheadline)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .font(.subheadline)
            .clipShape(RoundedRectangle(cornerRadius: 10))
          }
        }
      }
    }
}

#Preview {
  UserProfileView(user: MockData.users[0])
}
