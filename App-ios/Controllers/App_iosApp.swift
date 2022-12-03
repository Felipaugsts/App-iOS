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

    init() {
        SDKCommonAssemblies.register()
        MyAppAssemblies.register()
    }

    var repository: HomeViewRepository {
        AppAssembler.resolve(HomeViewRepository.self)
    }

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel(repository: repository))
        }
    }
}
