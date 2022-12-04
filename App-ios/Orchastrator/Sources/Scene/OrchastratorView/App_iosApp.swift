//
//  App_iosApp.swift
//  App-ios
//
//  Created by FELIPE AUGUSTO SILVA on 18/11/22.
//

import SwiftUI
import SDKCommon

@main
struct App_iosApp: App {

    var isAuthenticated: Bool = false

    init() {
        SDKCommonAssemblies.register()
        MyAppAssemblies.register()
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                if isAuthenticated {
                    HomeViewBuilder.build()
                } else {
                    WelcomeView()
                }
            }
        }
    }
}
