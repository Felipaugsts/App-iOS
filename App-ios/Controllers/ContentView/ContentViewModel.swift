//
//  ContentViewModel.swift
//  App-ios
//
//  Created by FELIPE AUGUSTO SILVA on 18/11/22.
//

import Foundation
import SDKCommon

public protocol ContentViewProtocol: ObservableObject {
    var state: ViewModelState { get set }

    func fetchMovies() -> Void
}
public enum ViewModelState {
    case loading
    case loaded(MovieModel)
    case empty(String)
    case error(String)
}
public class ContentViewModel: ContentViewProtocol {

    @Published
    public var state: ViewModelState = .loading

    var network: HTTPRequestProtocol

    public init(network: HTTPRequestProtocol) {
        self.network = network
    }

    public func fetchMovies() {
        guard let url = URL(string: "https://api.themoviedb.org/3/tv/popular?api_key=86e8c11db101d22e54919a702fa851b4&language=en-US&") else { return }
        state = .loading

        network.fetch(url: url) { (result: Result<MovieModel, Error>) in
            switch result {
            case .success(let response):
                if response.results.isEmpty {
                    self.setViewState(state: .empty("View is empty"))
                } else {
                    self.setViewState(state: .loaded(response))
                }
            case .failure(_):
                self.setViewState(state: .error("Something went wrong"))
            }
        }
    }

    private func setViewState(state: ViewModelState) {
        DispatchQueue.main.async {
            self.state = state
        }
    }
}
