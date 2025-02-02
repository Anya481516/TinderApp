//
//  CurrentUserProfile.swift
//  TinderTutorial
//
//  Created by Nikita Komarov on 02.02.2025.
//

import SwiftUI

struct CurrentUserProfile: View {
  @State private var showEditProfile = false
  let user: User

    var body: some View {
      NavigationStack {
        List {
          // header
          CurrentUserProfileHeaderView(user: user)
            .onTapGesture { showEditProfile.toggle() }

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
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $showEditProfile) {
          EditProfileView(user: user)
        }
      }
    }
}

#Preview {
  CurrentUserProfile(user: MockData.users[0])
}
