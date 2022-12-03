//
//  HomeViewBuilder.swift
//  App-ios
//
//  Created by FELIPE AUGUSTO SILVA on 03/12/22.
//

import SwiftUI
import SDKCommon

class HomeViewBuilder {

    static func build() -> some View {
        var repository: HomeViewRepository {
            AppAssembler.resolve(HomeViewRepository.self)
        }
        
        return ContentView(viewModel: ContentViewModel(repository: repository))
    }
}
