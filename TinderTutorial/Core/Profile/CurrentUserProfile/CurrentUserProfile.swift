//
//  CurrentUserProfile.swift
//  TinderTutorial
//
//  Created by Nikita Komarov on 02.02.2025.
//

import SwiftUI

struct CurrentUserProfile: View {
  let user: User

    var body: some View {
      NavigationStack {
        List {
          // header
          CurrentUserProfileHeaderView(user: user)

          // account info
          Section("Account Information") {
            HStack {
              Text("Name")

              Spacer()

              Text(user.fullName)
            }

            HStack {
              Text("Email")

              Spacer()

              Text("test@gmail.com")
            }
          }

          // legal

          Section("Legal") {
            Text("Terms of service")
          }

          // logout/delete

          Section() {
            Button("Logout") {
              print("DEBUG: Logput here ..")
            }
            .foregroundStyle(.red)
          }

          Section() {
            Button("Delete account") {
              print("DEBUG: Delete account here ..")
            }
            .foregroundStyle(.red)
          }
        }
      }
    }
}

#Preview {
  CurrentUserProfile(user: MockData.users[0])
}
