//
//  myAppAssemblies.swift
//  App-ios
//
//  Created by FELIPE AUGUSTO SILVA on 18/11/22.
//

import Foundation
import SDKCommon

public enum MyAppAssemblies {
    public static func register() {
        AppAssembler.apply(myAppAssembliesRegistration())
    }
}

final class myAppAssembliesRegistration: AppAssembly {
    func assemble(container: AppsContainer) {
        container.autoregister((any ContentViewProtocol).self, initializer: ContentViewModel.init).inObjectScope(.container)
        container.autoregister(HomeViewRepository.self, initializer: DefaultHomeViewRepository.init).inObjectScope(.container)
        container.autoregister(AuthenticationProtocol.self, initializer: AuthenticationViewModel.init).inObjectScope(.container)
    }
}
