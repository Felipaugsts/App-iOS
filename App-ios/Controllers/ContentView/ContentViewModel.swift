//
//  ContentViewModel.swift
//  App-ios
//
//  Created by FELIPE AUGUSTO SILVA on 18/11/22.
//

import Foundation
import SDKCommon
import AppComponent

public protocol ContentViewProtocol: ObservableObject {
    var state: ViewModelState { get set }

    func loadMovies()
}

// MARK: - Implementation

public class ContentViewModel: ContentViewProtocol {

    // MARK: - Variable

    @Published
    public var state: ViewModelState = .loading
    var repository: HomeViewRepository

    // MARK: - Initializer

    public init(repository: HomeViewRepository) {
        self.repository = repository
        appCommonModuleTest.instance.initFeature(externalDelegate: self)
        setupListeners()
    }

    // MARK: Public Method

    public func loadMovies() {
        repository.fetchPopular()
    }

    // MARK: - Private methods

    private func setupListeners() {
        repository.popularState.bind { state in
            self.set(state: state)
        }
    }

    private func set(state: ViewModelState) {
        DispatchQueue.main.async {
            self.state = state
        }
    }
}

// To be removed

extension ContentViewModel: AppExternalDelegateProtocol {
    public func didClickButton() {
        print("clicked module test")
    }
}

// MARK: - ENUM

public enum ViewModelState {
    case loading
    case loaded([Post])
    case empty(String)
    case error(String)
}
