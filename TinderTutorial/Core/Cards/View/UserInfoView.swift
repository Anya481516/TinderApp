//
//  UserInfoView.swift
//  TinderTutorial
//
//  Created by Nikita Komarov on 03.12.2024.
//

import SwiftUI

struct UserInfoView: View {
  let user: User

    var body: some View {
      VStack(alignment: .leading) {
        HStack {
          Text(user.fullName)
            .font(.title)
            .fontWeight(.heavy)
          
          Text("\(user.age)")
            .font(.title)
            .fontWeight(.semibold)
          
          Spacer()
          Button {
            print("DEGUG: Show profile here")
          } label: {
            Image(systemName: "arrow.up.circle")
              .fontWeight(.bold)
              .imageScale(.large)
          }
        }

        Text("Some test bio")
          .font(.subheadline)
          .lineLimit(2)
      }
      .foregroundStyle(.white)
      .padding()
      .background(
        LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
      )
    }
}

#Preview {
  UserInfoView(user: MockData.users[1])
}
