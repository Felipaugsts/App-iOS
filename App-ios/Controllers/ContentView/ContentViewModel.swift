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

    func fetchMovies() -> Void
}
public enum ViewModelState {
    case loading
    case loaded([Post])
    case empty(String)
    case error(String)
}
public class ContentViewModel: ContentViewProtocol {

    @Published
    public var state: ViewModelState = .loading

    var network: HTTPRequestProtocol

    public init(network: HTTPRequestProtocol) {
        self.network = network
        appCommonModuleTest.instance.initFeature(externalDelegate: self)
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
                    self.loadImages(results: response)
                }
            case .failure(let error):
                print(error)
                self.setViewState(state: .error("Something went wrong"))
            }
        }
    }

    private func loadImages(results: MovieModel) {

        var carousel: [Post] = []
        for movie in results.results {
            var image: String = "https://www.viewstorm.com/wp-content/uploads/2014/10/default-img.gif"
            if let endpoint = movie.backdropPath {
                image = "https://image.tmdb.org/t/p/w500\(endpoint)"
            }
            let moviePost = Post(image: image , imageId: "\(movie.id)")

            carousel.append(moviePost)
        }
        setViewState(state: .loaded(carousel))
    }

    private func setViewState(state: ViewModelState) {
        DispatchQueue.main.async {
            self.state = state
        }
    }
}
extension ContentViewModel: AppExternalDelegateProtocol {
    public func didClickButton() {
        print("clicked module test")
    }
}
