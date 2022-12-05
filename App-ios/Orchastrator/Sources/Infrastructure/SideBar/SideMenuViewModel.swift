//
//  SideMenuViewModel.swift
//  App-ios
//
//  Created by FELIPE AUGUSTO SILVA on 18/11/22.
//

import Foundation
import SwiftUI

enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case Favorites
    case Settings
    case logout

    var title: String {
        switch self {

        case .profile:
            return "Profile"
        case .Favorites:
            return "Favorites"
        case .Settings:
            return "Settings"
        case .logout:
            return "Logout"
        }
    }
    var imageName: String {
        switch self {

        case .profile:
            return "person"
        case .Favorites:
            return "heart"
        case .Settings:
            return "bell"
        case .logout:
            return "bell"
        }
    }

    var views: some View {
        switch self {
        case .profile:
            return ProfileView()
        case .Favorites:
            return ProfileView()
        case .Settings:
            return ProfileView()
        case .logout:
            return ProfileView()
        }
    }
}

struct ProfileView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("Hello world")
                NavigationLink(destination: WelcomeView()) {
                    Text("logout")
                }
                Spacer()
            }
            Spacer()
        }
    }
}
