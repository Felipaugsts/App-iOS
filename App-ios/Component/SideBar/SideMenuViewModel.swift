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

    var title: String {
        switch self {

        case .profile:
            return "Profile"
        case .Favorites:
            return "Favorites"
        case .Settings:
            return "Settings"
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
                Spacer()
            }
            Spacer()
        }
    }
}
