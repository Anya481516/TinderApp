//
//  UserInfoView.swift
//  TinderTutorial
//
//  Created by Nikita Komarov on 03.12.2024.
//

import SwiftUI

struct UserInfoView: View {
    var body: some View {
      VStack(alignment: .leading) {
        HStack {
          Text("Megan")
            .font(.title)
            .fontWeight(.heavy)
          
          Text("37")
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

        Text("Actress | Witch")
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
    UserInfoView()
}
